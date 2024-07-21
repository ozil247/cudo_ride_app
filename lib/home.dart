// ignore_for_file: prefer_const_constructors, unused_import, unnecessary_import, must_be_immutable, duplicate_ignore, prefer_const_literals_to_create_immutables, non_constant_identifier_names, duplicate_import

import 'package:cudo_ride_app/auth/otp_page.dart';
import 'package:cudo_ride_app/utilities/colors.dart';
import 'package:cudo_ride_app/utilities/text_style.dart';
import 'package:cudo_ride_app/widget/navbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: secondaryColor),
        elevation: 0,
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: 340,
                ),
                FlutterSwitch(
                    width: 130,
                    height: 50,
                    valueFontSize: 25,
                    borderRadius: 30,
                    toggleSize: 30,
                    padding: 8,
                    activeColor: primaryColor,
                    inactiveText: 'Offline',
                    activeText: 'Online',
                    showOnOff: true,
                    value: status,
                    onToggle: (val) {
                      setState(() {
                        status = val;
                      });
                    })
              ],
            )
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              // ignore: prefer_const_constructors
              SizedBox(
                height: 50,
              ),

              SizedBox(
                height: 40,
              ),

              // ignore: prefer_const_constructors
              SizedBox(
                height: 10,
              ),
            ],
          )),
    );
  }
}

Widget imageProfile(context) {
  return Center(
    child: Stack(
      children: [
        CircleAvatar(
          radius: 30.0,
          backgroundImage: AssetImage(
            'assets/per.png',
          ),
        ),
        Positioned(
          bottom: 5.0,
          right: 3.0,
          child: InkWell(
            onTap: () {},
            // ignore: prefer_const_constructors
            child: Icon(
              Icons.camera_alt,
              color: primaryColor,
              size: 20.0,
            ),
          ),
        ),
      ],
    ),
  );
}
