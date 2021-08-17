import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_blueprint/app_module/datasource/user_datasource.dart';
import 'package:app_blueprint/app_module/models/repos_model.dart';
import 'package:app_blueprint/utils/connect_util.dart';

class ConnectUtilMock extends Mock implements ConnectUtil {}

main() {
  final ConnectUtilMock connect = ConnectUtilMock();
  final GitHubDatasource datasource = GitHubDatasource(connect: connect);

  test(
      'Deve retornar um ResultModel',
      () async {
          final jsonResponse = json.decode(await File('assets/json/mockGetAllRepoUser.json').readAsString());

          when(() => connect.request(method: HttpMethod.get, path: "https://api.github.com/user/repos")).thenAnswer((_) async =>
              Response(
                  requestOptions: RequestOptions(path: "https://api.github.com/user/repos"),
                  statusCode: 200,
                  data: jsonResponse)
          );
          var result = await datasource.retrieveRepositories("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");
          expect(result, isA<List<ReposModel>>());
      }
  );
}