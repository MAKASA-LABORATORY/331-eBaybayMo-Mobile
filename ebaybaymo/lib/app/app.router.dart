// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ebaybaymo/ui/views/about_page/about_page_view.dart' as _i7;
import 'package:ebaybaymo/ui/views/check_auth/check_auth_view.dart' as _i11;
import 'package:ebaybaymo/ui/views/dashboard/dashboard_view.dart' as _i10;
import 'package:ebaybaymo/ui/views/dashboard_signin/dashboard_signin_view.dart'
    as _i12;
import 'package:ebaybaymo/ui/views/history_image/history_image_view.dart'
    as _i13;
import 'package:ebaybaymo/ui/views/home/home_view.dart' as _i2;
import 'package:ebaybaymo/ui/views/sign_in/sign_in_view.dart' as _i5;
import 'package:ebaybaymo/ui/views/sign_up/sign_up_view.dart' as _i6;
import 'package:ebaybaymo/ui/views/startup/startup_view.dart' as _i3;
import 'package:ebaybaymo/ui/views/subscription_message/subscription_message_view.dart'
    as _i9;
import 'package:ebaybaymo/ui/views/subscription_page/subscription_page_view.dart'
    as _i8;
import 'package:ebaybaymo/ui/views/welcome_page/welcome_page_view.dart' as _i4;
import 'package:flutter/material.dart' as _i14;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart' as _i15;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i16;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const welcome_page = '/welcome-page-view';

  static const sign_in = '/sign-in-view';

  static const sign_up = '/sign-up-view';

  static const about = '/about-page-view';

  static const subscription = '/subscription-page-view';

  static const success_page = '/subscription-message-view';

  static const dashboard = '/dashboard-view';

  static const checkAuthView = '/';

  static const dashboardSigninView = '/dashboard-signin-view';

  static const history_page = '/history-image-view';

  static const all = <String>{
    homeView,
    startupView,
    welcome_page,
    sign_in,
    sign_up,
    about,
    subscription,
    success_page,
    dashboard,
    checkAuthView,
    dashboardSigninView,
    history_page,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.welcome_page,
      page: _i4.WelcomePageView,
    ),
    _i1.RouteDef(
      Routes.sign_in,
      page: _i5.SignInView,
    ),
    _i1.RouteDef(
      Routes.sign_up,
      page: _i6.SignUpView,
    ),
    _i1.RouteDef(
      Routes.about,
      page: _i7.AboutPageView,
    ),
    _i1.RouteDef(
      Routes.subscription,
      page: _i8.SubscriptionPageView,
    ),
    _i1.RouteDef(
      Routes.success_page,
      page: _i9.SubscriptionMessageView,
    ),
    _i1.RouteDef(
      Routes.dashboard,
      page: _i10.DashboardView,
    ),
    _i1.RouteDef(
      Routes.checkAuthView,
      page: _i11.CheckAuthView,
    ),
    _i1.RouteDef(
      Routes.dashboardSigninView,
      page: _i12.DashboardSigninView,
    ),
    _i1.RouteDef(
      Routes.history_page,
      page: _i13.HistoryImageView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.WelcomePageView: (data) {
      return _i14.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i4.WelcomePageView(),
        settings: data,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.zoomIn,
        transitionDuration: const Duration(milliseconds: 500),
      );
    },
    _i5.SignInView: (data) {
      return _i14.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i5.SignInView(),
        settings: data,
        transitionsBuilder:
            data.transition ?? _i1.TransitionsBuilders.slideRight,
        transitionDuration: const Duration(milliseconds: 400),
      );
    },
    _i6.SignUpView: (data) {
      return _i14.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i6.SignUpView(),
        settings: data,
        transitionsBuilder:
            data.transition ?? _i1.TransitionsBuilders.slideRight,
        transitionDuration: const Duration(milliseconds: 400),
      );
    },
    _i7.AboutPageView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.AboutPageView(),
        settings: data,
      );
    },
    _i8.SubscriptionPageView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.SubscriptionPageView(),
        settings: data,
      );
    },
    _i9.SubscriptionMessageView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.SubscriptionMessageView(),
        settings: data,
      );
    },
    _i10.DashboardView: (data) {
      final args = data.getArgs<DashboardViewArguments>(nullOk: false);
      return _i14.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _i10.DashboardView(key: args.key, user: args.user),
        settings: data,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 400),
      );
    },
    _i11.CheckAuthView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.CheckAuthView(),
        settings: data,
      );
    },
    _i12.DashboardSigninView: (data) {
      return _i14.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i12.DashboardSigninView(),
        settings: data,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 300),
      );
    },
    _i13.HistoryImageView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.HistoryImageView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class DashboardViewArguments {
  const DashboardViewArguments({
    this.key,
    required this.user,
  });

  final _i14.Key? key;

  final _i15.GoogleSignInAccount user;

  @override
  String toString() {
    return '{"key": "$key", "user": "$user"}';
  }

  @override
  bool operator ==(covariant DashboardViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.user == user;
  }

  @override
  int get hashCode {
    return key.hashCode ^ user.hashCode;
  }
}

extension NavigatorStateExtension on _i16.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToWelcome_page([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.welcome_page,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSign_in([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.sign_in,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSign_up([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.sign_up,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAbout([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.about,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSubscription([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.subscription,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSuccess_page([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.success_page,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDashboard({
    _i14.Key? key,
    required _i15.GoogleSignInAccount user,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.dashboard,
        arguments: DashboardViewArguments(key: key, user: user),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCheckAuthView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.checkAuthView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDashboardSigninView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.dashboardSigninView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHistory_page([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.history_page,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithWelcome_page([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.welcome_page,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSign_in([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.sign_in,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSign_up([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.sign_up,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAbout([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.about,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSubscription([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.subscription,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSuccess_page([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.success_page,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDashboard({
    _i14.Key? key,
    required _i15.GoogleSignInAccount user,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.dashboard,
        arguments: DashboardViewArguments(key: key, user: user),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCheckAuthView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.checkAuthView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDashboardSigninView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.dashboardSigninView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHistory_page([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.history_page,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
