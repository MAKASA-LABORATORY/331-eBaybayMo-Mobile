import 'package:ebaybaymo/app/app.locator.dart';
import 'package:ebaybaymo/app/app.router.dart';
import 'package:ebaybaymo/app/app_base_view_model.dart';
import 'package:ebaybaymo/google_facebook_auth/google_sign_in_api.dart';
import 'package:stacked_services/stacked_services.dart';

class CheckAuthViewModel extends AppBaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  Future<void> checkAuthentication() async {
    bool isSignedIn = await GoogleSignInApi.isSignedIn();
    print('User is signed in: $isSignedIn');

    if (isSignedIn) {
      await Future.delayed(const Duration(milliseconds: 1000));
      final user = await GoogleSignInApi.getCurrentUser();
      print('Current user: $user');

      if (user != null) {
        print('Navigating to Dashboard with user: ${user.displayName}');
        _navigationService.navigateTo(
          Routes.dashboard,
          arguments: DashboardViewArguments(user: user),
        );
      } else {
        print(
            'User is signed in but no user info found. Navigating to Sign-In.');
        _navigationService.clearStackAndShow(Routes.sign_in);
      }
    } else {
      print('User is not signed in. Navigating to Sign-In.');
      _navigationService.clearStackAndShow(Routes.welcome_page);
    }
  }
}
