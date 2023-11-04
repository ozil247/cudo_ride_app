// ignore_for_file: prefer_const_constructors, unused_import, sort_child_properties_last
import 'package:cudo_ride_app/auth/otp_page.dart';
import 'package:cudo_ride_app/dashboard.dart';
import 'package:cudo_ride_app/utilities/colors.dart';
import 'package:cudo_ride_app/utilities/text_style.dart';
import 'package:cudo_ride_app/view_models/auth_vm.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<AuthVm>(context);

    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  SizedBox(height: 300),
                  Text("Enter Your Number", style: bigTextYellow),
                  SizedBox(height: 10),
                  IntlPhoneField(
                    controller: vm.phone,
                    initialCountryCode: "NG",
                    onCountryChanged: (value) => print(value.code),
                  ),
                 
                ],
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                     vm.login(context);
                    },
                    child: Text(
                      '          Login        ',
                      
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 50),
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      vm.register(context);
                    },
                    child: Text("     Register       "),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
