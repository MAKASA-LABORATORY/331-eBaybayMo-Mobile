import 'package:dio/dio.dart';
import 'package:ebaybaymo/models/user_auth.dart';
import 'package:ebaybaymo/services/api/auth/auth_api_service.dart';
import 'package:ebaybaymo/services/helpers/dio_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServiceImpl implements AuthApiService {
  AuthServiceImpl({Dio? dio}) : _dio = dio ?? DioClient().instance;

  final Dio _dio;

  static const String sessionIdKey = 'sessionId';

  @override
  Future<Response> registerUser(User user) async {
    try {
      final data = user.toJson();

      final response = await _dio.post('/register', data: data);

      return response;
    } on DioException catch (e) {
      return e.response ??
          Response(
            requestOptions: RequestOptions(path: ''),
            statusCode: 500,
            statusMessage: 'Failed to register user',
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
  Future<Response> loginUser(User user) async {
    try {
      final data = {
        'email': user.email,
        'password': user.password,
      };

      final response = await _dio.post('/login', data: data);

      if (response.statusCode == 200) {
        // Extract the sessionId from the response
        final sessionId = response.data['sessionId'];

        // Save the sessionId to SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(sessionIdKey, sessionId);

        print('Session ID saved: $sessionId');
      }

      return response;
    } on DioException catch (e) {
      return e.response ??
          Response(
            requestOptions: RequestOptions(path: ''),
            statusCode: 500,
            statusMessage: 'Failed to log in user',
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
  Future<Response> logoutUser() async {
    try {
      // Retrieve the sessionId from SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      final sessionId = prefs.getString(sessionIdKey);

      if (sessionId == null) {
        return Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 401,
          statusMessage: 'Session ID not found. User may not be logged in.',
          data: {'error': 'Session ID not found'},
        );
      }

      final response = await _dio.post(
        '/logout',
        options: Options(
          headers: {
            'session-id': sessionId, 
          },
        ),
      );

      if (response.statusCode == 200) {
    
        await prefs.remove(sessionIdKey);
        print('Session ID removed.');
      }

      return response;
    } on DioException catch (e) {
      return e.response ??
          Response(
            requestOptions: RequestOptions(path: ''),
            statusCode: 500,
            statusMessage: 'Failed to log out user',
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
