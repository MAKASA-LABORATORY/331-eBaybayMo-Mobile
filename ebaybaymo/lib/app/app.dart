import 'package:ebaybaymo/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:ebaybaymo/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:ebaybaymo/ui/views/home/home_view.dart';
import 'package:ebaybaymo/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ebaybaymo/ui/views/welcome_page/welcome_page_view.dart';
import 'package:ebaybaymo/ui/views/sign_in/sign_in_view.dart';
import 'package:ebaybaymo/ui/views/sign_up/sign_up_view.dart';
import 'package:ebaybaymo/ui/views/homepage_ebaybaymo/homepage_ebaybaymo_view.dart';
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
    MaterialRoute(page: HomepageEbaybaymoView, name: 'homepage'),
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
