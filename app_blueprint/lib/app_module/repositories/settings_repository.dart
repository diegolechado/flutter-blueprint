import 'package:app_blueprint/app_module/datasource/storage_datasource.dart';

abstract class SettingsRepository {
    Future<bool> saveToken(String text);
}

class SettingsRepositoryImpl implements SettingsRepository {
    final StorageDatasource storage;

    SettingsRepositoryImpl({required this.storage});

    @override
    Future<bool> saveToken(String text) async {
        try {
            final result = await storage.save('API-Token', text);
            return result;
        } catch (e) {
            print(e);
            return false;
        }
    }
}