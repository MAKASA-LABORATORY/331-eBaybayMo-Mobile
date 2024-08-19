import 'dart:io';

import 'package:ebaybaymo/app/app.locator.dart';
import 'package:ebaybaymo/app/app.router.dart';
import 'package:ebaybaymo/app/app_base_view_model.dart';
import 'package:ebaybaymo/google_facebook_auth/google_sign_in_api.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked_services/stacked_services.dart';

class DashboardViewModel extends AppBaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  File? _pickedImage;

  File? get pickedImage => _pickedImage;

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      _pickedImage = File(image.path);
      notifyListeners();
    }
  }

  Future<void> logout() async {
    try {
      await GoogleSignInApi.logout();
      _navigationService.clearStackAndShow(Routes.sign_in);
      snackbarService.showSnackbar(message: 'Logged out successfully');
    } catch (e) {
      snackbarService.showSnackbar(message: 'Logout failed: $e');
    }
  }
}
