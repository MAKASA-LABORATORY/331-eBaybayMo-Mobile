import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ebaybaymo/app/app.locator.dart';
import 'package:ebaybaymo/app/app.router.dart';
import 'package:ebaybaymo/app/app_base_view_model.dart';
import 'package:ebaybaymo/google_facebook_auth/google_sign_in_api.dart';
import 'package:ebaybaymo/services/api/api_service_service.dart';
import 'package:ebaybaymo/services/shared_preference/shared_preference_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked_services/stacked_services.dart';

class DashboardViewModel extends AppBaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ApiServiceService _apiService = locator<ApiServiceService>();

  File? _pickedImage;
  String? _recognizedText;

  File? get pickedImage => _pickedImage;
  String? get recognizedText => _recognizedText;

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      _pickedImage = File(image.path);
      notifyListeners();
    }
  }

  Future<void> transliterateImage() async {
    if (_pickedImage == null) {
      _snackbarService.showSnackbar(message: 'Please capture an image first');
      return;
    }

    setBusy(true);

    try {
      // Use the direct checkImage function
      final response = await _apiService.checkImageDirect(_pickedImage!.path);

      if (response.statusCode == 200) {
        // Assuming the API returns the recognized text in response.data
        _recognizedText = response.data;
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
    try {
      await GoogleSignInApi.logout();
      _navigationService.clearStackAndShow(Routes.sign_in);
      _snackbarService.showSnackbar(message: 'Logged out successfully');
    } catch (e) {
      _snackbarService.showSnackbar(message: 'Logout failed: $e');
    }
  }
}
