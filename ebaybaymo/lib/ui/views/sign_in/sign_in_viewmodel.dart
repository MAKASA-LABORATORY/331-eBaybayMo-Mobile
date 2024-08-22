import 'package:ebaybaymo/app/app.locator.dart';
import 'package:ebaybaymo/app/app.router.dart';
import 'package:ebaybaymo/app/app_base_view_model.dart';
import 'package:ebaybaymo/models/user_auth.dart';
import 'package:ebaybaymo/services/api/auth/auth_api_service.dart';
import 'package:ebaybaymo/services/api/auth/auth_service_impl.dart';
import 'package:ebaybaymo/google_facebook_auth/google_sign_in_api.dart';
import 'package:stacked_services/stacked_services.dart';
import 'validation_mixin.dart';

class SignInViewModel extends AppBaseViewModel with ValidationMixin {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthApiService _authApiService = AuthServiceImpl();

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

  Future<void> signIn() async {
    if (validateEmailField() == null && validatePasswordField() == null) {
      final user = User(email: _email, password: _password, username: '');

      final response = await _authApiService.loginUser(user);

      if (response.statusCode == 200) {
        // Handle successful login
        _navigationService.navigateTo(Routes.dashboardSigninView);
        snackbarService.showSnackbar(message: 'Sign in Successful');
      } else {
        // Handle error
        snackbarService.showSnackbar(
            message: 'Sign in Failed: ${response.data['error']}');
      }
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
