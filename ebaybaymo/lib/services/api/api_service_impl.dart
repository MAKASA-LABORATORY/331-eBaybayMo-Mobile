import 'package:dio/dio.dart';
import 'package:ebaybaymo/services/api/api_service_service.dart';
import 'package:ebaybaymo/services/helpers/dio_client.dart';
import 'package:ebaybaymo/services/shared_preference/shared_preference_service.dart';

class ApiServiceImpl implements ApiServiceService {
  ApiServiceImpl({
    Dio? dio,
    required this.sharedPreferenceService,
  })  : _dio = dio ?? DioClient().instance,
        _directDio = dio ?? DioClient().directInstance;

  final Dio _dio;
  final Dio _directDio;
  final SharedPreferenceService sharedPreferenceService;

  @override
  Future<Response> checkImage(String imagePath) async {
    try {
      // Retrieve the session ID from shared preferences
      final sessionId = await sharedPreferenceService.getSessionId();

      if (sessionId == null) {
        return Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 401,
          statusMessage: 'Session ID not found. User may not be logged in.',
          data: {'error': 'Session ID not found'},
        );
      }

      // Create a FormData instance
      FormData formData = FormData.fromMap({
        "baybayin_photo": await MultipartFile.fromFile(
          imagePath,
          filename: imagePath.split('/').last,
        ),
      });

      // Send a POST request to the API with the session ID
      final response = await _dio.post(
        '/images/check_image',
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
            'session-id': sessionId, // Include the session ID here
          },
        ),
      );

      return response;
    } on DioException catch (e) {
      return e.response ??
          Response(
            requestOptions: RequestOptions(path: ''),
            statusCode: 500,
            statusMessage: 'Failed to upload image',
            data: {'error': e.message},
          );
    } catch (e) {
      return Response(
        requestOptions: RequestOptions(path: ''),
        statusCode: 500,
        statusMessage: 'Unexpected error occurred',
        data: {'error': e.toString()},
      );
    }
  }

  @override
  Future<Response> checkImageDirect(String imagePath) async {
    try {
      // Create a FormData instance
      FormData formData = FormData.fromMap({
        "baybayin_photo": await MultipartFile.fromFile(
          imagePath,
          filename: imagePath.split('/').last,
        ),
      });

      // Send a POST request to the external API without the session ID
      final response = await _directDio.post(
        'check_image/', // Use the external API endpoint directly
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      return response;
    } on DioException catch (e) {
      return e.response ??
          Response(
            requestOptions: RequestOptions(path: ''),
            statusCode: 500,
            statusMessage: 'Failed to upload image',
            data: {'error': e.message},
          );
    } catch (e) {
      return Response(
        requestOptions: RequestOptions(path: ''),
        statusCode: 500,
        statusMessage: 'Unexpected error occurred',
        data: {'error': e.toString()},
      );
    }
  }

  @override
  Future<Response> fetchImageCheckHistory(
      {required int page, required int limit}) async {
    try {
      // Retrieve the session ID from shared preferences
      final sessionId = await sharedPreferenceService.getSessionId();

      if (sessionId == null) {
        return Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 401,
          statusMessage: 'Session ID not found. User may not be logged in.',
          data: {'error': 'Session ID not found'},
        );
      }

      // Prepare query parameters
      final queryParameters = {
        'page': page.toString(),
        'limit': limit.toString(),
      };

      // Send a GET request to the API to fetch the history
      final response = await _dio.get(
        '/images/check_image_history',
        queryParameters: queryParameters,
        options: Options(
          headers: {
            'session-id': sessionId, // Include the session ID here
          },
        ),
      );

      return response;
    } on DioException catch (e) {
      return e.response ??
          Response(
            requestOptions: RequestOptions(path: ''),
            statusCode: 500,
            statusMessage: 'Failed to fetch image check history',
            data: {'error': e.message},
          );
    } catch (e) {
      return Response(
        requestOptions: RequestOptions(path: ''),
        statusCode: 500,
        statusMessage: 'Unexpected error occurred',
        data: {'error': e.toString()},
      );
    }
  }

  @override
  Future<Response> deleteImageCheckHistory(List<int> ids) async {
    try {
      // Retrieve the session ID from shared preferences
      final sessionId = await sharedPreferenceService.getSessionId();

      if (sessionId == null) {
        return Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 401,
          statusMessage: 'Session ID not found. User may not be logged in.',
          data: {'error': 'Session ID not found'},
        );
      }

      // Send a DELETE request to the API to delete the specified IDs
      final response = await _dio.delete(
        '/images/check_image_history',
        data: {'ids': ids},
        options: Options(
          headers: {
            'session-id': sessionId, // Include the session ID here
          },
        ),
      );

      return response;
    } on DioException catch (e) {
      return e.response ??
          Response(
            requestOptions: RequestOptions(path: ''),
            statusCode: 500,
            statusMessage: 'Failed to delete image check history',
            data: {'error': e.message},
          );
    } catch (e) {
      return Response(
        requestOptions: RequestOptions(path: ''),
        statusCode: 500,
        statusMessage: 'Unexpected error occurred',
        data: {'error': e.toString()},
      );
    }
  }
}
