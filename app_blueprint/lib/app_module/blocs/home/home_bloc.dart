import 'dart:async';
import 'package:app_blueprint/app_module/models/repos_model.dart';
import 'package:app_blueprint/app_module/use_case/user_repositories_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
    final UserRepositoriesUseCase usecase;

    HomeBloc({required this.usecase}) : super(LoadingStateHome());

    int _page = 0;
    List<ReposModel> _listAllResult = [];

    @override
    Stream<HomeState> mapEventToState(HomeEvent event) async* {
        if (event is StartEventHome)
            yield* _start();
    }

    Stream<HomeState> _start() async* {
        yield LoadingStateHome();

        _page = _page + 1;

        final result = await usecase.execute(page: _page);

        yield* result.fold(
            (failure) async* {
                yield FailureStateHome(message: failure.message);
            },
            (success) async* {
                _listAllResult.addAll(success);
                yield SuccessStateHome(list: _listAllResult);
            }
        );
    }

    @override
    Future<void> close() {
        return super.close();
    }
}