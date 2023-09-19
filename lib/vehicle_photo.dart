// ignore_for_file: unused_field, prefer_const_constructors

import 'dart:io';

import 'package:cudo_ride_app/dashboard.dart';
import 'package:cudo_ride_app/utilities/colors.dart';
import 'package:cudo_ride_app/utilities/helpers.dart';
import 'package:cudo_ride_app/utilities/text_style.dart';
import 'package:cudo_ride_app/view_models/vehicle_vm.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VehiclePhoto extends StatefulWidget {

  const VehiclePhoto({ super.key });

  @override
  State<VehiclePhoto> createState() => _VehiclePhotoState();
}

class _VehiclePhotoState extends State<VehiclePhoto> {
  FilePickerResult? result;
  String? _fileName;
  PlatformFile? pickedfile;
  bool isLoading = false;
  File? fileToDisplay;

   @override
   Widget build(BuildContext context) {
      final vm = Provider.of<VehicleVm>(context);
       return Scaffold(appBar: AppBar(
        elevation: 0,
        title: Text(' Vehicle Verification', style: bigTextYellow),
        leading: const BackButton(
          color: Color(0xffFF9E00),
        ),
        backgroundColor: primaryColor,
      ),
           body: SingleChildScrollView(
        child: Form(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
               DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(10),
                  dashPattern: const [10, 4],
                  strokeCap: StrokeCap.round,
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        isLoading
                            ? CircularProgressIndicator()
                            : TextButton(
                                onPressed: () async {
                                  vm.ownership = await pickFile();
                                  setState(() {});
                                },
                                child: Text(
                                  'Proof Of Ownership',
                                  style: smallTextBlue,
                                ),
                              ),
                        if (vm.ownership != null)
                          Text("${vm.ownership?.name}"),
                        const SizedBox(height: 15),
                      ],
                    ),
                  )),
                  SizedBox(height: 30,),
              DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(10),
                  dashPattern: [10, 4],
                  strokeCap: StrokeCap.round,
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        isLoading
                            ? CircularProgressIndicator()
                            : TextButton(
                                onPressed: () async {
                                  vm.exterior = await pickFile();
                                  setState(() {});
                                },
                                child: Text(
                                  'Exterior View',
                                  style: smallTextBlue,
                                ),
                              ),
                        if (vm.exterior != null) Text("${vm.exterior?.name}"),
                        const SizedBox(height: 15),
                      ],
                    ),
                  )),
              SizedBox(
                height: 30,
              ),
              DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(10),
                  dashPattern: [10, 4],
                  strokeCap: StrokeCap.round,
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        isLoading
                            ? CircularProgressIndicator()
                            : TextButton(
                                onPressed: () async {
                                  vm.interior = await pickFile();
                                  setState(() {});
                                },
                                child: Text(
                                  'Interior View',
                                  style: smallTextBlue,
                                ),
                              ),
                        if (vm.interior != null) Text("${vm.interior?.name}"),
                        const SizedBox(height: 15),
                      ],
                    ),
                  )),
              SizedBox(height: 30),
               
              DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(10),
                  dashPattern: [10, 4],
                  strokeCap: StrokeCap.round,
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        isLoading
                            ? CircularProgressIndicator()
                            : TextButton(
                                onPressed: () async {
                                  vm.video = await pickFile();
                                  setState(() {});
                                },
                                child: Text(
                                  'Video Of The Entire Vehicle',
                                  style: smallTextBlue,
                                ),
                              ),
                        if (vm.video != null) Text("${vm.video?.name}"),
                        const SizedBox(height: 15),
                      ],
                    ),
                  )),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: Container(
                  child: ElevatedButton(
                     onPressed: () {
                    vm.completeProfile(context);
                  },
                    child: Text(
                      "Submit",
                      style: smallTextBlue,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}