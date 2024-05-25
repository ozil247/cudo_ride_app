// ignore_for_file: prefer_const_constructors, unused_import, unused_field

import 'dart:io';

import 'package:cudo_ride_app/auth/otp_page.dart';
import 'package:cudo_ride_app/driver/dashboard.dart';
import 'package:cudo_ride_app/utilities/colors.dart';
import 'package:cudo_ride_app/utilities/helpers.dart';
import 'package:cudo_ride_app/utilities/text_style.dart';
import 'package:cudo_ride_app/view_models/driver/vehicle_vm.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VehicleDetailsUpload extends StatefulWidget {
  const VehicleDetailsUpload({super.key});

  @override
  State<VehicleDetailsUpload> createState() => _VehicleDetailsUploadState();
}

class _VehicleDetailsUploadState extends State<VehicleDetailsUpload> {
  FilePickerResult? result;
  String? _fileName;
  PlatformFile? pickedfile;
  bool isLoading = false;
  File? fileToDisplay;

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<VehicleVm>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Vehicles Details', style: bigTextYellow),
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
              const SizedBox(height: 50),
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
                                  vm.license = await pickFile();
                                  setState(() {});
                                },
                                child: Text(
                                  'Vehicle License',
                                  style: smallTextBlue,
                                ),
                              ),
                        if (vm.license != null)
                          Text("${vm.license?.name}"),
                        const SizedBox(height: 15),
                      ],
                    ),
                  )),
                  SizedBox(height: 30,),
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
                                  vm.insurance = await pickFile();
                                  setState(() {});
                                },
                                child: Text(
                                  'Insurance Certificate',
                                  style: smallTextBlue,
                                ),
                              ),
                        if (vm.insurance != null)
                          Text("${vm.insurance?.name}"),
                        const SizedBox(height: 15),
                      ],
                    ),
                  )),
                  SizedBox(height: 30,),
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
                                  vm.road = await pickFile();
                                  setState(() {});
                                },
                                child: Text(
                                  'Certificate of road-worthiness',
                                  style: smallTextBlue,
                                ),
                              ),
                        if (vm.road != null)
                          Text("${vm.road?.name}"),
                        const SizedBox(height: 15),
                      ],
                    ),
                  )),
                  SizedBox(height: 30,),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: Container(
                  child: ElevatedButton(
                   onPressed: () {
                    (context);
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
