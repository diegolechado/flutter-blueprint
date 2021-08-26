import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_blueprint/app_module/datasource/user_datasource.dart';
import 'package:app_blueprint/app_module/models/repos_model.dart';

import '../../mock/mock.dart';

main() {
  final DioConnectDatasourceMock connect = DioConnectDatasourceMock();
  final GitHubDatasource datasource = GitHubDatasource(dioConnect: connect);

  test(
      'Deve retornar uma lista de ReposModel',
      () async {
          final jsonResponse = json.decode(await File('assets/json/mockGetAllRepoUser.json').readAsString());
          when(() => connect.request(
              method: any(),
              path: any(),
              options: any()
          )).thenAnswer((_) async => Response(requestOptions: RequestOptions(path: ""), statusCode: 200, data: jsonResponse));
          var result = await datasource.retrieveListRepositories("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", 1);
          expect(result, isA<List<ReposModel>>());
      }
  );
}