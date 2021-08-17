import 'package:app_blueprint/app_module/errors/errors.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_blueprint/app_module/models/repos_model.dart';
import 'package:app_blueprint/app_module/blocs/home/home_bloc.dart';

import '../../mock/mock.dart';

main() {
    final usecase = UserRepositoriesUseCaseMock();

    blocTest(
        'Deve emitir sequencia correta de estados da HomeBloc - Success',
        build: () {
          HomeBloc homeBloc = HomeBloc(usecase);
          when(() => usecase.execute()).thenAnswer((_) async => Right(<ReposModel>[]));
          return homeBloc;
        },
        act: (HomeBloc bloc) => bloc.add(StartEventHome()),
        expect: () => [ isA<LoadingStateHome>(), isA<SuccessStateHome>() ]
    );

    blocTest(
        'Deve emitir sequencia correta de estados da HomeBloc - Failure',
        build: () {
          HomeBloc homeBloc = HomeBloc(usecase);
          when(() => usecase.execute()).thenAnswer((_) async => Left(EmptyTokenAPI()));
          return homeBloc;
        },
        act: (HomeBloc bloc) => bloc.add(StartEventHome()),
        expect: () => [ isA<LoadingStateHome>(), isA<FailureStateHome>() ]
    );
}