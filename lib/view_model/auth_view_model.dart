// ignore_for_file: use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
import 'package:mvvm/repository/auth_repo.dart';
import 'package:mvvm/utils/routes/routes_names.dart';
import 'package:mvvm/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final repo = AuthRepo();

  bool loading = false;
  bool _signuploading = false;
  bool get newloading => loading;

  bool get signuploading => _signuploading;

  setloading(value) {
    loading = value;
    notifyListeners();
  }

  setsignuploading(value) {
    _signuploading = value;
    notifyListeners();
  }

  Future<void> login(dynamic data, BuildContext context) async {
    setloading(true);
    repo.login(data).then(
      (value) {
        setloading(false);
        Utils.showflushbar('Login Successful', context);
        Navigator.pushNamed(context, Routesname.home);
        if (kDebugMode) {
          print(value.toString());
        }
      },
    ).onError(
      (error, stackTrace) {
        setloading(false);
        Utils.showflushbar(error.toString(), context);
        if (kDebugMode) {
          print(error.toString());
        }
      },
    );
  }

  Future<void> register(dynamic data, BuildContext context) async {
    setsignuploading(true);
    repo.resgister(data).then(
      (value) {
        setsignuploading(false);
        Utils.showflushbar('SignUp Successfull', context);
        Navigator.pushNamed(context, Routesname.home);
        if (kDebugMode) {
          print(value.toString());
        }
      },
    ).onError(
      (error, stackTrace) {
        setsignuploading(false);
        Utils.showflushbar(error.toString(), context);
        if (kDebugMode) {
          print(error.toString());
        }
      },
    );
  }
}
