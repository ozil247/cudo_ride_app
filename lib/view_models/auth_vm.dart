// ignore_for_file: unused_import, prefer_const_constructors

import 'dart:convert';

import 'package:ars_dialog/ars_dialog.dart';
import 'package:cudo_ride_app/auth/onboarding.dart';
import 'package:cudo_ride_app/auth/otp_page.dart';
import 'package:cudo_ride_app/auth/register.dart';
import 'package:cudo_ride_app/auth/type.dart';
import 'package:cudo_ride_app/home.dart';
import 'package:cudo_ride_app/user_dashboard.dart';
import 'package:cudo_ride_app/utilities/alert.dart';
import 'package:cudo_ride_app/utilities/getit.dart';
import 'package:cudo_ride_app/utilities/server.dart';
import 'package:cudo_ride_app/utilities/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthVm extends ChangeNotifier {
  //to access storage
  final storage = getIt.get<LocalStorageService>();

  final phone = TextEditingController();
  String type = 'User';
  final name = TextEditingController();
  final email = TextEditingController();
  final address = TextEditingController();
  final state = TextEditingController();
  final gender = TextEditingController();
  final age = TextEditingController();

  login(context) async {
    final loader = progressLoader(context);
    loader.show();
    final req = await Server().req(
      context,
      "/login-otp",
      type: 'post',
      data: {'phone': "234${phone.text}"},
    );

    loader.dismiss();

    final res = json.decode(req.body);

    if (res['success'] == true) {
      successAlert(context, "OTP Code sent");
      Get.to(OtpPage());
    } else {
      errorAlert(context, res['message']);
    }

    return;
  }

  register(context) async {
    final loader = progressLoader(context);
    loader.show();
    final req = await Server().req(
      context,
      "/send-otp",
      type: 'post',
      data: {'phone': "234${phone.text}"},
    );

    loader.dismiss();

    final res = json.decode(req.body);
    if (res['success'] == true) {
      successAlert(context, "OTP Code sent");
      Get.to(OtpPage());
    } else {
      errorAlert(context, res['message']);
    }

    return;
  }

  final otp_code = TextEditingController();

  otpVerify(context) async {
    final loader = progressLoader(context);
    loader.show();

    final req = await Server().req(
      context,
      "/verify-otp",
      type: 'post',
      data: {
        'phone': "234${phone.text}",
        "otp_code": otp_code.text,
      },
    );
    loader.dismiss();

    final res = json.decode(req.body);
    if (res['success'] == true) {
      successAlert(context, 'login Successful');
      Get.to(Type());
    } else {
      errorAlert(context, res['message']);
    }
    return;
  }

  userTypes(context) async {
    final loader = progressLoader(context);
    loader.show();
    final req = await Server().req(context, '/user-types', type: 'post', data: {
      'type': type,
    });
     final res = json.decode(req.body);
    if (res['success'] == true) {
      storage.setString('token', res['token']);

      successAlert(context, 'Your Profile Have been Updated');
      Get.to(Update());
    } else {
      errorAlert(context, res['message']);
    }
    return;
  }

  update(context) async {
    final loader = progressLoader(context);
    loader.show();
    final req = await Server().req(context, '/register', type: 'post', data: {
      'name': name.text,
      'email': email.text,
      'gender': gender.text,
      'state': state.text,
      'address': address.text,
      'age': age.text,
      'phone': "234${phone.text}",
      'type': type,
    });
    loader.dismiss();
    final res = json.decode(req.body);
    if (res['success'] == true) {
      storage.setString('token', res['token']);

      successAlert(context, 'Your Profile Have been Updated');
      Get.to(Home());
    } else {
      errorAlert(context, res['message']);
    }
    return;
  }

  userType(context) async {
    final req = await Server().req(context, '/user');
    final res = json.decode(req.body);
    if (res['type'] == 'driver') {
      //redirect to rider
      Get.offAll(Home());
    } else {
      //redirect to user dashboard here
      Get.offAll(UserDashboard());
    }
  }
}
