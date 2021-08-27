import 'package:flutter_modular/flutter_modular.dart';
import 'blocs/pulls/pulls_bloc.dart';
import 'blocs/home/home_bloc.dart';
import 'repositories/pulls_repository.dart';
import 'repositories/user_repository.dart';
import 'datasource/connect_datasource.dart';
import 'datasource/storage_datasource.dart';
import 'datasource/user_datasource.dart';
import 'use_case/user_repositories_usecase.dart';
import 'use_case/pulls_usecase.dart';
import 'screens/home_screen.dart';
import 'screens/pulls_screen.dart';
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