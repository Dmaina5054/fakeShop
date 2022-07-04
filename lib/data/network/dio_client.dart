//defining our Dio client
import 'package:dio/dio.dart';

import 'api/constant/endpoints.dart';

class DioClient {
  //dio instance
  final Dio _dio;
  DioClient(this._dio) {
    _dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.connectTimeout = Endpoints.connectionTimeout
      ..options.receiveTimeout = Endpoints.receiveTimeout
      ..options.responseType = ResponseType.json;
  }
}
