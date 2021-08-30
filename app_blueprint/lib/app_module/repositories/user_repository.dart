import 'package:app_blueprint/app_module/datasource/storage_datasource.dart';
import 'package:app_blueprint/app_module/datasource/info_repository_datasource.dart';
import 'package:app_blueprint/app_module/errors/errors.dart';
import 'package:app_blueprint/app_module/models/repos_model.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Failure, List<ReposModel>>> retrieveListRepositories({required int page});
}

class UserRepositoryImpl implements UserRepository {
  final InfoRepositoryDatasource userDatasource;
  final StorageDatasource storage;

  UserRepositoryImpl({required this.userDatasource, required this.storage});

  @override
  Future<Either<Failure, List<ReposModel>>> retrieveListRepositories({required int page}) async {
      try {
          String? _token = await storage.read('API-Token', String);

          if(_token == null)
              return Left(EmptyTokenAPI());
          else {
              final result = await userDatasource.retrieveListRepositoriesByUserToken(token: _token, page: page);
              return Right(result);
          }
      } catch (e) {
          print(e);
          return Left(DatasourceError());
      }
  }
}