/* ************************************************************************
* Directory Name: lib                                                     *
* File Name: router_generator.dart                                        *
* Created At: Saturday, 9th April 2022 7:56:23 am                         *
* Created By: singsys (Harshit Kishor)                                    *
************************************************************************ */
//! All routes are generated here
import 'package:flutter/material.dart';
import 'package:flutter_firebase/helpers/index.dart';
import 'package:flutter_firebase/views/index.dart';

class RoutesConst {
  // Routes Name
  static const splash = '/splash';
  static const login = '/login';
  static const register = '/register';
  static const forgotPassword = '/forgot-password';
  static const dashboard = '/dashboard';
  static const changePass = '/change-password';
  static const localNoti = '/local-nnotification';

  //Router...
  static Route<dynamic> generateRoute(RouteSettings settings) {
    printError('${settings.name}');
    printError('${settings.arguments}');
    Map<dynamic, dynamic>? params =
        settings.arguments == null ? null : settings.arguments as Map;
    switch (settings.name) {
      //! Splash Route
      case splash:
        return _GeneratePageRoute(
          widget: const SplashScreen(),
          routeName: settings.name,
        );
//! Login Route
      case login:
        return _GeneratePageRoute(
          widget: const LoginScreen(),
          routeName: settings.name,
        );
      //! Register Route
      case register:
        return _GeneratePageRoute(
          widget: const RegisterScreen(),
          routeName: settings.name,
        );
      //! Forgot Route
      case forgotPassword:
        return _GeneratePageRoute(
          widget: const ForgotPasswordScreen(),
          routeName: settings.name,
        );
      //! Forgot Route
      case dashboard:
        return _GeneratePageRoute(
          widget: const DashboardScreen(),
          routeName: settings.name,
        );
      //! Change Route
      case changePass:
        return _GeneratePageRoute(
          widget: const ChangePasswordScreen(),
          routeName: settings.name,
        );
      //!Local Notification
      case localNoti:
        return _GeneratePageRoute(
          widget: const LocalNotification(),
          routeName: settings.name,
        );
      //! Default route (Invalid Url)
      default:
        return _GeneratePageRoute(
          widget: Scaffold(
            body: Container(
              margin: const EdgeInsets.only(top: 10, left: 10),
              width: 100,
              child: const Center(
                child: Text(
                  "Invalid url",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    fontFamily: "raleway",
                  ),
                ),
              ),
            ),
          ),
          routeName: '/error',
        );
    }
  }
}

//! Widget for generating routes with screen and route name (For Animation)
class _GeneratePageRoute extends PageRouteBuilder {
  final Widget widget;
  final String? routeName;
  final bool isAction;
  _GeneratePageRoute({
    required this.widget,
    required this.routeName,
    this.isAction = false,
  }) : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return widget;
          },
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            Animation<Offset> offset = isAction
                ? Tween<Offset>(
                    begin: const Offset(0.0, 1.0),
                    end: Offset.zero,
                  ).animate(animation)
                : Tween<Offset>(
                    begin: const Offset(1.0, 0.0),
                    end: Offset.zero,
                  ).animate(animation);
            return SlideTransition(
              textDirection: TextDirection.ltr,
              position: offset,
              child: child,
            );
          },
        );
}
