// ignore_for_file: prefer_const_constructors, unused_import, unnecessary_import, must_be_immutable, duplicate_ignore, prefer_const_literals_to_create_immutables, non_constant_identifier_names, duplicate_import

import 'package:cudo_ride_app/auth/otp_page.dart';
import 'package:cudo_ride_app/utilities/colors.dart';
import 'package:cudo_ride_app/utilities/text_style.dart';
import 'package:cudo_ride_app/widget/navbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:slider_button/slider_button.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool status = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: secondaryColor),
        elevation: 0,
        title: Row(
          children: [
            SizedBox(
              width: 220,
            ),
            FlutterSwitch(
                width: 120,
                height: 40,
                valueFontSize: 20,
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
        ),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              // ignore: prefer_const_constructors
              SizedBox(
                height: 500,
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Container(
                        width: double.infinity,
                        height: 150,
                        child: Card(
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        //please change Dashboard to Register
                                        builder: (context) => OtpPage(),
                                      ),
                                    );
                                  },
                                  // ignore: sort_child_properties_last
                                  child: Text(
                                    'Accept',
                                    style: smallTextBlue,
                                  ),
                                ),
                              ),
                              SizedBox(width: 70,),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        //please change Dashboard to Register
                                        builder: (context) => OtpPage(),
                                      ),
                                    );
                                  },
                                  // ignore: sort_child_properties_last
                                  child: Text(
                                    'Cancel',
                                    style: smallTextBlue,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                  ),
                ],
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
          backgroundImage: AssetImage('assets/per.png'),
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
              size: 15.0,
            ),
          ),
        ),
      ],
    ),
  );
}
