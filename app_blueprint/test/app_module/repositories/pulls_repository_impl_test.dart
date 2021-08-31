import 'package:app_blueprint/app_module/errors/errors.dart';
import 'package:app_blueprint/app_module/models/pulls_model.dart';
import 'package:app_blueprint/app_module/repositories/pulls_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock/mock.dart';

main() {
  final datasource = GitHubDatasourceMock();
  final repository = PullsRepositoryImpl(userDatasource: datasource);

  test(
      'Deve retornar uma lista de PullsModel',
      () async {
          when(() => datasource.retrieveListPullsByRepository("http://api.url.com/repo"))
              .thenAnswer((_) async => <PullsModel>[]);

          var result = await repository.retrieveListPullsByRepository("http://api.url.com/repo");

          expect(result | [], isA<List<PullsModel>>());
      }
  );

  test(
      'Deve retornar um DatasourceError caso seja lançado um erro no datasource',
      () async {
          when(() => datasource.retrieveListPullsByRepository("http://api.url.com/repo"))
              .thenThrow(Exception());

          var result = await repository.retrieveListPullsByRepository("http://api.url.com/repo");

          final error = result.fold<Failure?>(id, (_) => null);

          expect(error, isA<DatasourceError>());
      }
  );
}