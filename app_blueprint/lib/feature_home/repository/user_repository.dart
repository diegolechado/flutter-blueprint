import 'package:app_blueprint/feature_home/datasource/user_datasource.dart';

abstract class UserRepositoryType {
  retrieveRepositories();
}

class UserRepository implements UserRepositoryType {
  final UserDatasource userDatasource;

  UserRepository({required this.userDatasource});

  @override
  retrieveRepositories() async {
    return await userDatasource.retrieveRepositories();
  }
}
