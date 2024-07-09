import 'dart:developer';

import 'package:digital_reader/dio.dart';
import 'package:digital_reader/models/auth_token.dart';
import 'package:digital_reader/respositories/auth_interface.dart';
import 'package:digital_reader/respositories/backend_urls.dart';
import 'package:dio/dio.dart';

class AuthRepository implements AuthInterface {
  String authUrl = '${BackendUrls.instance.url}api/token/';


  @override
  Future<AuthToken?> getToken({required String user, required String password}) async {
    try {
      Response response = await dio.post(
        '/api/token/',
        data: {
          'username': user,
          'password': password
        }
      );
      return AuthToken.fromJson(response.data);
    } on DioException catch (e) {
      log(e.toString());
    } catch (e) {
      log(e.toString());
    }

    return null;
  }

 
}