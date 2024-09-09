//ebaybaymo changes

import 'dart:io';
import 'package:ebaybaymo/app/app.locator.dart';
import 'package:ebaybaymo/app/app.router.dart';
import 'package:ebaybaymo/app/app_base_view_model.dart';
import 'package:ebaybaymo/services/api/auth/auth_api_service.dart';
import 'package:ebaybaymo/services/api/auth/auth_service_impl.dart';
import 'package:ebaybaymo/services/api/api_service_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:dio/dio.dart';
import 'package:image/image.dart' as img;

class DashboardSigninViewModel extends AppBaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final AuthApiService _authApiService = AuthServiceImpl();
  final ApiServiceService _apiService = locator<ApiServiceService>();

  File? _pickedImage;
  String? _recognizedText;
  Map<String, dynamic>? _currentUser;

  File? get pickedImage => _pickedImage;
  String? get recognizedText => _recognizedText;
  Map<String, dynamic>? get currentUser => _currentUser;

   Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      // Load the image file
      File originalFile = File(image.path);

      // Resize and compress the image
      File? resizedFile = await _compressImage(originalFile);

      if (resizedFile != null) {
        _pickedImage = resizedFile;
        notifyListeners();
      }
    }
  }

  Future<File?> _compressImage(File imageFile) async {
    try {
      // Decode the image
      final originalImage = img.decodeImage(imageFile.readAsBytesSync());
      if (originalImage == null) return null;

      // Resize the image (e.g., width 800px)
      final resizedImage = img.copyResize(originalImage, width: 800);

      // Save the resized image to a new file
      final compressedFile = File('${imageFile.path}_compressed.jpg')
        ..writeAsBytesSync(img.encodeJpg(resizedImage, quality: 85)); // Adjust quality as needed

      return compressedFile;
    } catch (e) {
      // Handle exceptions, e.g., log or show an error
      print('Error compressing image: $e');
      return null;
    }
  }

  String _transformRecognizedText(String text) {
    return text
        .replaceAll('T', 'TA')
        .replaceAll('E', 'E/I')
        .replaceAll('O', 'O/U')
        .replaceAll('B', 'BA')
        .replaceAll('K', 'KA')
        .replaceAll('D', 'DA')
        .replaceAll('G', 'GA')
        .replaceAll('H', 'HA')
        .replaceAll('L', 'LA')
        .replaceAll('M', 'MA')
        .replaceAll('N', 'NA')
        .replaceAll('X', 'NGA')
        .replaceAll('P', 'PA')
        .replaceAll('S', 'SA')
        .replaceAll('T', 'TA')
        .replaceAll('W', 'WA')
        .replaceAll('Y', 'YA');
  }

  Future<void> transliterateImage() async {
    if (_pickedImage == null) {
      _snackbarService.showSnackbar(message: 'Please capture an image first');
      return;
    }

    setBusy(true);

    try {
      final response = await _apiService.checkImage(_pickedImage!.path);

      if (response.statusCode == 200) {
        _recognizedText = _transformRecognizedText(response.data);
        _snackbarService.showSnackbar(message: 'Image processed successfully');
      } else {
        _snackbarService.showSnackbar(
            message: 'Image processing failed: ${response.data['error']}');
      }
    } on DioException catch (e) {
      _snackbarService.showSnackbar(
          message: 'Failed to process image: ${e.message}');
    } catch (e) {
      _snackbarService.showSnackbar(
          message: 'An unexpected error occurred: ${e.toString()}');
    } finally {
      setBusy(false);
      notifyListeners();
    }
  }

  Future<void> logout() async {
    final response = await _authApiService.logoutUser();

    if (response.statusCode == 200) {
      _navigationService.navigateTo(Routes.sign_in);
      _snackbarService.showSnackbar(message: 'Logged out successfully');
    } else {
      _snackbarService.showSnackbar(
          message: 'Logout failed: ${response.data['error']}');
    }
  }

  Future<void> getCurrentUser() async {
    setBusy(true);

    try {
      final response = await _authApiService.getCurrentUser();

      if (response.statusCode == 200) {
        _currentUser = response.data['user'];
      } else {
        _snackbarService.showSnackbar(
            message: 'Failed to retrieve user: ${response.data['error']}');
      }
    } on DioException catch (e) {
      _snackbarService.showSnackbar(
          message: 'Failed to retrieve user: ${e.message}');
    } catch (e) {
      _snackbarService.showSnackbar(
          message: 'An unexpected error occurred: ${e.toString()}');
    } finally {
      setBusy(false);
      notifyListeners();
    }
  }
}
