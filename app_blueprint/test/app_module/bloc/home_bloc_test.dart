import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:app_blueprint/app_module/app_module.dart';
import 'package:app_blueprint/app_module/errors/errors.dart';
import 'package:app_blueprint/app_module/models/repos_model.dart';
import 'package:app_blueprint/app_module/blocs/home/home_bloc.dart';
import 'package:app_blueprint/app_module/use_case/user_repositories_usecase.dart';

class UserRepositoriesUseCaseMock extends Mock implements UserRepositoriesUseCase {}

main() {
    final usecase = UserRepositoriesUseCaseMock();

    blocTest(
        'Deve emitir sequencia correta de estados',
        build: () {
          initModule(AppModule());
          HomeBloc bloc = Modular.get<HomeBloc>();
          when(() => usecase.execute()).thenAnswer((_) async => Right<Failure, List<ReposModel>>(<ReposModel>[]));
          return bloc;
        },
        act: (HomeBloc bloc) => bloc.add(StartEventHome()),
        expect: () => [ isA<LoadingStateHome>(), isA<SuccessStateHome>() ]
    );
}