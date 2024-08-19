import 'package:ebaybaymo/app/app.locator.dart';
import 'package:ebaybaymo/app/app.router.dart';
import 'package:ebaybaymo/app/app_base_view_model.dart';
import 'package:ebaybaymo/google_facebook_auth/google_sign_in_api.dart';
import 'package:stacked_services/stacked_services.dart';
import 'validation_mixin.dart';

class SignInViewModel extends AppBaseViewModel with ValidationMixin {
  final NavigationService _navigationService = locator<NavigationService>();
  String _email = '';
  String _password = '';

  bool showEmailError = false;
  bool showPasswordError = false;
  bool isPasswordVisible = false;

  void onEmailChanged(String email) {
    _email = email;
    notifyListeners();
  }

  void onPasswordChanged(String password) {
    _password = password;
    notifyListeners();
  }

  String? validateEmailField() {
    return validateEmail(_email);
  }

  String? validatePasswordField() {
    return validatePassword(_password);
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  void triggerValidation() {
    showEmailError = true;
    showPasswordError = true;
    notifyListeners();
  }

  void signIn() {
    if (validateEmailField() == null && validatePasswordField() == null) {
      _navigationService.navigateTo(Routes.dashboard);
    } else {
      triggerValidation();
    }
  }

  void navigateToSignUp() {
    _navigationService.navigateTo(Routes.sign_up);
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
