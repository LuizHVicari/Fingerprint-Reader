import 'dart:developer';

import 'package:digital_reader/models/auth_token.dart';
import 'package:digital_reader/respositories/auth_repository.dart';
import 'package:digital_reader/widgets_keys.dart';
import 'package:flutter/material.dart';

class LoginController {
  static LoginController instance = LoginController();

  String login = '';
  String password = '';
  AuthToken? token;
  bool isLogged = false;

  final AuthRepository _authRepo = AuthRepository();

  Future<AuthToken?> getToken() async {
    token = (await _authRepo.getToken(user: login, password: password))!;
    if (token != null) {
      isLogged = true;
    } else {
      ScaffoldMessenger.of(WidgetsKeys.instance.logginScaffoldKey.currentContext!).showSnackBar(
          const SnackBar(
          content: Text('Login efetuado com sucesso'),
          duration: Duration(seconds: 2),
        )
    );
    }
    log(token!.access!);
    return token;
  }
}