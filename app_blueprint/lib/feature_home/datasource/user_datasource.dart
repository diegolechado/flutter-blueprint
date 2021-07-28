import 'package:app_blueprint/common/remote_datasource.dart';
import 'package:dio/dio.dart';

abstract class UserDatasourceType {
  retrieveRepositories();
}

class UserDatasource implements UserDatasourceType {
  final RemoteDatasource remoteDataSource;

  UserDatasource({required this.remoteDataSource});

  @override
  retrieveRepositories() async {
    Response response = await remoteDataSource.request();
  }
}

class Repository {
  String id;
  String name;

  Repository({required this.id, required this.name});

  factory Repository.fromJson(Map<String, dynamic> json) =>
      new Repository(id: json["id"], name: json["name"]);
}
