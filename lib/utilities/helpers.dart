// ignore_for_file: unused_import

import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';

pickFile() async {
  FilePickerResult? result;
  // String? _fileName;
  // PlatformFile? pickedfile;
  // bool isLoading = false;
  // File? fileToDisplay;

  result = await FilePicker.platform.pickFiles(
    type: FileType.any,
    allowMultiple: false,
  );

  if (result != null) {
    // _fileName = result.files.first.name;
    // pickedfile = result.files.first;
    // fileToDisplay = File(pickedfile.path.toString());
    final file = result.files.first;
    return file;
  }
}

String convertBase64(file) {
  var bytes = File(file!.path).readAsBytesSync();
  String base64 = base64Encode(bytes);
  return base64;
}


checkNull(v) {
  if (v == null) {
    return true;
  }
  return false;
}