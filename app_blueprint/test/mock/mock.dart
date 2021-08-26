import 'package:app_blueprint/app_module/datasource/connect_datasource.dart';
import 'package:app_blueprint/app_module/datasource/user_datasource.dart';
import 'package:app_blueprint/app_module/repositories/pulls_repository.dart';
import 'package:app_blueprint/app_module/repositories/user_repository.dart';
import 'package:app_blueprint/app_module/use_case/pulls_usecase.dart';
import 'package:app_blueprint/app_module/use_case/user_repositories_usecase.dart';
import 'package:app_blueprint/app_module/datasource/storage_datasource.dart';
import 'package:mocktail/mocktail.dart';

class SharedPreferencesDatasourceMock extends Mock implements SharedPreferencesDatasource {}

class DioConnectDatasourceMock extends Mock implements DioConnectDatasource {}

class UserDatasourceMock extends Mock implements UserDatasource {}

class UserRepositoryMock extends Mock implements UserRepository {}

class PullsRepositoryMock extends Mock implements PullsRepository {}

class UserRepositoriesUseCaseMock extends Mock implements UserRepositoriesUseCase {}

class PullsUseCaseMock extends Mock implements PullsUseCase {}