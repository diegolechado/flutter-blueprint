import 'package:app_blueprint/app_module/datasource/user_datasource.dart';
import 'package:app_blueprint/app_module/errors/errors.dart';
import 'package:app_blueprint/app_module/models/repos_model.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Failure, ReposModel>> retrieveRepositories(String name);
}

class UserRepositoryImpl implements UserRepository {
  final UserDatasource userDatasource;

  UserRepositoryImpl({required this.userDatasource});

  @override
  Future<Either<Failure, ReposModel>> retrieveRepositories(String name) async {
      try {
          final result = await userDatasource.retrieveRepositories(name);
          return Right(result);
      } catch (e) {
          return Left(DatasourceError());
      }
  }
}