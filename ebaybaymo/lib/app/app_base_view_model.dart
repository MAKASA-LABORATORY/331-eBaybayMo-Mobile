import 'package:ebaybaymo/app/app.locator.dart';
import 'package:ebaybaymo/services/api/auth/auth_api_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AppBaseViewModel extends BaseViewModel {
  final navigationservice = locator<NavigationService>();
  final snackbarService = locator<SnackbarService>();
  final authService = locator<AuthApiService>();
}
