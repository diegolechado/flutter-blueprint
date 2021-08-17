import 'package:app_blueprint/app_module/app_module.dart';
import 'package:app_blueprint/app_module/errors/errors.dart';
import 'package:app_blueprint/app_module/models/repos_model.dart';
import 'package:app_blueprint/app_module/repository/user_repository.dart';
import 'package:app_blueprint/app_module/use_case/user_repositories_usecase.dart';
import 'package:app_blueprint/utils/local_storage_util.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart' as Modular;
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class UserRepositoryMock extends Mock implements UserRepository {}

class LocalStorageUtilMock extends Mock implements LocalStorageUtil {}

main() {
  final repository = UserRepositoryMock();
  final storage = LocalStorageUtilMock();
  final usecase = UserRepositoriesUseCaseImpl(userRepository: repository, storage: storage);

  initModule(
      AppModule(),
      replaceBinds: [
        Modular.Bind<LocalStorageUtil>((i) => storage)
      ]
  );

  test(
      'Deve retornar uma lista com resultados',
      () async {
          when(() => storage.read('API-Token', String)).thenAnswer((_) async => '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');
          when(() => repository.retrieveRepositories('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')).thenAnswer((_) async => Right<Failure, List<ReposModel>>(<ReposModel>[]));
          var result = await usecase.execute();
          expect(result.isRight(), true);
          expect(result | [], isA<List<ReposModel>>());
      }
  );

  test(
      'Deve retornar um EmptyTokenAPI caso não consiga recuperar o tokn',
      () async {
          when(() => storage.read('API-Token', String)).thenAnswer((_) async => null);
          var result = await usecase.execute();
          final error = result.fold<Failure?>(id, (_) => null);
          expect(error, isA<EmptyTokenAPI>());
      }
  );
}