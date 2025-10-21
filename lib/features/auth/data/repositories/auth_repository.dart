import 'package:quanlytauca/features/auth/data/datasources/auth_api.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  final AuthApi _authApi = AuthApi();

  Future<http.Response> signIn(String username, String password) {
    return _authApi.signIn(username, password);
  }
}
