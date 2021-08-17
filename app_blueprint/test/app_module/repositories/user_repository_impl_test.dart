import 'package:app_blueprint/app_module/errors/errors.dart';
import 'package:app_blueprint/app_module/models/repos_model.dart';
import 'package:app_blueprint/app_module/repository/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock/mock.dart';

main() {
    final datasource = UserDatasourceMock();
    final repository = UserRepositoryImpl(userDatasource: datasource);

    test(
        'Deve retornar uma lista de ReposModel',
        () async {
          when(() => datasource.retrieveRepositories('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')).thenAnswer((_) async => <ReposModel>[]);
          var result = await repository.retrieveRepositories("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");
          expect(result | [], isA<List<ReposModel>>());
        }
    );

    test(
        'Deve retornar um DatasourceError caso seja lançado um erro no datasource',
        () async {
          when(() => datasource.retrieveRepositories('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')).thenThrow(Exception());
          var result = await repository.retrieveRepositories("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");
          final error = result.fold<Failure?>(id, (_) => null);
          expect(error, isA<DatasourceError>());
        }
    );
}