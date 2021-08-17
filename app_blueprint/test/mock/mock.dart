import 'package:app_blueprint/app_module/datasource/user_datasource.dart';
import 'package:app_blueprint/app_module/repository/user_repository.dart';
import 'package:app_blueprint/app_module/use_case/user_repositories_usecase.dart';
import 'package:app_blueprint/utils/local_storage_util.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';

class LocalStorageUtilMock extends Mock implements LocalStorageUtil { }

class DioMock extends Mock implements Dio { }

class UserDatasourceMock extends Mock implements UserDatasource { }

class UserRepositoryMock extends Mock implements UserRepository { }

class UserRepositoriesUseCaseMock extends Mock implements UserRepositoriesUseCase { }