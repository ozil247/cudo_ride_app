// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:cudo_ride_app/auth/otp_page.dart';
import 'package:cudo_ride_app/dashboard.dart';
import 'package:cudo_ride_app/utilities/colors.dart';
import 'package:cudo_ride_app/utilities/text_style.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

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


  
void pickFile() async {
  try{
    setState(() {
      isLoading=true ;
    });

    result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: true,
    );

    if (result!=null){
      _fileName = result!.files.first.name;
      pickedfile = result!.files.first;
      fileToDisplay = File(pickedfile!.path.toString()); 


      print('File name $_fileName');
    }




    setState(() {
      isLoading = false;
    });
  } 
  catch(e){
    print(e);
  }

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Vehicles Details',
          style: bigTextYellow,
        ),
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
                height: 50,
              ),
              DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(10),
                  dashPattern: const [10, 4],
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
                            : TextButton(onPressed: () {
                                  pickFile();
                                }, child:  Text(
                          'Vehicle License',
                          style: smallTextBlue,
                        )),
                        if (pickedfile != null)
                          SizedBox(
                            height: 200,
                            width: double.infinity,
                            child: Image.file(fileToDisplay!),
                          ),
                        const SizedBox(
                          height: 15,
                        ),
                       
                      ],
                    ),
                  )),
              SizedBox(
                height: 30,
              ),
              DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(10),
                  dashPattern: const [10, 4],
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
                            : TextButton(onPressed: () {
                                  pickFile();
                                }, child:  Text(
                          'Insurance Certificate',
                          style: smallTextBlue,
                        )),
                        if (pickedfile != null)
                          SizedBox(
                            height: 200,
                            width: double.infinity,
                            child: Image.file(fileToDisplay!),
                          ),
                        const SizedBox(
                          height: 15,
                        ),
                       
                      ],
                    ),
                  )),
              SizedBox(
                height: 30,
              ),

             DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(10),
                  dashPattern: const [10, 4],
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
                            : TextButton(onPressed: () {
                                  pickFile();
                                }, child:  Text(
                          'Proof Of Ownership',
                          style: smallTextBlue,
                        )),
                        if (pickedfile != null)
                          SizedBox(
                            height: 200,
                            width: double.infinity,
                            child: Image.file(fileToDisplay!),
                          ),
                        const SizedBox(
                          height: 15,
                        ),
                       
                      ],
                    ),
                  )),
              SizedBox(
                height: 30,
              ),

              DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(10),
                  dashPattern: const [10, 4],
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
                            : TextButton(onPressed: () {
                                  pickFile();
                                }, child:  Text(
                          'Certificate Of Road Worthiness',
                          style: smallTextBlue,
                        )),
                        if (pickedfile != null)
                          SizedBox(
                            height: 200,
                            width: double.infinity,
                            child: Image.file(fileToDisplay!),
                          ),
                        const SizedBox(
                          height: 15,
                        ),
                       
                      ],
                    ),
                  )),
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
                      "Register",
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
