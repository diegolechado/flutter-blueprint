import 'package:dio/dio.dart';

enum HttpMethod { get, post, put, delete }

abstract class ConnectUtil {
    Future<Response> request({required HttpMethod method, required String path, Map<String, dynamic>? data, BaseOptions? options});
}

class DioConnectDataSource implements ConnectUtil {
    final Dio dio;

    DioConnectDataSource({required this.dio});

    @override
    Future<Response> request({required HttpMethod method, required String path, Map<String, dynamic>? data, BaseOptions? options}) async {
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
        }
    }
}