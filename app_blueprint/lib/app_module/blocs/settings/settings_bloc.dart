import 'dart:async';
import 'package:app_blueprint/app_module/use_case/settings_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum SaveEnum { save, error, waiting, loading }

class SettingsBloc extends Bloc<String, SaveEnum> {
    final SettingsUseCase usecase;

    SettingsBloc({required this.usecase}) : super(SaveEnum.waiting);

    @override
    Stream<SaveEnum> mapEventToState(String event) async* {
        yield SaveEnum.loading;

        bool result = await usecase.execute(event);

        if(result)
            yield SaveEnum.save;
        else
            yield SaveEnum.error;
    }

    @override
    Future<void> close() {
        return super.close();
    }
}