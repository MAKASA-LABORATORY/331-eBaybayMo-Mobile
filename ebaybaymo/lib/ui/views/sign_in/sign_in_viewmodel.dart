import 'package:ebaybaymo/app/app.locator.dart';
import 'package:ebaybaymo/app/app.router.dart';
import 'package:ebaybaymo/app/app_base_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'validation_mixin.dart';

class SignInViewModel extends AppBaseViewModel with ValidationMixin {
  final NavigationService _navigationService = locator<NavigationService>();
  String _email = '';
  String _password = '';

  bool showEmailError = false;
  bool showPasswordError = false;

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

  void triggerValidation() {
    showEmailError = true;
    showPasswordError = true;
    notifyListeners();
  }

  void signIn() {
    _navigationService.navigateTo(Routes.homepage);
  }
}
