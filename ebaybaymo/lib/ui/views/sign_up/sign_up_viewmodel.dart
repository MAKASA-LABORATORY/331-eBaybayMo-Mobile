// lib/ui/views/sign_up/sign_up_viewmodel.dart
import 'package:ebaybaymo/app/app.locator.dart';
import 'package:ebaybaymo/app/app.router.dart';
import 'package:ebaybaymo/app/app_base_view_model.dart';
import 'package:ebaybaymo/google_facebook_auth/google_sign_in_api.dart';
import 'package:ebaybaymo/ui/views/sign_up/validation_mixin.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends AppBaseViewModel with ValidationMixin {
  final NavigationService _navigationService = locator<NavigationService>();
  String email = '';
  String password = '';
  String confirmPassword = '';
  bool showValidationErrors = false;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  bool validateForm() {
    bool isValid = validateEmail(email) == null &&
        validatePassword(password) == null &&
        validateConfirmPassword(password, confirmPassword) == null;

    return isValid;
  }

  void onSignUp() {
    showValidationErrors = true;
    notifyListeners();

    if (validateForm()) {
      _navigationService.navigateTo(Routes.sign_in);
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    notifyListeners();
  }

  Future<void> onGoogleLogoTapped() async {
    final user = await GoogleSignInApi.login();

    if (user == null) {
      snackbarService.showSnackbar(message: 'Sign in Failed');
    } else {
      _navigationService.navigateTo(
        Routes.dashboard,
        arguments: DashboardViewArguments(user: user),
      );
      snackbarService.showSnackbar(message: 'Sign in Successfully');
    }
  }

  Future<void> onFacebookLogoTapped() async {}
}
