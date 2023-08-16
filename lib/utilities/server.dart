// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'dart:convert';
import 'dart:io';
import 'package:cudo_ride_app/utilities/alert.dart';
import 'package:cudo_ride_app/utilities/storage_service.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Server {
  final _url = 'http://127.0.0.1:8000/api';

  String? token;
  String kGoogleApiKey = "";

  _getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    token = LocalStorageService(prefs).getString("token");
  }
  

  req(context, apiUrl, {String? type = 'get', data}) async {
    var fullUrl = _url + apiUrl;
    var response;
    try {
      await _getToken();
      if (type == 'post') {
        response = await http.post(Uri.parse(fullUrl),
            body: jsonEncode(data), headers: _setHeaders());
      } else {
        response = await http.get(Uri.parse(fullUrl), headers: _setHeaders());
        // print(response.statusCode);
      }

      if (response.statusCode == 401) {
        errorAlert(context, 'Session expired');
        // await Get.offAll(() => Login());
        await Future.delayed(Duration(seconds: 2));
      } else if (response.statusCode == 500) {
        errorAlert(context, 'An error occured, please try again');
        print(response.body);
      }
    } on SocketException {
      // await Get.offAll(() => NetworkError());
      errorAlert(context, 'No internet connection');
      await Future.delayed(Duration(seconds: 3));
    }
    return response;
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
}
