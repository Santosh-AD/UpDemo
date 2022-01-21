import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:up_demo_1/presentation/dashboard/dashboard_screen.dart';
import 'package:up_demo_1/presentation/login/login_screen.dart';

class AppRoutes {
  Route onRouteGenerate(RouteSettings settings) {
    switch (settings.name) {
      case '/':
      case LoginScreen.route:
        return _push(const LoginScreen(), settings: settings);
      case DashboardScreen.route:
        return _push(const DashboardScreen(), settings: settings);
      default:
        return _push(const LoginScreen(), settings: settings);
    }
  }

  static Route _push(Widget widget, {RouteSettings? settings}) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = 0.0;
        const end = 1.0;
        const curve = Curves.ease;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return FadeTransition(
          opacity: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static Future nextPage(BuildContext context, Widget child) async {
    return await Navigator.push(context, _push(child));
  }

  static Future nextPageNamed(BuildContext context, String route, {Map? arguments}) async {
    return await Navigator.pushNamed(context, route, arguments: arguments);
  }

  static Future pop(BuildContext context, {result}) async {
    return Navigator.pop(context, result);
  }

  static Future pageReplace(BuildContext context, Widget child) async {
    return await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => child));
  }

  static Future pageReplaceNamed(BuildContext context, String route) async {
    return await Navigator.pushReplacementNamed(context, route);
  }

  static Future popUntil(BuildContext context, String route) async {
    return Navigator.popUntil(context, (routes) => routes.settings.name == route);
  }
}
