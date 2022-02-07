import 'package:flutter_template/model/login/login/login_request.dart';
import 'package:flutter_template/model/login/login/login_response.dart';
import 'package:flutter_template/model/member/members.dart';
import '../index.dart';

class AuthenticationRepository {
  final baseApiProvider = ApiProvider();

  Future<LoginResponse> login(LoginRequest request) async {
    final response = await baseApiProvider.call(
        url: '/api/v1/Auth/login',
        method: HTTPMethod.POST,
        request: request.toJson()
    );
    return LoginResponse.fromJson(response);
  }
  
  Future<LoginResponse> renewToken(LoginResponseData request) async {
    final response = await baseApiProvider.call(
        url: '/api/v1/Auth/renew-token',
        method: HTTPMethod.POST,
        request: request.toJson());
    return LoginResponse.fromJson(response);
  }
  
  Future<MembersResponse> ssyPageSamiti() async {
    var url = '/api/pageSamiti';
    final response = await baseApiProvider.call(
      url: url,
      method: HTTPMethod.GET,
    );
    return MembersResponse.fromJson(response);
  }
  
  // ///Calls POST UserDevice API
  // Future<UserDevice> postUserDevice(UserDeviceRequest userDevice) async {
  //   final response = await baseApiProvider.call(
  //       request: userDevice.toJson(),
  //       url: '/api/v1/UserDevice',
  //       method: HTTPMethod.POST);
  //   return UserDevice.fromJson(response);
  // }

  // ///Calls PUT UserDevice API
  // Future<UserDevice> putUserDevice(UserDevice userDevice) async {
  //   final response = await baseApiProvider.call(
  //       request: userDevice?.data?.toJson(),
  //       url: '/api/v1/UserDevice/${userDevice?.data?.id}',
  //       method: HTTPMethod.PUT);
  //   return UserDevice.fromJson(response);
  // }
}
