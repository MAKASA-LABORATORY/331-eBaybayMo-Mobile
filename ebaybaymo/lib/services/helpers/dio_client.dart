import 'package:dio/dio.dart';
import 'package:ebaybaymo/utils/constants.dart';

class DioClient {
  static DioClient? _singleton;
  static late Dio _dio;
  static late Dio _directDio; // New Dio instance for direct API

  DioClient._() {
    _dio = createDioClient(Constants.baseUrl);
    _directDio = createDioClient('https://ebaybaymo-api.herokuapp.com/');
  }

  factory DioClient() => _singleton ?? DioClient._();

  Dio get instance => _dio;
  Dio get directInstance => _directDio; // Getter for the direct API instance

  Dio createDioClient(String baseUrl) {
    final Dio dio = Dio(BaseOptions(
        baseUrl: baseUrl,
        receiveTimeout: const Duration(seconds: 5),
        connectTimeout: const Duration(seconds: 5),
        sendTimeout: const Duration(seconds: 5),
        headers: {
          Headers.acceptHeader: 'application/json',
          Headers.contentTypeHeader: 'application/json',
        }))
      ..options
          .headers
          .addEntries([const MapEntry('accept', 'application/json')]);
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
