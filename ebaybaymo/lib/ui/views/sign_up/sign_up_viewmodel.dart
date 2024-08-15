// lib/ui/views/sign_up/sign_up_viewmodel.dart
import 'package:ebaybaymo/app/app.locator.dart';
import 'package:ebaybaymo/app/app.router.dart';
import 'package:ebaybaymo/app/app_base_view_model.dart';
import 'package:ebaybaymo/ui/views/sign_up/validation_mixin.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends AppBaseViewModel with ValidationMixin {
  final NavigationService _navigationService = locator<NavigationService>();
  String email = '';
  String password = '';
  String confirmPassword = '';
  bool showValidationErrors = false;

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
}
