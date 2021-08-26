import 'package:app_blueprint/app_module/models/pulls_model.dart';
import 'package:app_blueprint/app_module/models/repos_model.dart';
import 'package:app_blueprint/app_module/datasource/connect_datasource.dart';
import 'package:dio/dio.dart';

abstract class UserDatasource {
  Future<List<ReposModel>> retrieveListRepositories(String token, int page);

  Future<List<PullsModel>> retrievePullsList(String token, String url);
}

class GitHubDatasource implements UserDatasource {
  final DioConnectDatasource dioConnect;

  GitHubDatasource({required this.dioConnect});

  @override
  Future<List<ReposModel>> retrieveListRepositories(String token, int page) async {
      final response = await dioConnect.request(
          method: HttpMethod.get,
          path: "https://api.github.com/user/repos?per_page=100&page=$page",
          options: BaseOptions(
              headers: {
                'Authorization': 'token $token'
              }
          )
      );

      if(response.statusCode == 200) {
          final jsonList = response.data as List;
          List<ReposModel> list = [];
          jsonList.forEach((i) => list.add(ReposModel.fromMap(i)));
          return list;
      }
      else
          throw Exception();
  }

  @override
  Future<List<PullsModel>> retrievePullsList(String token, String url) async {
      final response = await dioConnect.request(
          method: HttpMethod.get,
          path: "$url/pulls?state=all&per_page=100",
          options: BaseOptions(
              headers: {
                'Authorization': 'token $token'
              }
          )
      );

      if(response.statusCode == 200) {
          final jsonList = response.data as List;
          List<PullsModel> list = [];
          jsonList.forEach((i) => list.add(PullsModel.fromMap(i)));
          return list;
      }
      else
          throw Exception();
  }
}