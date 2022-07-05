//our error handling

import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  late String message;

//return a formatted error message given a dioError
  DioExceptions.fromDioError(DioError dioError) {
    //check the type of exception throw
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request to the API server was cancelled";
        break;

      case DioErrorType.connectTimeout:
        message = "Connection to the API Server timed out";
        break;

      case DioErrorType.response:
        message = _handleError(
            dioError.response?.statusCode, dioError.response?.data);
        break;
      case DioErrorType.sendTimeout:
        message = "Send Timeout in connection with the API Server";
        break;
      case DioErrorType.other:
        if (dioError.message.contains("SocketException")) {
          message = "No internet access";
        }
        message = "Unexpected Eror Happened";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive Timeout in connection with the API Server";
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return error['message'];
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;
}
