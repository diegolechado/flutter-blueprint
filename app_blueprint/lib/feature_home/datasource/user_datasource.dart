abstract class UserDatasourceType {
  retrieveRepositories();
}

class UserDatasource implements UserDatasourceType {
  @override
  retrieveRepositories() async {}
}
