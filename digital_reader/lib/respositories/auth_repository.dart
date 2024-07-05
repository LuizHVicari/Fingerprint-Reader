import 'dart:convert';
import 'dart:developer';

import 'package:digital_reader/models/auth_token.dart';
import 'package:digital_reader/respositories/auth_interface.dart';
import 'package:digital_reader/respositories/backend_urls.dart';
import 'package:http/http.dart' as http;

class AuthRepository implements AuthInterface {
  String authUrl = '${BackendUrls.instance.url}api/token/';

  @override
  Future<AuthToken?> getToken({required String user, required String password}) async {
    log(authUrl);
    log(user);
    log(password);
    var body = jsonEncode({
        'username': user,
        'password': password
    });

    var token = await http.post(
      Uri.parse(authUrl),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (token.statusCode == 200){
      log('token encontrado');
      log(token.body);
      final json = jsonDecode(token.body);
      return AuthToken.fromJson(json);
    }
    
    return null;
  }
}