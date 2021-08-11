import 'package:app_blueprint/app_module/errors/errors.dart';
import 'package:app_blueprint/app_module/models/repos_model.dart';
import 'package:app_blueprint/app_module/repository/user_repository.dart';
import 'package:app_blueprint/app_module/use_case/retrieve_user_repositories_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class UserRepositoryMock extends Mock implements UserRepository {}

main() {
  final repository = UserRepositoryMock();
  final usecase = RetrieveUserRepositoriesUseCaseImpl(userRepository: repository);
  final repo = ReposModel(
    name: "",
    description: "",
    fullName: "",
    forks: 0,
    watchers: 0
  );

  test(
      'deve retornar uma lista com resultados',
      () async {
        when(repository.retrieveRepositories("Flutterando/Clean-Dart")).thenAnswer((_) async => right(repo));
        var result = await usecase.execute("");
        expect(result.isRight(), true);
        expect(result | repo, isA<ReposModel>());
      });

  test(
      'Deve retornar um InvalidName caso o nome seja inválido',
      () async {
        var result = await usecase.execute(' ');
        final error = result.fold<Failure?>(id, (_) => null);
        expect(error, isA<InvalidName>());
      }
  );
}