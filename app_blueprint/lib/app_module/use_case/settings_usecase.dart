import 'package:app_blueprint/app_module/repositories/settings_repository.dart';

abstract class SettingsUseCase {
    Future<bool> execute(String text);
}

class SettingsUseCaseImpl implements SettingsUseCase {
    final SettingsRepository settingsRepository;

    SettingsUseCaseImpl({required this.settingsRepository});

    @override
    Future<bool> execute(String text) async {
        return settingsRepository.saveToken(text);
    }
}