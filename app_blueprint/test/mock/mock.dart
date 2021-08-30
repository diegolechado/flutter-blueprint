import 'package:app_blueprint/app_module/datasource/connect_datasource.dart';
import 'package:app_blueprint/app_module/datasource/info_repository_datasource.dart';
import 'package:app_blueprint/app_module/repositories/pulls_repository.dart';
import 'package:app_blueprint/app_module/repositories/settings_repository.dart';
import 'package:app_blueprint/app_module/repositories/user_repository.dart';
import 'package:app_blueprint/app_module/use_case/pulls_usecase.dart';
import 'package:app_blueprint/app_module/use_case/settings_usecase.dart';
import 'package:app_blueprint/app_module/use_case/user_repositories_usecase.dart';
import 'package:app_blueprint/app_module/datasource/storage_datasource.dart';
import 'package:mocktail/mocktail.dart';

//DataSource
class SharedPreferencesDatasourceMock extends Mock implements SharedPreferencesDatasource {}
class DioConnectDatasourceMock extends Mock implements DioConnectDatasource {}
class GitHubDatasourceMock extends Mock implements GitHubDatasource {}

//Repository
class UserRepositoryImplMock extends Mock implements UserRepositoryImpl {}
class PullsRepositoryImplMock extends Mock implements PullsRepositoryImpl {}
class SettingsRepositoryImplMock extends Mock implements SettingsRepositoryImpl {}

// Usecase
class UserRepositoriesUseCaseImplMock extends Mock implements UserRepositoriesUseCaseImpl {}
class PullsUseCaseImplMock extends Mock implements PullsUseCaseImpl {}
class SettingsUseCaseImplMock extends Mock implements SettingsUseCaseImpl {}