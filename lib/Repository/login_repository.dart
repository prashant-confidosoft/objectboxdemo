import 'package:flutter_template/model/login/login/login_request.dart';
import 'package:flutter_template/model/login/login/login_response.dart';
import '../index.dart';

class LoginRepository {
  final baseApiProvider = ApiProvider();

  Future<LoginResponse> login(LoginRequest request) async {
    final response = await baseApiProvider.call(
      url: '/api/v1/Auth/login',
      method: HTTPMethod.POST, 
      request: request.toJson()
    );
    return LoginResponse.fromJson(response);
  }
}
