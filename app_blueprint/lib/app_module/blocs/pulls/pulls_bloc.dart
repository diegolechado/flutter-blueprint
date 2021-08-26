import 'dart:async';
import 'package:app_blueprint/app_module/models/pulls_model.dart';
import 'package:app_blueprint/app_module/use_case/pulls_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'pulls_event.dart';
part 'pulls_state.dart';

class PullsBloc extends Bloc<PullsEvent, PullsState> {
    final PullsUseCase useCase;

    PullsBloc(this.useCase) : super(InitialStatePulls());

    @override
    Stream<PullsState> mapEventToState(PullsEvent event) async* {
        if (event is StartEventPulls)
            yield* _start(event);
    }

    Stream<PullsState> _start(StartEventPulls event) async* {
        yield LoadingStatePulls();

        final result = await useCase.execute(event.url);

        yield result.fold(
            (failure) => FailureStatePulls(message: failure.message),
            (success) => SuccessStatePulls(listPullsModel: success)
        );
    }

    @override
    Future<void> close() {
        return super.close();
    }
}