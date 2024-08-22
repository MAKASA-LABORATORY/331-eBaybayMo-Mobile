// lib/ui/views/sign_up/sign_up_viewmodel.dart

import 'package:ebaybaymo/app/app.locator.dart';
import 'package:ebaybaymo/app/app.router.dart';
import 'package:ebaybaymo/app/app_base_view_model.dart';
import 'package:ebaybaymo/google_facebook_auth/google_sign_in_api.dart';
import 'package:ebaybaymo/models/user_auth.dart';
import 'package:ebaybaymo/services/api/auth/auth_api_service.dart';
import 'package:ebaybaymo/ui/views/sign_up/validation_mixin.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends AppBaseViewModel with ValidationMixin {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthApiService _authApiService = locator<AuthApiService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();

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

  Future<void> onSignUp() async {
    showValidationErrors = true;
    notifyListeners();

    if (validateForm()) {
      setBusy(true);

      try {
        final user = User(
            email: email, password: password, username: email.split('@')[0]);
        final response = await _authApiService.registerUser(user);

        if (response.statusCode == 200) {
          _snackbarService.showSnackbar(message: 'Registration Successful');
          _navigationService.navigateTo(Routes.sign_in);
        } else {
          _snackbarService.showSnackbar(
            message: response.data['error'] ?? 'Registration Failed',
          );
        }
      } catch (e) {
        _snackbarService.showSnackbar(
          message: 'An error occurred during registration: $e',
        );
      } finally {
        setBusy(false);
      }
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
      _snackbarService.showSnackbar(message: 'Sign in Failed');
    } else {
      _navigationService.navigateTo(
        Routes.dashboard,
        arguments: DashboardViewArguments(user: user),
      );
      _snackbarService.showSnackbar(message: 'Sign in Successfully');
    }
  }

  Future<void> onFacebookLogoTapped() async {}
}
