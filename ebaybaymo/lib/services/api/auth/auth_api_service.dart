import 'package:dio/dio.dart';
import 'package:ebaybaymo/models/user_auth.dart';

abstract interface class AuthApiService {
  Future<Response> registerUser(User user);
  Future<Response> loginUser(User user);
  Future<Response> logoutUser();
  Future<Response> getCurrentUser();
}
