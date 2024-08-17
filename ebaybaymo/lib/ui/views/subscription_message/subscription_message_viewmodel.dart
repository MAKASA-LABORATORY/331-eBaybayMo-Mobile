import 'dart:async';
import 'package:ebaybaymo/app/app.locator.dart';
import 'package:ebaybaymo/app/app.router.dart';
import 'package:ebaybaymo/app/app_base_view_model.dart';
import 'package:stacked_services/stacked_services.dart';

class SubscriptionMessageViewModel extends AppBaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  void startNavigation() {
    Future.delayed(const Duration(seconds: 4), () {
      _navigationService.navigateTo(Routes.dashboard);
    });
  }
}
