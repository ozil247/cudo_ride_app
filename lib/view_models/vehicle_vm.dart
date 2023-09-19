// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:cudo_ride_app/utilities/alert.dart';
import 'package:cudo_ride_app/utilities/helpers.dart';
import 'package:cudo_ride_app/utilities/server.dart';
import 'package:cudo_ride_app/utilities/storage_service.dart';
import 'package:cudo_ride_app/vehicle_doc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VehicleVm extends ChangeNotifier {
  final manufacturer = TextEditingController();
  final model = TextEditingController();
  final year = TextEditingController();
  final plate_number = TextEditingController();
  final colour = TextEditingController();
  PlatformFile? photo;
  PlatformFile? license;
  PlatformFile? insurance;
  PlatformFile? ownership;
  PlatformFile? road;
  PlatformFile? exterior;
  PlatformFile? interior;
  PlatformFile? video;

  vehicle_reg(context) async{
    final loader = progressLoader(context);
    loader.show();
    final req = await Server().req(context,'/vehicle-reg', type: 'post', data: {
      'manufacturer':manufacturer.text,
      'model':model.text,
      'year':year.text,
      'plate_number':plate_number.text,
      'colour':colour.text,
    });
    loader.dismiss();
    final res = json.decode(req.body);
    if ( res ['success'] == true) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      LocalStorageService(prefs).setString('token', res['token']);

      successAlert(context, 'Your Vehicle Details Have Been Submitted');
      Get.to(VehicleDoc());
    } else{
      errorAlert(context, res['message']);
    }

    return;

  }

  Future<void> completeProfile(BuildContext context) async {
    final loader = progressLoader(context);
    loader.show();

    if (checkNull(ownership) || checkNull(interior) || checkNull(exterior)) {
      errorAlert(context, "Please upload all required images");
      return;
    }

    String ownership64 = convertBase64(ownership);
    String interior64 = convertBase64(interior);
    String ext64 = convertBase64(exterior);

    final response = await Server()
        .req(context, '/driver/complete-details', type: 'post', data: {
      'ownership': ownership64,
      'interior': interior64,
      'exterior': ext64,
    });

    loader.dismiss();
    final Map<String, dynamic> body = json.decode(response.body);
    if (response.statusCode == 422) {
      errorAlert(context, body['errors'].toString());
    }

    if (body['success'] == true) {
      successAlert(context, "Upload successful");
    } else {
      errorAlert(context, body['message']);
    }
  }
}
