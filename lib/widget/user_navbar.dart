// ignore_for_file: prefer_const_constructors

import 'package:cudo_ride_app/about_us.dart';
import 'package:cudo_ride_app/auth/otp_page.dart';
import 'package:cudo_ride_app/auth/register.dart';
import 'package:cudo_ride_app/contact_us.dart';
import 'package:cudo_ride_app/utilities/colors.dart';
import 'package:cudo_ride_app/driver/vehicle_doc.dart';
import 'package:flutter/material.dart';

class UserNavbar extends StatefulWidget {
  const UserNavbar({super.key});

  @override
  State<UserNavbar> createState() => _UserNavbarState();
}

class _UserNavbarState extends State<UserNavbar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: primaryColor
            ),
            accountName: Text(
              'David Adeleke' ,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            accountEmail: Text(
              'ozil@gmail.com',
              style: TextStyle(
                fontSize: 16,
                color: secondaryColor,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.car_crash_sharp,
              color: Color(0xff1A214F),
            ),
            title: Text('My Trips'),
            textColor: Color(0xff1A214F),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: ((context) => Dashboard()),
              //   ),
              // );
            },
          ),
          Divider(
            thickness: 1.07,
            color: Color(0xff1A214F),
          ),
          ListTile(
            leading: Icon(Icons.note, color: Color(0xff1A214F)),
            title: Text('Contact Us'),
            textColor: Color(0xff1A214F),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => ContactUs())));
            },
          ),
          Divider(thickness: 1.07, color: Color(0xff1A214F)),
          ListTile(
            leading: Icon(Icons.message, color: Color(0xff1A214F)),
            title: Text('About Us'),
            textColor: Color(0xff1A214F),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => AboutUs())));
            },
          ),
          Divider(thickness: 1.07, color: Color(0xff1A214F)),
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Color(0xff1A214F)),
            title: Text('LogOut'),
            textColor: Color(0xff1A214F),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => OtpPage()));
            },
          ),
          Divider(thickness: 1.07, color: Color(0xff1A214F)),
        ],
      ),
    );
  }
}

Widget profile(context) {
  return Container(
    child: Stack(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('assets/per.png'),
        ),
        Positioned(
            bottom: 2.0,
            right: 1.0,
            child: InkWell(
              onTap: () {},
              child: Icon(
                Icons.camera_alt,
                color: primaryColor,
              ),
            ))
      ],
    ),
  );
}
