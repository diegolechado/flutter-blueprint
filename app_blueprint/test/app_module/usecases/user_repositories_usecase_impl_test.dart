import 'package:app_blueprint/app_module/errors/errors.dart';
import 'package:app_blueprint/app_module/models/repos_model.dart';
import 'package:app_blueprint/app_module/use_case/user_repositories_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock/mock.dart';

main() {
  final repository = UserRepositoryImplMock();
  final usecase = UserRepositoriesUseCaseImpl(userRepository: repository);

  test(
      'Deve retornar uma lista com resultados',
      () async {
          when(() => repository.retrieveListRepositories(page: 1))
              .thenAnswer((_) async => Right<Failure, List<ReposModel>>(<ReposModel>[]));
          var result = await usecase.execute(page: 1);
          expect(result.isRight(), true);
          expect(result | [], isA<List<ReposModel>>());
      }
  );
}
