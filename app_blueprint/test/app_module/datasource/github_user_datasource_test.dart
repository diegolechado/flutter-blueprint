import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_blueprint/app_module/datasource/connect_datasource.dart';
import 'package:app_blueprint/app_module/datasource/info_repository_datasource.dart';
import 'package:app_blueprint/app_module/models/pulls_model.dart';
import 'package:app_blueprint/app_module/models/repos_model.dart';

import '../../mock/mock.dart';

main() {
  final DioConnectDatasourceMock connect = DioConnectDatasourceMock();
  final GitHubDatasource datasource = GitHubDatasource(dioConnect: connect);

  test(
      'retrieveListRepositoriesByUserToken - Deve retornar uma lista de ReposModel',
      () async {
          final jsonResponse = json.decode(await File('assets/json/mockGetAllRepoUser.json').readAsString());

          when(() => connect.request(
              method: HttpMethod.get,
              path: "https://api.github.com/user/repos?per_page=100&page=1"))
              .thenAnswer((_) async => Response(
                  requestOptions: RequestOptions(path: ""),
                  statusCode: 200,
                  data: jsonResponse));

          var result = await datasource.retrieveListRepositoriesByUserToken(
              token: "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",
              page: 1);

          expect(result, isA<List<ReposModel>>());
      }
  );

  test(
      'retrieveListPullsByRepository - Deve retornar uma lista de PullsModel',
      () async {
          final jsonResponse = json.decode(await File('assets/json/mockGetListPulls.json').readAsString());

          when(() => connect.request(
              method: HttpMethod.get,
              path: "/pulls?state=all&per_page=100"))
              .thenAnswer((_) async => Response(
                  requestOptions: RequestOptions(path: ""),
                  statusCode: 200,
                  data: jsonResponse));

          var result = await datasource.retrieveListPullsByRepository("");

          expect(result, isA<List<PullsModel>>());
      }
  );
}