import 'package:ebaybaymo/services/api/api_service_impl.dart';
import 'package:ebaybaymo/services/api/api_service_service.dart';
import 'package:ebaybaymo/services/api/auth/auth_api_service.dart';
import 'package:ebaybaymo/services/api/auth/auth_service_impl.dart';
import 'package:ebaybaymo/services/shared_preference/shared_preference_impl.dart';
import 'package:ebaybaymo/services/shared_preference/shared_preference_service.dart';
import 'package:ebaybaymo/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:ebaybaymo/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:ebaybaymo/ui/views/home/home_view.dart';
import 'package:ebaybaymo/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ebaybaymo/ui/views/welcome_page/welcome_page_view.dart';
import 'package:ebaybaymo/ui/views/sign_in/sign_in_view.dart';
import 'package:ebaybaymo/ui/views/sign_up/sign_up_view.dart';
import 'package:ebaybaymo/ui/views/about_page/about_page_view.dart';
import 'package:ebaybaymo/ui/views/subscription_page/subscription_page_view.dart';
import 'package:ebaybaymo/ui/views/subscription_message/subscription_message_view.dart';
import 'package:ebaybaymo/ui/views/dashboard/dashboard_view.dart';
import 'package:ebaybaymo/ui/views/check_auth/check_auth_view.dart';
import 'package:ebaybaymo/ui/views/dashboard_signin/dashboard_signin_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(
      page: WelcomePageView,
      name: 'welcome_page',
    ),
    MaterialRoute(page: SignInView, name: 'sign_in'),
    MaterialRoute(page: SignUpView, name: 'sign_up'),
    MaterialRoute(page: AboutPageView, name: 'about'),
    MaterialRoute(page: SubscriptionPageView, name: 'subscription'),
    MaterialRoute(page: SubscriptionMessageView, name: 'success_page'),
    MaterialRoute(page: DashboardView, name: 'dashboard'),
    MaterialRoute(page: CheckAuthView, initial: true),
    MaterialRoute(page: DashboardSigninView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ApiServiceImpl, asType: ApiServiceService),
    LazySingleton(classType: AuthServiceImpl, asType: AuthApiService),
    LazySingleton(
        classType: SharedPreferenceServiceImpl,
        asType: SharedPreferenceService),
    LazySingleton(classType: SnackbarService),

    // @stacked-servicedart
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
