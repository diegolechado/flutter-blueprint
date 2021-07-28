import 'package:dio/dio.dart';

abstract class RemoteDatasourceType {
  RequestType? requestType;
  String? path;
  String get baseUrl;
  HttpMethod get method;
  Map<String, dynamic>? get headers;
  Future<Response<dynamic>> request();
}

class RemoteDatasource extends RemoteDatasourceType {
  final RequestType requestType;
  final String path;

  RemoteDatasource({required this.requestType, required this.path});

  @override
  String get baseUrl {
    return "https://api.github.com";
  }

  @override
  HttpMethod get method {
    switch (this.requestType) {
      case RequestType.pulls:
        return HttpMethod.get;
    }
  }

  @override
  Map<String, dynamic>? get headers {
    switch (this.requestType) {
      case RequestType.pulls:
        return null;
    }
  }

  @override
  Future<Response<dynamic>> request() async {
    switch (this.method) {
      case HttpMethod.get:
        return Dio().get(this.path, options: Options(headers: this.headers));
    }
  }
}

enum RequestType { pulls }
enum HttpMethod { get }
