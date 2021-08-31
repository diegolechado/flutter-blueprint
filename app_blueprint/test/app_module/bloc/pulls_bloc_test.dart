import 'package:app_blueprint/app_module/blocs/pulls/pulls_bloc.dart';
import 'package:app_blueprint/app_module/errors/errors.dart';
import 'package:app_blueprint/app_module/models/pulls_model.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mock/mock.dart';

main() {
  final usecase = PullsUseCaseImplMock();

  blocTest(
      'Deve emitir sequencia correta de estados da PullsBloc - Success',
      build: () {
        PullsBloc pullsBloc = PullsBloc(usecase: usecase);

        when(() => usecase.execute("")).thenAnswer((_) async => Right(<PullsModel>[]));

        return pullsBloc;
      },
      act: (PullsBloc bloc) => bloc.add(StartEventPulls(url: "")),
      expect: () => [ isA<SuccessStatePulls>() ]
  );

  blocTest(
      'Deve emitir sequencia correta de estados da PullsBloc - Failure',
      build: () {
        PullsBloc pullsBloc = PullsBloc(usecase: usecase);

        when(() => usecase.execute("")).thenAnswer((_) async => Left(EmptyTokenAPI()));

        return pullsBloc;
      },
      act: (PullsBloc bloc) => bloc.add(StartEventPulls(url: "")),
      expect: () => [ isA<FailureStatePulls>() ]
  );
}