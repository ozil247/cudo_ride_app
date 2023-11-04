// ignore_for_file: prefer_const_constructors, unused_field

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

class DriverDetailsUpload extends StatefulWidget {
  const DriverDetailsUpload({super.key});

  @override
  State<DriverDetailsUpload> createState() => _DriverDetailsUploadState();
}

class _DriverDetailsUploadState extends State<DriverDetailsUpload> {
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
        title: Text('Drivers Details', style: bigTextYellow),
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
                                  vm.photo = await pickFile();
                                  setState(() {});
                                },
                                child: Text(
                                  'Drivers Photo',
                                  style: smallTextBlue,
                                ),
                              ),
                        if (vm.photo != null) Text("${vm.photo?.name}"),
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
                                  vm.license = await pickFile();
                                  setState(() {});
                                },
                                child: Text(
                                  'Drivers License',
                                  style: smallTextBlue,
                                ),
                              ),
                        if (vm.license != null) Text("${vm.license?.name}"),
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
