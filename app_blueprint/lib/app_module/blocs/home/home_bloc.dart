import 'dart:async';
import 'package:app_blueprint/app_module/models/repos_model.dart';
import 'package:app_blueprint/app_module/use_case/user_repositories_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
    final UserRepositoriesUseCase useCase;

    HomeBloc(this.useCase) : super(InitialStateHome());

    @override
    Stream<HomeState> mapEventToState(HomeEvent event) async* {
        if (event is StartEventHome)
            yield* _start();
    }

    Stream<HomeState> _start() async* {
        yield LoadingStateHome();

        final result = await useCase.execute();

        yield result.fold(
            (failure) => FailureStateHome(message: failure.message),
            (success) => SuccessStateHome(list: success),
        );
    }

    @override
    Future<void> close() {
        return super.close();
    }
}