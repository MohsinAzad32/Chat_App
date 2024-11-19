import 'package:mvvm/data/network/baseApiservices.dart';
import 'package:mvvm/data/network/networkapiservices.dart';
import 'package:mvvm/res/app_url.dart';

class AuthRepo {
  final BaseApiServices _services = Networkapiservices();

  Future<dynamic> login(dynamic data) async {
    try {
      dynamic response =
          await _services.getPostApiResponse(AppUrl.loginurl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> resgister(dynamic data) async {
    try {
      dynamic response =
          await _services.getPostApiResponse(AppUrl.signUpnurl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
