import 'dart:convert';

import 'package:ars_dialog/ars_dialog.dart';
import 'package:cudo_ride_app/auth/otp_page.dart';
import 'package:cudo_ride_app/auth/register.dart';
import 'package:cudo_ride_app/home.dart';
import 'package:cudo_ride_app/utilities/alert.dart';
import 'package:cudo_ride_app/utilities/server.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthVm extends ChangeNotifier {
  final phone = TextEditingController();

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
      Get.to(Update());
    } else {
      errorAlert(context, res['message']);
    }
    return;
  }

  final type = TextEditingController();
  final name = TextEditingController();
  final email = TextEditingController();
  final address = TextEditingController();
  final state = TextEditingController();
  final gender = TextEditingController();
  final age = TextEditingController();

  update(context) async {
    final loader = progressLoader(context);
    loader.show();
    final req = await Server().req(context, '/register', type: 'post', data: {
      'email': email.text,
      'gender': gender.text,
      'state': state.text,
      'address': address.text,
      'age': age.text,
      'type': type.text,
    });
    loader.dismiss;
    final res = json.decode(req.body);
    if (req['success'] == true) {
      successAlert(context, 'Your Profile Have been Updated');
      Get.to(Home());
    } else {
      errorAlert(context, res['message']);
    }
    return;
  }
}