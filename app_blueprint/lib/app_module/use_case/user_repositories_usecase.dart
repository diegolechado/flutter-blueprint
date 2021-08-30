import 'package:app_blueprint/app_module/errors/errors.dart';
import 'package:app_blueprint/app_module/models/repos_model.dart';
import 'package:app_blueprint/app_module/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepositoriesUseCase {
  Future<Either<Failure, List<ReposModel>>> execute({required int page});
}

class UserRepositoriesUseCaseImpl implements UserRepositoriesUseCase {
  final UserRepository userRepository;

  UserRepositoriesUseCaseImpl({required this.userRepository});

  @override
  Future<Either<Failure, List<ReposModel>>> execute({required int page}) async {
      return userRepository.retrieveListRepositories(page: page);
  }
}