import 'package:ebaybaymo/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:ebaybaymo/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:ebaybaymo/ui/views/home/home_view.dart';
import 'package:ebaybaymo/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ebaybaymo/ui/views/welcome_page/welcome_page_view.dart';
import 'package:ebaybaymo/ui/views/sign_in/sign_in_view.dart';
import 'package:ebaybaymo/ui/views/sign_up/sign_up_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: WelcomePageView, name: 'welcome_page', initial: true),
    MaterialRoute(page: SignInView, name: 'sign_in'),
    MaterialRoute(page: SignUpView, name: 'sign_up'),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
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
