import 'package:dio/dio.dart';

abstract class ApiServiceService {
  Future<Response> checkImage(String imagePath);
  Future<Response> checkImageDirect(String imagePath);
  Future<Response> fetchImageCheckHistory(
      {required int page, required int limit});
  Future<Response> deleteImageCheckHistory(List<int> ids);
}
