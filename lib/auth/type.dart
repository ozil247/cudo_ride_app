// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:cudo_ride_app/auth/otp_page.dart';
import 'package:cudo_ride_app/driver/dashboard.dart';
import 'package:cudo_ride_app/utilities/colors.dart';
import 'package:cudo_ride_app/utilities/text_style.dart';
import 'package:cudo_ride_app/view_models/auth_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Type extends StatefulWidget {
  const Type({super.key});

  @override
  State<Type> createState() => _TypeState();
}

class _TypeState extends State<Type> {
  final items = ["User", "Driver"];
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<AuthVm>(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(100),
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                  ),
                  Text(
                    'Continue As',
                    style: bigTextBlue,
                  ),
                  Form(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 450,
                        height: 50,
                        margin: EdgeInsets.all(2),
                        padding: EdgeInsets.only(
                            bottom: 10, top: 10, left: 10, right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: primaryColor, width: 1),
                        ),
                        child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                          hint: Text('Type'),
                          iconSize: 16,
                          icon: Icon(
                            Icons.arrow_drop_down,
                            size: 30,
                            color: primaryColor,
                          ),
                          value: vm.type,
                          isExpanded: true,
                          items: items.map(buildMenuItem).toList(),
                          onChanged: (value) =>
                              setState(() => (vm.type = "$value")),
                        )),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        //ignore: avoid_unnecessary_containers
                        child: Container(
                          child: ElevatedButton(
                            onPressed: () => {vm.userType(context)},
                            child: Text(
                              "Contine As",
                              style: smallTextBlue,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: smallTextBlue,
        ),
      );
}
