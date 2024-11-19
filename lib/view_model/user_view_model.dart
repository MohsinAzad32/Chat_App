import 'package:flutter/material.dart';
// import 'package:mvvm/utils/routes/routes.dart';
import 'package:mvvm/utils/routes/routes_names.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> logintrue() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    return sp.setBool('login', true);
  }

  Future<bool> loginfalse() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    return sp.setBool('login', false);
  }

  pushScreen(BuildContext context) async {
    final sp = await SharedPreferences.getInstance();
    loginfalse();
    final data = sp.getBool('login');
    if (data != null) {
      if (data == true) {
        Navigator.pushNamed(
          context,
          Routesname.home,
        );
      } else {
        Navigator.pushNamed(
          context,
          Routesname.login,
        );
      }
    }
  }
}
