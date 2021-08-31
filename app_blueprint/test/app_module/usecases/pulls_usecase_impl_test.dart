import 'package:app_blueprint/app_module/models/pulls_model.dart';
import 'package:app_blueprint/app_module/use_case/pulls_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock/mock.dart';

main() {
    final repository = PullsRepositoryImplMock();
    final usecase = PullsUseCaseImpl(pullsRepository: repository);

    test(
        'Deve retornar uma lista com resultados',
        () async {
            when(() => repository.retrieveListPullsByRepository(""))
                .thenAnswer((_) async => Right(<PullsModel>[]));

            var result = await usecase.execute("");

            expect(result.isRight(), true);
            expect(result | [], isA<List<PullsModel>>());
        }
    );
}