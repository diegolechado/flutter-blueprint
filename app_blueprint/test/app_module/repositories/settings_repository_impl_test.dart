import 'package:app_blueprint/app_module/repositories/settings_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock/mock.dart';

main() {
  final storage = SharedPreferencesDatasourceMock();
  final repository = SettingsRepositoryImpl(storage: storage);

  test(
      'Deve salvar o valor com sucesso e retornar TRUE',
      () async {
          when(() => storage.save('API-Token', "XXX")).thenAnswer((_) async => true);

          var result = await repository.saveToken("XXX");

          expect(result, true);
      }
  );

  test(
      'Deve retornar FALSE em caso de erro',
      () async {
          when(() => storage.save('API-Token', "XXX")).thenThrow(Exception());

          var result = await repository.saveToken("XXX");

          expect(result, false);
      }
  );
}