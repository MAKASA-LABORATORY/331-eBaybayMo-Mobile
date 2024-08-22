import 'package:dio/dio.dart';
import 'package:ebaybaymo/services/api/api_service_service.dart';
import 'package:ebaybaymo/services/helpers/dio_client.dart';
import 'package:ebaybaymo/services/shared_preference/shared_preference_service.dart';

class ApiServiceImpl implements ApiServiceService {
  ApiServiceImpl({
    Dio? dio,
    required this.sharedPreferenceService,
  }) : _dio = dio ?? DioClient().instance;

  final Dio _dio;
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
        '/check_image',
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
}
