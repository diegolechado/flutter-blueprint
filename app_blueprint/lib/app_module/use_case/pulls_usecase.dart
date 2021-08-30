import 'package:app_blueprint/app_module/errors/errors.dart';
import 'package:app_blueprint/app_module/models/pulls_model.dart';
import 'package:app_blueprint/app_module/repositories/pulls_repository.dart';
import 'package:dartz/dartz.dart';

abstract class PullsUseCase {
    Future<Either<Failure, List<PullsModel>>> execute(String url);
}

class PullsUseCaseImpl implements PullsUseCase {
    final PullsRepository pullsRepository;

    PullsUseCaseImpl({required this.pullsRepository});

    @override
    Future<Either<Failure, List<PullsModel>>> execute(String url) async {
        return pullsRepository.retrieveListPullsByRepository(url);
    }
}