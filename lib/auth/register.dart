// ignore_for_file: prefer_const_constructors, unused_import

import 'package:cudo_ride_app/auth/otp_page.dart';
import 'package:cudo_ride_app/driver/driver_details_upload.dart';
import 'package:cudo_ride_app/home.dart';
import 'package:cudo_ride_app/utilities/colors.dart';
import 'package:cudo_ride_app/utilities/text_style.dart';
import 'package:cudo_ride_app/view_models/auth_vm.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

class Update extends StatefulWidget {
  const Update({super.key});

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  final items = ["User", "Driver"];

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<AuthVm>(context);
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            title: Text(
              'Profile Update',
              style: smallTextBlue,
            ),
            leading: const BackButton(
              color: Color(0xffFF9E00),
            ),
            backgroundColor: primaryColor),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            child: Column(
              children: [
                SizedBox(height: 50),
                SizedBox(height: 15),
                Container(
                  width: 450,
                  height: 50,
                  margin: EdgeInsets.all(2),
                  padding:
                      EdgeInsets.only(bottom: 10, top: 10, left: 10, right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                    hint: Text('Type'),
                    iconSize: 16,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      size: 30,
                      color: Colors.grey,
                    ),
                    value: vm.type,
                    isExpanded: true,
                    items: items.map(buildMenuItem).toList(),
                    onChanged: (value) => setState(() => (
                      vm.type = "$value"
                    )),
                  )),
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: vm.name,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      labelText: 'Enter Your Name'),
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: vm.email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    labelText: 'Enter Your Email',
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: vm.address,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      labelText: 'Address'),
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: vm.state,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      labelText: 'State'),
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: vm.gender,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      labelText: 'Gender'),
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: vm.age,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      labelText: 'Age'),
                ),
                SizedBox(height: 10),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  //ignore: avoid_unnecessary_containers
                  child: Container(
                    // ignore: sort_child_properties_last
                    child: ElevatedButton(
                      onPressed: () => {vm.update(context)},
                      // ignore: sort_child_properties_last
                      child: Text(
                        "Register",
                        style: smallTextBlue,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontSize: 16),
        ),
      );
}
