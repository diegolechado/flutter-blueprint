import 'package:app_blueprint/app_module/blocs/pulls/pulls_bloc.dart';
import 'package:app_blueprint/app_module/repositories/pulls_repository.dart';
import 'package:app_blueprint/app_module/repositories/user_repository.dart';
import 'package:app_blueprint/app_module/datasource/connect_datasource.dart';
import 'package:app_blueprint/app_module/datasource/storage_datasource.dart';
import 'package:app_blueprint/app_module/screens/pulls_screen.dart';
import 'package:app_blueprint/app_module/use_case/pulls_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'datasource/user_datasource.dart';
import 'use_case/user_repositories_usecase.dart';
import 'blocs/home/home_bloc.dart';
import 'screens/home_screen.dart';
import 'screens/settings_screen.dart';

class AppModule extends Module {
    @override
    final List<Bind> binds = [
        Bind((i) => DioConnectDatasource()),
        Bind((i) => SharedPreferencesDatasource()),
        Bind((i) => GitHubDatasource(dioConnect: i())),
        Bind((i) => UserRepositoryImpl(userDatasource: i())),
        Bind((i) => UserRepositoriesUseCaseImpl(userRepository: i(), storage: i())),
        Bind.singleton((i) => HomeBloc(i())),
        Bind((i) => PullsRepositoryImpl(userDatasource: i())),
        Bind((i) => PullsUseCaseImpl(pullsRepository: i(), storage: i())),
        Bind.factory((i) => PullsBloc(i())),
    ];

    @override
    final List<ModularRoute> routes = [
        ChildRoute(Modular.initialRoute, child: (_, __) => HomeScreen()),
        ChildRoute('/settings', child: (_, args) => SettingsScreen()),
        ChildRoute('/pulls', child: (_, args) => PullsScreen(name: args.data["name"], url: args.data["url"]))
    ];
}