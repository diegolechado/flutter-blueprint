abstract class Failure implements Exception {
  String message = "";
}

class EmptyTokenAPI extends Failure {
  @override
  String get message => "Erro ao carregar os repositorios\nNecessário preencher o Token de API da pagina Settings";
}

class DatasourceError extends Failure {
  @override
  String get message => "Erro ao buscar os dados";
}