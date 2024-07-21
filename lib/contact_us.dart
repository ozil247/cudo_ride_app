// ignore_for_file: prefer_const_constructors, duplicate_ignore, avoid_unnecessary_containers, deprecated_member_use, unnecessary_new, unused_import

import 'package:cudo_ride_app/auth/otp_page.dart';
import 'package:cudo_ride_app/driver/dashboard.dart';
import 'package:cudo_ride_app/utilities/colors.dart';
import 'package:cudo_ride_app/utilities/text_style.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const BackButton(
            color: Color(0xffFF9E00),
          ),
          backgroundColor: primaryColor,
          title: Text('Profile Update',style: bigTextYellow,)),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              child: Column(children: [
                SizedBox(
                  height: 70,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 350,
                      child: Text('We Will get back to you within 24 hours',style: bigTextBlue,),
                    )
                  ],
                   /* children: [
                    SizedBox(
                      width: 350,
                      child: Text('We Will get back to you within 24 hours',style: bigTextBlue,),
                    )
                  ], */
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone',
                  ),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Address',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 5, bottom: 200),
                    border: OutlineInputBorder(),
                    labelText: 'Message',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 70,
                ),
                SizedBox(
                  width: 350,
                  height: 50,
                  child: Container(
                    // ignore: sort_child_properties_last
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Dashboard()));
                      },
                      // ignore: sort_child_properties_last
                      child: Text('Submit', style: smallTextBlue,)
                      ),
                      
                    ),
                  ),
                
                SizedBox(
                  height: 100,
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
