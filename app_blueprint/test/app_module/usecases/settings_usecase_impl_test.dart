import 'package:app_blueprint/app_module/use_case/settings_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock/mock.dart';

main() {
    final repository = SettingsRepositoryImplMock();
    final usecase = SettingsUseCaseImpl(settingsRepository: repository);

    test(
        'Deve retornar TRUE caso o texto seja salvo com sucesso',
        () async {
          when(() => repository.saveToken("")).thenAnswer((_) async => true);

          var result = await usecase.execute("");

          expect(result, true);
        }
    );
}