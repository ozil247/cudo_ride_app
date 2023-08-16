// ignore_for_file: prefer_const_constructors, unused_import, unnecessary_import, must_be_immutable, duplicate_ignore, prefer_const_literals_to_create_immutables, non_constant_identifier_names, duplicate_import

import 'package:cudo_ride_app/auth/otp_page.dart';
import 'package:cudo_ride_app/utilities/colors.dart';
import 'package:cudo_ride_app/utilities/text_style.dart';
import 'package:cudo_ride_app/widget/navbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: secondaryColor),
        backgroundColor: primaryColor,
        elevation: 0,
        title: Row(
          children: [
            Text(
              'DASHBOARD',
              style: TextStyle(color: secondaryColor),
            ),
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
              Row(
                children: [
                  CircleAvatar(
                    child: ClipOval(
                      child: imageProfile(context),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'Hello ,  ',
                            style:
                                TextStyle(color: Colors.black, fontSize: 14)),
                        TextSpan(
                            text: 'Mr. Ozil',
                            style: TextStyle(
                                color: secondaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold))
                      ])),
                      Text(
                        'Your Destination Please',
                        style: bigTextBlue,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Search Services',
                    prefixIcon: Icon(Icons.search)),
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
