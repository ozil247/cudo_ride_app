// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cudo_ride_app/auth/onboarding.dart';
import 'package:cudo_ride_app/auth/type.dart';
import 'package:cudo_ride_app/home.dart';
import 'package:cudo_ride_app/utilities/getit.dart';
import 'package:cudo_ride_app/utilities/storage_service.dart';
import 'package:cudo_ride_app/view_models/auth_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    nextPage();
  }

  Future<void> nextPage() async {
    await Future.delayed(Duration(seconds: 3));
    final token = getIt.get<LocalStorageService>().getString("token");
    if (token != '') {
      await AuthVm().userType(context);
      return;
    }
    await Get.offAll(Onboarding());
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 380,
            ),
            Center(child: Image(image: AssetImage('assets/logo.png')))
          ],
        ),
      ),
    );
  }
}
