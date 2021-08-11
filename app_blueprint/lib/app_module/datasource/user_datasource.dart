import 'package:app_blueprint/app_module/models/repos_model.dart';
import 'package:dio/dio.dart';

abstract class UserDatasource {
  Future<ReposModel> retrieveRepositories(String name);
}

class GitHubDatasource implements UserDatasource {
  final Dio dio;

  GitHubDatasource({required this.dio});

  @override
  Future<ReposModel> retrieveRepositories(String name) async {
      final Response response = await dio.get("https://api.github.com/repos/$name");

      if(response.statusCode == 200)
          return ReposModel.fromMap(response.data);
      else
          throw Exception();
  }
}