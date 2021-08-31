import 'package:app_blueprint/app_module/blocs/settings/settings_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock/mock.dart';

main() {
  final usecase = SettingsUseCaseImplMock();

  blocTest(
      'Deve emitir sequencia correta de estados da SettingsBloc - Success',
      build: () {
          SettingsBloc settingsBloc = SettingsBloc(usecase: usecase);

          when(() => usecase.execute("bjhckjblbybbuh")).thenAnswer((_) async => true);

          return settingsBloc;
      },
      act: (SettingsBloc bloc) => bloc.add("bjhckjblbybbuh"),
      expect: () => [ SaveEnum.loading, SaveEnum.save ]
  );

  blocTest(
      'Deve emitir sequencia correta de estados da SettingsBloc - Failure',
      build: () {
          SettingsBloc settingsBloc = SettingsBloc(usecase: usecase);

          when(() => usecase.execute("bjhckjblbybbuh")).thenAnswer((_) async => false);

          return settingsBloc;
      },
      act: (SettingsBloc bloc) => bloc.add("bjhckjblbybbuh"),
      expect: () => [ SaveEnum.loading, SaveEnum.error ]
  );
}