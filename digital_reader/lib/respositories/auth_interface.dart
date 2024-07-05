import 'package:digital_reader/models/auth_token.dart';

abstract class AuthInterface {
  Future<AuthToken?> getToken({required String user, required String password});
}