import 'package:app_blueprint/app_module/repository/user_repository.dart';
import 'package:app_blueprint/utils/connect_util.dart';
import 'package:app_blueprint/utils/local_storage_util.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'datasource/user_datasource.dart';
import 'use_case/user_repositories_usecase.dart';
import 'blocs/home/home_bloc.dart';
import 'screens/home_screen.dart';
import 'screens/settings_screen.dart';

class AppModule extends Module {
    @override
    final List<Bind> binds = [
        Bind((i) => LocalStorageUtil()),
        Bind((i) => Dio()),
        Bind((i) => DioConnectDataSource(dio: i())),
        Bind((i) => GitHubDatasource(dio: i())),
        Bind((i) => UserRepositoryImpl(userDatasource: i())),
        Bind((i) => UserRepositoriesUseCaseImpl(userRepository: i(), storage: i())),
        Bind.singleton((i) => HomeBloc(i())),
    ];

    @override
    final List<ModularRoute> routes = [
        ChildRoute(Modular.initialRoute, child: (_, __) => HomeScreen()),
        ChildRoute('/settings', child: (_, args) => SettingsScreen())
    ];
}