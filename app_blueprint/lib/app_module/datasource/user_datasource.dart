import 'package:app_blueprint/app_module/models/repos_model.dart';
import 'package:app_blueprint/utils/connect_util.dart';
import 'package:dio/dio.dart';

abstract class UserDatasource {
  Future<List<ReposModel>> retrieveRepositories(String token);
}

class GitHubDatasource implements UserDatasource {
  final ConnectUtil connect;

  GitHubDatasource({required this.connect});

  @override
  Future<List<ReposModel>> retrieveRepositories(String token) async {
      final response = await connect.request(
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