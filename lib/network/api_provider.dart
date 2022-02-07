import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_template/index.dart';

enum HTTPMethod { GET, POST, PUT, DELETE }

class ApiProvider {
  bool kReleaseMode =
      bool.fromEnvironment('dart.vm.product', defaultValue: false);
  final String _baseUrlHttps = 'https://jagdishpanchal.in';
  final String token = '';

  Future<BaseOptions> getOptions(HTTPMethod httpMethod) async {
    var method = 'GET';
    if (httpMethod == HTTPMethod.GET) {
      method = 'GET';
    } else if (httpMethod == HTTPMethod.POST) {
      method = 'POST';
    } else if (httpMethod == HTTPMethod.PUT) {
      method = 'PUT';
    } else if (httpMethod == HTTPMethod.DELETE) {
      method = 'DELETE';
    }
    return BaseOptions(
      method: method,
      baseUrl: _baseUrlHttps,
      contentType: 'application/json',
    );
  }

  Future<dynamic> call(
      {String? url,
      required HTTPMethod method,
      Map<String, dynamic>? request}) async {
    var responseJson;

    var options = await getOptions(method);
    var dio = Dio(options);
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    
    var encoder = JsonEncoder.withIndent('  ');
    var prettyrequest = encoder.convert(request);
    log('Request of $_baseUrlHttps$url : Request Data: $prettyrequest');
    log(jsonEncode(request));

    try {
      final response = await dio.request(url!, data: request);
      print(response.data);
      responseJson = response.data;
      // var prettyResponse = encoder.convert(responseJson);
      // log('Request of $_baseUrlHttps$url : Request Data: $prettyrequest : $prettyResponse');
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        print('DioErrorType Connect Timeout');
        print(e.response?.data);
        throw ConnectionTimeoutException(e.message);
      } else if (e.type == DioErrorType.receiveTimeout) {
        ///It occurs when receiving timeout.
        print('DioErrorType Received Timeout');
        print(e.response?.data);
        throw ReceiveTimeoutException(e.message);
      } else if (e.type == DioErrorType.response) {
        /// When the server response, but with a incorrect status, such as 404, 503...
        print('DioErrorType Response');
        print(e.response?.data);

        var encoder = JsonEncoder.withIndent('  ');
        var prettyresponse = encoder.convert(e.response?.data);
        log('Error 400 of $_baseUrlHttps$url : Request Data: $prettyrequest :$prettyresponse');

        throw BadRequestException(e.message);
      } else if (e.type == DioErrorType.cancel) {
        /// When the request is cancelled, dio will throw a error with this type.
        print('DioErrorType Cancel');
        print(e.response?.data);
        throw CancelException('Request is cancelled');
      } else {
        /// Default error type, Some other Error. In this case, you can
        /// read the DioError.error if it is not null.
        print('DioErrorType Default');
        print(e.response);
        print(e.message);
        if (e.response == null) {
          throw DefaultException('No Internet connection');
        } else {
          throw DefaultException('Default_Exception_Message');
        }
      }
    }
    return responseJson;
  }

  ///Upload method using Dio
  Future<dynamic> uploadDocument(
      {String? url, FormData? formData, required HTTPMethod method}) async {
    var responseJson;

    var options = await getOptions(method);
    var dio = Dio(options);

    try {
      var response = await dio.request(url!, data: formData,
          onSendProgress: (int sent, int total) {
        print('$sent $total');
      });
      print(response.data);
      var encoder = JsonEncoder.withIndent('  ');
      var prettyResponse = encoder.convert(response.data);
      log('Request of $_baseUrlHttps$url : $prettyResponse');
      responseJson = response.data;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        print('DioErrorType Connect Timeout');
        print(e.response?.data);
        print(e.response?.headers);
        throw ConnectionTimeoutException(e.message);
      } else if (e.type == DioErrorType.receiveTimeout) {
        ///It occurs when receiving timeout.
        print('DioErrorType Received Timeout');
        print(e.response?.data);
        print(e.response?.headers);
        throw ReceiveTimeoutException(e.message);
      } else if (e.type == DioErrorType.response) {
        /// When the server response, but with a incorrect status, such as 404, 503...
        print('DioErrorType Response');
        print(e.response?.data);
        print(e.response?.headers);

        var encoder = JsonEncoder.withIndent('  ');
        var prettyrequest = encoder.convert(e.response?.data);
        log('Error 400 of $url : $prettyrequest');

        throw BadRequestException(e.response?.data['eventMessageId']);
        // throw BadRequestException(e.message);
      } else if (e.type == DioErrorType.cancel) {
        /// When the request is cancelled, dio will throw a error with this type.
        print('DioErrorType Cancel');
        print(e.response?.data);
        print(e.response?.headers);
        throw CancelException('Request is cancelled');
      } else {
        /// Default error type, Some other Error. In this case, you can
        /// read the DioError.error if it is not null.
        print('DioErrorType Default');
        print(e.response);
        print(e.message);
        if (e.response == null) {
          throw DefaultException('No Internet connection');
        } else {
          throw DefaultException('Default_Exception_Message');
        }
      }
    }

    return responseJson;
  }

  Future<dynamic> download(
      {String? url, String? savePath, required HTTPMethod method}) async {
    var responseJson;

    var options = await getOptions(method);
    var dio = Dio(options);

    try {
      var response =
          await dio.download(url!, savePath, onReceiveProgress: (count, total) {
        print('$count $total');
      });
      print(response.data);
      responseJson = response.data;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        print('DioErrorType Connect Timeout');
        print(e.response?.data);
        print(e.response?.headers);
        throw ConnectionTimeoutException(e.message);
      } else if (e.type == DioErrorType.receiveTimeout) {
        ///It occurs when receiving timeout.
        print('DioErrorType Received Timeout');
        print(e.response?.data);
        print(e.response?.headers);
        throw ReceiveTimeoutException(e.message);
      } else if (e.type == DioErrorType.response) {
        /// When the server response, but with a incorrect status, such as 404, 503...
        print('DioErrorType Response');
        print(e.response?.data);
        print(e.response?.headers);
        throw BadRequestException(e.message);
      } else if (e.type == DioErrorType.cancel) {
        /// When the request is cancelled, dio will throw a error with this type.
        print('DioErrorType Cancel');
        print(e.response?.data);
        print(e.response?.headers);
        throw CancelException('Request is cancelled');
      } else {
        /// Default error type, Some other Error. In this case, you can
        /// read the DioError.error if it is not null.
        print('DioErrorType Default');
        print(e.response);
        print(e.message);
        if (e.response == null) {
          throw DefaultException('No Internet connection');
        } else {
          throw DefaultException('Default_Exception_Message');
        }
      }
    }

    return responseJson;
  }
}

class CustomException implements Exception {
  final _message;
  final _prefix;

  CustomException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_prefix$_message';
  }
}

class DefaultException extends CustomException {
  DefaultException(id) : super(id);
}

class CancelException extends CustomException {
  CancelException(id) : super(id);
}

class BadRequestException extends CustomException {
  BadRequestException(id) : super(id);
}

class ConnectionTimeoutException extends CustomException {
  ConnectionTimeoutException(id) : super(id);
}

class ReceiveTimeoutException extends CustomException {
  ReceiveTimeoutException(id) : super(id);
}
