// ignore_for_file: prefer_const_constructors, unused_import, unused_local_variable

import 'package:ars_dialog/ars_dialog.dart';
import 'package:cudo_ride_app/utilities/alert.dart';
import 'package:cudo_ride_app/utilities/colors.dart';
import 'package:cudo_ride_app/utilities/text_style.dart';
import 'package:cudo_ride_app/view_models/auth_vm.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';


class Load extends StatefulWidget {
  const Load({super.key});

  @override
  State<Load> createState() => _LoadState();
}

class _LoadState extends State<Load> {
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<AuthVm>(context);

    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              SizedBox(height: 300),
              Text("Enter Your Number", style: bigTextYellow),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text("Register"),
                  onPressed: ()  {

                    // ProgressDialog load = loader(context);
                    // load.show();
                   
                    // errorAlert(context, "We are good to go");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
