import 'package:app_blueprint/app_module/errors/errors.dart';
import 'package:app_blueprint/app_module/models/repos_model.dart';
import 'package:app_blueprint/app_module/repository/user_repository.dart';
import 'package:dartz/dartz.dart';

abstract class RetrieveUserRepositoriesUseCase {
  Future<Either<Failure, ReposModel>> execute(String name);
}

class RetrieveUserRepositoriesUseCaseImpl implements RetrieveUserRepositoriesUseCase {
  final UserRepository userRepository;

  RetrieveUserRepositoriesUseCaseImpl({required this.userRepository});

  @override
  Future<Either<Failure, ReposModel>> execute(String name) async {
      name = name.trim().replaceAll(' ', '+');

      if(name == '')
          return Left(InvalidName());
      else
          return userRepository.retrieveRepositories(name);
  }
}