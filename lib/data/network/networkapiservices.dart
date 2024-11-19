import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:mvvm/data/app_exceptions.dart';
import 'package:mvvm/data/network/baseApiservices.dart';
import 'package:http/http.dart' as http;
// import 'package:mvvm/data/response/api_response.dart';

class Networkapiservices extends BaseApiServices {
  @override
  Future getGetApiResponse(String? url) async {
    dynamic responsejson;
    try {
      final response = await http.get(Uri.parse(url!)).timeout(
            const Duration(seconds: 10),
          );
      responsejson = returnresponse(response);
    } on SocketException {
      throw FetchDataException(message: 'No Internet Connection');
    }

    return responsejson;
  }

  @override
  Future getPostApiResponse(String? url, dynamic data) async {
    dynamic responsejson;
    try {
      Response response = await post(Uri.parse(url!), body: data).timeout(
        const Duration(
          seconds: 10,
        ),
      );
      responsejson = returnresponse(response);
    } on SocketException {
      throw FetchDataException(message: 'No Internet Connection');
    }

    return responsejson;
  }

  dynamic returnresponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responsejson = jsonDecode(response.body);
        return responsejson;
      case 400:
        throw BadRequestException(message: response.body.toString());
      case 404:
        throw UnAuthorizedException(message: response.body.toString());
      default:
        return FetchDataException(message: 'Error While Communicating');
    }
  }
}
