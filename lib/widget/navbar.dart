// ignore_for_file: prefer_const_constructors, unused_import

import 'package:cudo_ride_app/about_us.dart';
import 'package:cudo_ride_app/auth/otp_page.dart';
import 'package:cudo_ride_app/auth/register.dart';
import 'package:cudo_ride_app/contact_us.dart';
import 'package:cudo_ride_app/driver/driver_details_upload.dart';
import 'package:cudo_ride_app/utilities/colors.dart';
import 'package:cudo_ride_app/driver/vehicle_details_upload.dart';
import 'package:cudo_ride_app/driver/vehicle_doc.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'David Adeleke',
              style: TextStyle(
                fontSize: 20,
                color: primaryColor,
              ),
            ),
            accountEmail: Text(
              'ozil@gmail.com',
              style: TextStyle(
                fontSize: 16,
                color: secondaryColor,
              ),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/pic.png'),
              fit: BoxFit.cover,
            )),
          ),
          Divider(thickness: 1.07, color: Color(0xff1A214F)),

           ListTile(
            leading: Icon(
              Icons.person,
              color: Color(0xff1A214F),
            ),
            title: Text('Profile Update'),
            textColor: Color(0xff1A214F),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => Update()),
                ),
              );
            },
          ),
          Divider(
            thickness: 1.07,
            color: Color(0xff1A214F),
          ),

           ListTile(
            leading: Icon(
              Icons.car_crash,
              color: Color(0xff1A214F),
            ),
            title: Text('Vehicle Details'),
            textColor: Color(0xff1A214F),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => VehicleDoc()),
                ),
              );
            },
          ),
          Divider(
            thickness: 1.07,
            color: Color(0xff1A214F),
          ),


          ListTile(
            leading: Icon(
              Icons.share,
              color: Color(0xff1A214F),
            ),
            title: Text('History'),
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
