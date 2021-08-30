import 'dart:io';
import 'package:dio/dio.dart';

enum HttpMethod { get, post, put, delete }

abstract class ConnectDatasource {
    Future<Response> request({required HttpMethod method, required String path, Map<String, dynamic>? data});

    void setDioOptions({Map<String, dynamic>? interceptorHeaders});
}

class DioConnectDatasource implements ConnectDatasource {
    Dio dio = Dio();

    @override
    Future<Response> request({required HttpMethod method, required String path, Map<String, dynamic>? data}) async {
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

    @override
    void setDioOptions({Map<String, dynamic>? interceptorHeaders}) {
        dio.options.connectTimeout = 5000;
        dio.options.receiveTimeout = 5000;
        dio.options.sendTimeout = 5000;

        dio.options.contentType = ContentType.parse("application/json").toString();

        dio.interceptors.add(InterceptorsWrapper(
            onRequest: (options, handler) {
                if(interceptorHeaders != null)
                    options.headers.addAll(interceptorHeaders);
                return handler.next(options);
            }
        ));
    }
}