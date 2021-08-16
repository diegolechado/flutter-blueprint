import 'package:app_blueprint/app_module/errors/errors.dart';
import 'package:app_blueprint/app_module/models/repos_model.dart';
import 'package:app_blueprint/app_module/repository/user_repository.dart';
import 'package:app_blueprint/utils/local_storage_util.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepositoriesUseCase {
  Future<Either<Failure, List<ReposModel>>> execute();
}

class UserRepositoriesUseCaseImpl implements UserRepositoriesUseCase {
  final UserRepository userRepository;
  final LocalStorageUtil storage;

  UserRepositoriesUseCaseImpl({required this.userRepository, required this.storage});

  @override
  Future<Either<Failure, List<ReposModel>>> execute() async {
      String? token = await storage.read('API-Token', String);

      if(token == null)
          return Left(EmptyTokenAPI());
      else
          return userRepository.retrieveRepositories(token);
  }
}