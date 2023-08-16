// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cudo_ride_app/driver_photo.dart';
import 'package:cudo_ride_app/license.dart';
import 'package:cudo_ride_app/utilities/colors.dart';
import 'package:cudo_ride_app/utilities/text_style.dart';
import 'package:cudo_ride_app/vehicle_details_upload.dart';
import 'package:flutter/material.dart';

class DriverDetailsUpload extends StatefulWidget {
  const DriverDetailsUpload({super.key});

  @override
  State<DriverDetailsUpload> createState() => _DriverDetailsUploadState();
}

class _DriverDetailsUploadState extends State<DriverDetailsUpload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Drivers Details Upload',
          style: bigTextYellow,
        ),
        leading: const BackButton(
          color: Color(0xffFF9E00),
        ),
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 100),
          child: Column(
            children: [
              Text(
                'Here are the documents you need to set up your account',
                style: bigTextBlue,
              ),
              SizedBox(
                height: 60,
              ),
              ListTile(
                leading: Icon(
                  Icons.file_copy,
                  color: primaryColor,
                ),
                subtitle: Text(
                  'Please provide your diriving License clearly showing your face and details',
                  style: TextStyle(color: secondaryColor),
                ),
                title: Text(
                  'Drivers Photo',
                  style: smallTextBlue,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => DriverPhoto()),
                    ),
                  );
                },
              ),
              SizedBox(height: 15,),
              ListTile(
                leading: Icon(
                  Icons.file_copy,
                  color: primaryColor,
                ),
                subtitle: Text(
                  'Please provide your diriving License clearly showing your face and details',
                  style: TextStyle(color: secondaryColor),
                ),
                title: Text(
                  'Drivers License',
                  style: smallTextBlue,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => License()),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
