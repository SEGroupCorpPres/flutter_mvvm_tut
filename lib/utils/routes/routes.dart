import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_tut/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_tut/view/home_view.dart';
import 'package:flutter_mvvm_tut/view/login_view.dart';
import 'package:flutter_mvvm_tut/view/sign_up_view.dart';
import 'package:flutter_mvvm_tut/view/splash_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return CupertinoPageRoute(builder: (BuildContext context) => const SplashView());
      case RoutesName.home:
        return CupertinoPageRoute(builder: (BuildContext context) => const HomeScreen());
      case RoutesName.login:
        return CupertinoPageRoute(builder: (BuildContext context) => const LoginView());
      case RoutesName.signUp:
        return CupertinoPageRoute(builder: (BuildContext context) => const SignUpView());
      default:
        return CupertinoPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          ),
        );
    }
  }
}
