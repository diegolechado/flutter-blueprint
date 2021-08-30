import 'dart:io';
import 'dart:convert';
import 'package:app_blueprint/app_module/datasource/connect_datasource.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:app_blueprint/app_module/app_module.dart';
import 'package:app_blueprint/app_module/models/repos_model.dart';
import 'package:app_blueprint/app_module/use_case/user_repositories_usecase.dart';
import 'package:app_blueprint/app_module/datasource/storage_datasource.dart';

import '../mock/mock.dart';

main() {
    final storage = SharedPreferencesDatasourceMock();
    final DioConnectDatasourceMock connect = DioConnectDatasourceMock();

    initModule(
        AppModule(),
        replaceBinds: [
            Bind<SharedPreferencesDatasource>((i) => storage),
            Bind<DioConnectDatasource>((i) => connect)
        ],
        initialModule: true
    );

    test(
        'Teste de integração passando por todas camadas',
        () async {
            final jsonResponse = json.decode(await File('assets/json/mockGetAllRepoUser.json').readAsString());

            when(() => storage.read('API-Token', String)).thenAnswer((_) async => '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');

            when(() => connect.request(method: any(), path: any()))
                .thenAnswer((_) async => Response(
                    requestOptions: RequestOptions(path: any()),
                    statusCode: 200,
                    data: jsonResponse));

            var usecase = Modular.get<UserRepositoriesUseCase>();
            var result = await usecase.execute(page: 1);

            expect(result.isRight(), true);
            expect(result | [], isA<List<ReposModel>>());
        }
    );
}