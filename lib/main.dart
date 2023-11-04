// ignore_for_file: prefer_const_constructors, unused_field, unused_import

import 'package:cudo_ride_app/auth/onboarding.dart';
import 'package:cudo_ride_app/auth/onboarding_page.dart';
import 'package:cudo_ride_app/auth/otp_page.dart';
import 'package:cudo_ride_app/auth/register.dart';
import 'package:cudo_ride_app/auth/type.dart';
import 'package:cudo_ride_app/car_reg.dart';
import 'package:cudo_ride_app/dashboard.dart';
import 'package:cudo_ride_app/driver_details_upload.dart';
import 'package:cudo_ride_app/home.dart';
import 'package:cudo_ride_app/load.dart';
import 'package:cudo_ride_app/splash_screen.dart';
import 'package:cudo_ride_app/user_dashboard.dart';
import 'package:cudo_ride_app/utilities/colors.dart';
import 'package:cudo_ride_app/utilities/getit.dart';
import 'package:cudo_ride_app/vehicle_details_upload.dart';
import 'package:cudo_ride_app/vehicle_doc.dart';
import 'package:cudo_ride_app/vehicle_photo.dart';
import 'package:cudo_ride_app/view_models/auth_vm.dart';
import 'package:cudo_ride_app/view_models/vehicle_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async{
  await setup();
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthVm()),
        ChangeNotifierProvider(create: (_) => VehicleVm()),
      ],
      child: const MyApp(),
    ),
  );
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CUDO Ride',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 18,
              ),
              backgroundColor: secondaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
        ),
      ),
      home: UserDashboard(),
    );
  }
}
