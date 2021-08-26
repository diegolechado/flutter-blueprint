import 'package:app_blueprint/app_module/datasource/storage_datasource.dart';
import 'package:app_blueprint/app_module/errors/errors.dart';
import 'package:app_blueprint/app_module/models/pulls_model.dart';
import 'package:app_blueprint/app_module/repositories/pulls_repository.dart';
import 'package:dartz/dartz.dart';

abstract class PullsUseCase {
    Future<Either<Failure, List<PullsModel>>> execute(String url);
}

class PullsUseCaseImpl implements PullsUseCase {
    final PullsRepository pullsRepository;
    final SharedPreferencesDatasource storage;

    PullsUseCaseImpl({required this.pullsRepository, required this.storage});

    @override
    Future<Either<Failure, List<PullsModel>>> execute(String url) async {
        String? token = await storage.read('API-Token', String);

        if(token == null)
            return Left(EmptyTokenAPI());
        else
            return pullsRepository.retrievePullsList(token, url);
    }
}