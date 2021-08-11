abstract class Failure implements Exception {
  String message = "";
}

class InvalidName extends Failure {
  @override
  String get message => "O Texto é inválido";
}

class RepoNotFound extends Failure {
  @override
  String get message => "Não encontramos o repositório";
}

class DatasourceError extends Failure {
  @override
  String get message => "Erro ao buscar os dados";
}