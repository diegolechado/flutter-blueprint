import 'package:dio/dio.dart';

enum HttpMethod { get, post, put, delete, download }

class RemoteDataSource {

  Future<Response> request({
      required HttpMethod method,
      required String path,
      Map<String, dynamic>? data,
      BaseOptions? options}) async {

      Dio dio = Dio();

      if(options != null)
          dio.options = options;

      switch(method) {
          case HttpMethod.get:
              return await dio.get(path);
          case HttpMethod.post:
              return await dio.post(path, data: data);
          case HttpMethod.put:
              return await dio.put(path, data: data);
          case HttpMethod.delete:
              return await dio.delete(path, data: data);
          case HttpMethod.download:
              return await dio.download(path, "");
      }
  }
}