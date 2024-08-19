import 'package:flutter/material.dart';
import 'package:ebaybaymo/app/app.bottomsheets.dart';
import 'package:ebaybaymo/app/app.dialogs.dart';
import 'package:ebaybaymo/app/app.locator.dart';
import 'package:ebaybaymo/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final snackbarService = locator<SnackbarService>();

    snackbarService.registerSnackbarConfig(
      SnackbarConfig(
        backgroundColor: const Color.fromARGB(255, 65, 64, 64),
        borderRadius: 20,
        //    duration: Constants.defDuration,
        snackPosition: SnackPosition.BOTTOM,
        textColor: const Color.fromARGB(255, 255, 255, 255),
        margin: const EdgeInsets.all(10),
        dismissDirection: DismissDirection.horizontal,
        padding: const EdgeInsets.fromLTRB(16, 10, 0, 16),
      ),
    );

    return MaterialApp(
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
