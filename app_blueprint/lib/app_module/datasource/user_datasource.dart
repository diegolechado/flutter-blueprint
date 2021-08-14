import 'package:app_blueprint/app_module/models/repos_model.dart';
import 'package:app_blueprint/utils/remote_datasource.dart';
import 'package:dio/dio.dart';

abstract class UserDatasource {
  Future<List<ReposModel>> retrieveRepositories(String token);
}

class GitHubDatasource implements UserDatasource {
  final RemoteDataSource client;

  GitHubDatasource({required this.client});

  @override
  Future<List<ReposModel>> retrieveRepositories(String token) async {
      Response response = await client.request(
          method: HttpMethod.get,
          path: "https://api.github.com/user/repos",
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
}