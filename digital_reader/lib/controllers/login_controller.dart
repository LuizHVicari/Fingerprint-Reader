import 'package:digital_reader/dio.dart';
import 'package:digital_reader/models/auth_token.dart';
import 'package:digital_reader/respositories/auth_repository.dart';

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
      addInterceptors();
    }
    return token;
  }

}