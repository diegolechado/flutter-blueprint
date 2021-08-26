import 'package:app_blueprint/app_module/errors/errors.dart';
import 'package:app_blueprint/app_module/models/repos_model.dart';
import 'package:app_blueprint/app_module/repositories/user_repository.dart';
import 'package:app_blueprint/app_module/datasource/storage_datasource.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepositoriesUseCase {
  Future<Either<Failure, List<ReposModel>>> execute();
}

class UserRepositoriesUseCaseImpl implements UserRepositoriesUseCase {
  final UserRepository userRepository;
  final SharedPreferencesDatasource storage;

  UserRepositoriesUseCaseImpl({required this.userRepository, required this.storage});

  @override
  Future<Either<Failure, List<ReposModel>>> execute() async {
      String? token = await storage.read('API-Token', String);

      if(token == null)
          return Left(EmptyTokenAPI());
      else
          return userRepository.retrieveListRepositories(token);
  }
}