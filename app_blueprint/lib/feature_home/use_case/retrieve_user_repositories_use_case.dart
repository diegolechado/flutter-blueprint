import 'package:app_blueprint/feature_home/datasource/user_datasource.dart';

abstract class RetrieveUserRepositoriesUseCaseType {
  execute();
}

class RetrieveUserRepositoriesUseCase
    implements RetrieveUserRepositoriesUseCaseType {
  final UserDatasourceType userRepository;

  RetrieveUserRepositoriesUseCase({required this.userRepository});

  @override
  execute() async {
    return await userRepository.retrieveRepositories();
  }
}
