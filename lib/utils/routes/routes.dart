import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_names.dart';
import 'package:mvvm/view/home.dart';
import 'package:mvvm/view/login_view.dart';
import 'package:mvvm/view/signup_view.dart';
import 'package:mvvm/view/splash.dart';

class Routes {
  static Route<dynamic> generateroutes(RouteSettings setting) {
    switch (setting.name) {
      case Routesname.splash:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SplashScreen(),
        );
      case Routesname.home:
        return MaterialPageRoute(
          builder: (BuildContext context) => const HomeScreen(),
        );
      case Routesname.login:
        return MaterialPageRoute(
          builder: (BuildContext context) => const LoginView(),
        );
      case Routesname.singup:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SignupView(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text('No Routes Defined'),
              ),
            );
          },
        );
    }
  }
}
