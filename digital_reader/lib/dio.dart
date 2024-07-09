import 'dart:developer';

import 'package:digital_reader/controllers/login_controller.dart';
import 'package:dio/dio.dart';

Dio dio = Dio(
  BaseOptions(
    baseUrl: 'http://192.168.0.111:8000',
    connectTimeout: const Duration(milliseconds: 5000),
    receiveTimeout: const Duration(milliseconds: 3000),
  ),
);

Future<String> refreshToken() async {
  final refresh = LoginController.instance.token?.refresh;
  if (refresh != null) {
    Response response = await dio.post(
      '/api/token/refresh/',
      data: {'refresh':  refresh},
    );
    final access = response.data['access'];
    return access.toString();
  } else {
    throw Exception('Token is null');
  }

}

addInterceptors() {
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['Authorization'] = 'Bearer ${LoginController.instance.token!.access}';
        return handler.next(options);
      },
      onError: (DioException e, handler) async {
        if (e.response?.statusCode == 401) {
          String newAcessToken = await refreshToken();
          e.requestOptions.headers['Authorization'] = 'Bearer $newAcessToken';
          LoginController.instance.token!.access = newAcessToken;
          log(e.requestOptions.toString());
          return handler.resolve(await dio.fetch(e.requestOptions));
        }
        return handler.next(e);
      }
    ),
  );
}