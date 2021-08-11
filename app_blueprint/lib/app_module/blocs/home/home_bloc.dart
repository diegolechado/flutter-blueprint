import 'dart:async';
import 'package:app_blueprint/app_module/models/repos_model.dart';
import 'package:app_blueprint/app_module/use_case/retrieve_user_repositories_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
    final RetrieveUserRepositoriesUseCase useCase;

    HomeBloc(this.useCase) : super(InitialStateHome());

    @override
    Stream<HomeState> mapEventToState(HomeEvent event) async* {
        if (event is StartEventHome)
            yield* _start(event);
    }

    Stream<HomeState> _start(StartEventHome event) async* {
        yield LoadingStateHome();

        final result = await useCase.execute(event.text);

        yield result.fold(
            (failure) => FailureStateHome(message: failure.message),
            (success) => SuccessStateHome(result: success),
        );
    }

    @override
    Future<void> close() {
        return super.close();
    }
}