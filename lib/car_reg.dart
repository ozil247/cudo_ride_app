// ignore_for_file: prefer_const_constructors

import 'package:cudo_ride_app/dashboard.dart';
import 'package:cudo_ride_app/utilities/colors.dart';
import 'package:cudo_ride_app/utilities/text_style.dart';
import 'package:cudo_ride_app/view_models/vehicle_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarReg extends StatefulWidget {
  const CarReg({super.key});

  @override
  State<CarReg> createState() => _CarRegState();
}

class _CarRegState extends State<CarReg> { 
  @override
  Widget build(BuildContext context) {

    final vm = Provider.of<VehicleVm>(context);

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text(
            'Vehicle Registration',
            style: bigTextYellow,
          ),
          leading: const BackButton(
            color: Color(0xffFF9E00),
          ),
          backgroundColor: primaryColor),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 100),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: vm.manufacturer,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: primaryColor),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'Enter Car Brand',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: vm.model,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: primaryColor),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'Model',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: vm.year,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: primaryColor),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'Year',
                ),
              ),
              
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: vm.plate_number,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: primaryColor),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'Registration Number',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: vm.colour,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: primaryColor),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'Vehicle Colour',
                ),
              ),
              SizedBox(
                height: 30,
              ),
               SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    vm.vehicle_reg(context);
                  },
                  child: Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
