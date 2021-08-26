import 'package:app_blueprint/app_module/datasource/user_datasource.dart';
import 'package:app_blueprint/app_module/errors/errors.dart';
import 'package:app_blueprint/app_module/models/repos_model.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Failure, List<ReposModel>>> retrieveListRepositories(String token);
}

class UserRepositoryImpl implements UserRepository {
  final UserDatasource userDatasource;

  UserRepositoryImpl({required this.userDatasource});

  @override
  Future<Either<Failure, List<ReposModel>>> retrieveListRepositories(String token) async {
      try {
          final result1 = userDatasource.retrieveListRepositories(token, 1);
          final result2 = userDatasource.retrieveListRepositories(token, 2);
          final result3 = userDatasource.retrieveListRepositories(token, 3);

          final result = await Future.wait([result1, result2, result3]);

          List<ReposModel> list = result[0] + result[1] + result[2];

          return Right(list);
      } catch (e) {
          print(e);
          return Left(DatasourceError());
      }
  }
}