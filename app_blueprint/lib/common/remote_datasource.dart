import 'package:dio/dio.dart';

abstract class RemoteDatasourceType {
  RequestType? requestType;
  String? path;
  HttpMethod get method;
  Map<String, dynamic>? get headers;
  Future<Response<dynamic>> request();
}

class RemoteDatasource extends RemoteDatasourceType {
  final RequestType requestType;
  final String path;

  RemoteDatasource({required this.requestType, required this.path});

  @override
  HttpMethod get method {
    switch (this.requestType) {
      case RequestType.pulls:
        return HttpMethod.get;
      case RequestType.repositories:
        return HttpMethod.get;
    }
  }

  @override
  Map<String, dynamic>? get headers {
    switch (this.requestType) {
      case RequestType.pulls:
        return null;
      case RequestType.repositories:
        return null;
    }
  }

  @override
  Future<Response<dynamic>> request() async {
    switch (this.method) {
      case HttpMethod.get:
        return await Dio()
            .get(this.path, options: Options(headers: this.headers));
    }
  }
}

enum RequestType { pulls, repositories }
enum HttpMethod { get }
