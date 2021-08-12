import 'package:app_blueprint/utils/remote_datasource.dart';
import 'package:app_blueprint/utils/local_storage.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'datasource/user_datasource.dart';
import 'repository/user_repository.dart';
import 'use_case/retrieve_user_repositories_use_case.dart';
import 'blocs/home/home_bloc.dart';
import 'screens/home_screen.dart';
import 'screens/settings_screen.dart';

class AppModule extends Module {
    @override
    final List<Bind> binds = [
        Bind((i) => RemoteDataSource()),
        Bind.singleton((i) => LocalStorage()),
        Bind((i) => GitHubDatasource(client: i())),
        Bind((i) => UserRepositoryImpl(userDatasource: i())),
        Bind((i) => RetrieveUserRepositoriesUseCaseImpl(userRepository: i())),
        Bind.singleton((i) => HomeBloc(i())),
    ];

    @override
    final List<ModularRoute> routes = [
        ChildRoute(Modular.initialRoute, child: (_, __) => HomeScreen()),
        ChildRoute('/settings', child: (_, args) => SettingsScreen())
    ];
}