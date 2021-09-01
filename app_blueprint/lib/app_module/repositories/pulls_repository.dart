import 'package:app_blueprint/app_module/datasource/info_repository_datasource.dart';
import 'package:app_blueprint/app_module/errors/errors.dart';
import 'package:app_blueprint/app_module/models/pulls_model.dart';
import 'package:dartz/dartz.dart';

abstract class PullsRepository {
    Future<Either<Failure, List<PullsModel>>> retrieveListPullsByRepository(String url);
}

class PullsRepositoryImpl implements PullsRepository {
    final InfoRepositoryDatasource userDatasource;

    PullsRepositoryImpl({required this.userDatasource});

    @override
    Future<Either<Failure, List<PullsModel>>> retrieveListPullsByRepository(String url) async {
        try {
            final result = await userDatasource.retrieveListPullsByRepository(url);

            if(result.length > 0) {
                result.forEach((element) {
                    if(element.closed_at != null) {
                        DateTime created = DateTime.parse(element.created_at);
                        DateTime closed = DateTime.parse(element.closed_at!);
                        element.differenceTime = closed.difference(created);
                    }
                });
                return Right(result);
            }
            else
                return Left(EmptyList());
        } catch (e) {
            print(e);
            return Left(DatasourceError());
        }
    }
}