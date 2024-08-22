import 'package:dio/dio.dart';
import 'package:ebaybaymo/utils/constants.dart';

class DioClient {
  static DioClient? _singleton;
  static late Dio _dio;
  DioClient._() {
    _dio = createDioClient();
  }
  factory DioClient() => _singleton ?? DioClient._();
  Dio get instance => _dio;
  Dio createDioClient() {
    final Dio dio = Dio(BaseOptions(
        baseUrl: Constants.baseUrl,
        receiveTimeout: const Duration(seconds: 15000),
        connectTimeout: const Duration(seconds: 15000),
        sendTimeout: const Duration(seconds: 15000),
        headers: {
          Headers.acceptHeader: 'application/json',
          Headers.contentTypeHeader: 'application/json',
        }))
      ..options
          .headers
          .addEntries([const MapEntry('acccept', 'application/json')]);
    dio.interceptors.addAll([
      LogInterceptor(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true),
      // AppInterceptors(),
    ]);
    return dio;
  }
}
