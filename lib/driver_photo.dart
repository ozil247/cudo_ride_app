// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:cudo_ride_app/dashboard.dart';
import 'package:cudo_ride_app/utilities/colors.dart';
import 'package:cudo_ride_app/utilities/text_style.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class DriverPhoto extends StatefulWidget {
  const DriverPhoto({super.key});

  @override
  State<DriverPhoto> createState() => _DriverPhotoState();
}

class _DriverPhotoState extends State<DriverPhoto> {
  FilePickerResult? result;
  String? _fileName;
  PlatformFile? pickedfile;
  bool isLoading = false;
  File? fileToDisplay;

  void pickFile() async {
    try {
      setState(() {
        isLoading = true;
      });

      result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: true,
      );

      if (result != null) {
        _fileName = result!.files.first.name;
        pickedfile = result!.files.first;
        fileToDisplay = File(pickedfile!.path.toString());

        print('File name $_fileName');
      }

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Driver Photo',
          style: bigTextYellow,
        ),
        leading: const BackButton(
          color: Color(0xffFF9E00),
        ),
        backgroundColor: primaryColor,
      ),
      body: Container(
        child: Form(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(10),
                dashPattern: [10, 4],
                strokeCap: StrokeCap.round,
                child: Container(
                  width: double.infinity,
                  height: 280,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      isLoading
                          ? CircularProgressIndicator()
                          : TextButton(
                              onPressed: () {
                                pickFile();
                              },
                              child: Text(
                                'Click To Upload',
                                style: smallTextBlue,
                              )),
                      if (pickedfile != null)
                        SizedBox(
                          height: 210,
                          width: double.infinity,
                          child: Image.file(fileToDisplay!),
                        ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
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
