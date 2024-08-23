import 'package:dio/dio.dart';

abstract class ApiServiceService {
  Future<Response> checkImage(String imagePath);
  Future<Response> checkImageDirect(String imagePath);
}
