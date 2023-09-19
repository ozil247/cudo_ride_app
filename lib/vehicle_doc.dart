// ignore_for_file: prefer_const_constructors

import 'package:cudo_ride_app/car_reg.dart';
import 'package:cudo_ride_app/dashboard.dart';
import 'package:cudo_ride_app/driver_details_upload.dart';
import 'package:cudo_ride_app/utilities/colors.dart';
import 'package:cudo_ride_app/utilities/text_style.dart';
import 'package:cudo_ride_app/vehicle_details_upload.dart';
import 'package:cudo_ride_app/vehicle_photo.dart';
import 'package:flutter/material.dart';

class VehicleDoc extends StatefulWidget {
  const VehicleDoc({super.key});

  @override
  State<VehicleDoc> createState() => _VehicleDocState();
}

class _VehicleDocState extends State<VehicleDoc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: const BackButton(
            color: Color(0xffFF9E00),
          )),
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
                  'Vehicle Details',
                  style: smallTextBlue,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => CarReg()),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 15,
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
                  'Drivers Details',
                  style: smallTextBlue,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => DriverDetailsUpload()),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 15,
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
                  'Vehicle Photo Verification',
                  style: smallTextBlue,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => VehiclePhoto()),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: Container(
                  child: ElevatedButton(
                    onPressed: () => {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Dashboard()))
                    },
                    child: Text(
                      "Done",
                      style: smallTextBlue,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
