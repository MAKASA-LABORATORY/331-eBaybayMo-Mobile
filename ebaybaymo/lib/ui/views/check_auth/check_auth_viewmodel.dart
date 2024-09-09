import 'package:dio/dio.dart';
import 'package:ebaybaymo/app/app.locator.dart';
import 'package:ebaybaymo/app/app.router.dart';
import 'package:ebaybaymo/app/app_base_view_model.dart';
import 'package:ebaybaymo/google_facebook_auth/google_sign_in_api.dart';
import 'package:ebaybaymo/services/api/auth/auth_api_service.dart';
import 'package:ebaybaymo/services/api/auth/auth_service_impl.dart';
import 'package:ebaybaymo/services/shared_preference/shared_preference_service.dart';
import 'package:stacked_services/stacked_services.dart';

class CheckAuthViewModel extends AppBaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthApiService _authApiService = AuthServiceImpl();
  final SharedPreferenceService _sharedPreferenceService = locator<SharedPreferenceService>();

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  Future<void> checkAuthentication() async {
    try {
      // Set loading to true
      _isLoading = true;
      notifyListeners();

      // First, check custom API authentication
      bool isCustomAuthValid = await _checkCustomApiAuthentication();
      if (isCustomAuthValid) {
        return; // Custom API auth valid, no need to check Google
      }

      // If custom API authentication fails, check Google sign-in
      await _checkGoogleSignInAuthentication();
    } catch (e) {
      print('Error checking authentication: $e');
      _navigationService.clearStackAndShow(Routes.sign_in);
    } finally {
      // Set loading to false
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> _checkCustomApiAuthentication() async {
    try {
      // Retrieve the session ID
      String? sessionId = await _sharedPreferenceService.getSessionId();
      print('Retrieved Session ID: $sessionId');

      if (sessionId == null) {
        print('No session ID found, returning false.');
        return false;
      }

      // Call the getCurrentUser API
      Response response = await _authApiService.getCurrentUser();
      print('API Response: ${response.statusCode}, Data: ${response.data}');

      if (response.statusCode == 200 && response.data != null) {
        print('User is signed in with custom API: ${response.data}');
        _navigationService.navigateTo(Routes.dashboardSigninView);
        return true;
      } else {
        print('User is not signed in or session expired.');
        return false;
      }
    } catch (e) {
      print('Error checking custom API authentication: $e');
      return false;
    }
  }

  Future<void> _checkGoogleSignInAuthentication() async {
    bool isSignedIn = await GoogleSignInApi.isSignedIn();
    print('User is signed in with Google: $isSignedIn');

    if (isSignedIn) {
      await Future.delayed(const Duration(milliseconds: 1000));
      final user = await GoogleSignInApi.getCurrentUser();
      print('Current Google user: $user');

      if (user != null) {
        print('Navigating to Dashboard with Google user: ${user.displayName}');
        _navigationService.navigateTo(
          Routes.dashboard,
          arguments: DashboardViewArguments(user: user),
        );
      } else {
        print('User is signed in with Google but no user info found. Navigating to Sign-In.');
        _navigationService.clearStackAndShow(Routes.sign_in);
      }
    } else {
      print('User is not signed in with Google. Navigating to Welcome Page.');
      _navigationService.clearStackAndShow(Routes.welcome_page);
    }
  }
}