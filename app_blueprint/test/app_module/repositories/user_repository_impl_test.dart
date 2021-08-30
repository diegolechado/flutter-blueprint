import 'package:app_blueprint/app_module/errors/errors.dart';
import 'package:app_blueprint/app_module/models/repos_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock/mock.dart';

main() {
    final datasource = GitHubDatasourceMock();
    final storage = SharedPreferencesDatasourceMock();
    final repository = UserRepositoryImplMock();

    test(
        'Deve retornar uma lista de ReposModel',
        () async {
          when(() => storage.read('API-Token', String)).thenAnswer((_) async => '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');

          when(() => datasource.retrieveListRepositoriesByUserToken(
              token: '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',
              page: 1)).thenAnswer((_) async => <ReposModel>[]);

          var result = await repository.retrieveListRepositories(page: 1);

          expect(result | [], isA<List<ReposModel>>());
        }
    );

    test(
        'Deve retornar um EmptyTokenAPI caso não tenha o token salvo',
        () async {
          when(() => storage.read('API-Token', String)).thenAnswer((_) async => null);

          var result = await repository.retrieveListRepositories(page: 1);

          final error = result.fold<Failure?>(id, (_) => null);

          expect(error, isA<EmptyTokenAPI>());
        }
    );

    test(
        'Deve retornar um DatasourceError caso seja lançado um erro no datasource',
        () async {
          when(() => datasource.retrieveListRepositoriesByUserToken(
              token: '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',
              page: 1)).thenThrow(Exception());

          var result = await repository.retrieveListRepositories(page: 1);

          final error = result.fold<Failure?>(id, (_) => null);

          expect(error, isA<DatasourceError>());
        }
    );
}