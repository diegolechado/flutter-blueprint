import 'package:app_blueprint/app_module/models/repos_model.dart';
import 'package:app_blueprint/utils/remote_datasource.dart';
import 'package:dio/dio.dart';

abstract class UserDatasource {
  Future<ReposModel> retrieveRepositories(String name);
}

class GitHubDatasource implements UserDatasource {
  final RemoteDataSource client;

  GitHubDatasource({required this.client});

  @override
  Future<ReposModel> retrieveRepositories(String name) async {
      final Response response = await client.request(method: HttpMethod.get, path: "https://api.github.com/repos/$name");

      if(response.statusCode == 200)
          return ReposModel.fromMap(response.data);
      else
          throw Exception();
  }
}