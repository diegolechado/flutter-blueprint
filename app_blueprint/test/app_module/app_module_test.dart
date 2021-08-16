import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:app_blueprint/app_module/app_module.dart';
import 'package:app_blueprint/app_module/models/repos_model.dart';
import 'package:app_blueprint/app_module/use_case/user_repositories_usecase.dart';
import 'package:app_blueprint/utils/local_storage_util.dart';
import 'package:app_blueprint/utils/connect_util.dart';

class ConnectUtilMock extends Mock implements ConnectUtil {}

class LocalStorageUtilMock extends Mock implements LocalStorageUtil {}

main() {
    final storage = LocalStorageUtilMock();
    final ConnectUtilMock connect = ConnectUtilMock();
    dynamic jsonResponse;

    setUp(() async {
        jsonResponse = json.decode(await File('assets/json/mockGetAllRepoUser.json').readAsString());
    });

    initModule(
        AppModule(),
        replaceBinds: [
            Bind<ConnectUtil>((i) => connect),
            Bind<LocalStorageUtil>((i) => storage)
        ]
    );

    test(
        'Deve executar usecase search_by_text',
        () async {
            when(() => connect.request(
                method: HttpMethod.get,
                path: "")).thenAnswer((_) async => Future.value(
                Response(requestOptions: RequestOptions(path: ""), statusCode: 200, data: jsonResponse)
            ));

            when(() => storage.read('API-Token', String)).thenAnswer((_) async => Future.value('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'));

            var usecase = Modular.get<UserRepositoriesUseCase>();

            var result = await usecase.execute();

            expect(result.isRight(), true);
            expect(result | [], isA<List<ReposModel>>());
        }
    );
}