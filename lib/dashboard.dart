// ignore_for_file: prefer_const_constructors, unused_import

import 'package:cudo_ride_app/auth/driver_details_upload.dart';
import 'package:cudo_ride_app/home.dart';
import 'package:cudo_ride_app/utilities/colors.dart';
import 'package:cudo_ride_app/vehicle_details_upload.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List pages = [
    Home(),
    DriverDetailsUpload(),
    VehicleDetailsUpload()

  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 10,
        selectedFontSize: 16,
        type: BottomNavigationBarType.fixed,
        backgroundColor: primaryColor,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: secondaryColor,
        unselectedItemColor: secondaryColor.withOpacity(0.5),
        showUnselectedLabels: true,
        showSelectedLabels: true,
        elevation: 0,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'Upload', icon: Icon(Icons.person)),
          BottomNavigationBarItem(
              label: 'VehicleDetailsUpload', icon: Icon(Icons.notification_add)),
          BottomNavigationBarItem(
              label: 'Profile', icon: Icon(Icons.account_box)),
        ],
      ),
    );
  }
}
