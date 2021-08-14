import 'package:app_blueprint/app_module/errors/errors.dart';
import 'package:app_blueprint/app_module/models/repos_model.dart';
import 'package:app_blueprint/app_module/repository/user_repository.dart';
import 'package:app_blueprint/utils/local_storage.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class RetrieveUserRepositoriesUseCase {
  Future<Either<Failure, List<ReposModel>>> execute();
}

class RetrieveUserRepositoriesUseCaseImpl implements RetrieveUserRepositoriesUseCase {
  final UserRepository userRepository;

  RetrieveUserRepositoriesUseCaseImpl({required this.userRepository});

  @override
  Future<Either<Failure, List<ReposModel>>> execute() async {
      final token = await Modular.get<LocalStorage>().read('API-Token', String);

      if(token == null)
          return Left(EmptyTokenAPI());
      else
          return userRepository.retrieveRepositories(token);
  }
}