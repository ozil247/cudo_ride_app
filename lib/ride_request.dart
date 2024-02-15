import 'package:cudo_ride_app/utilities/colors.dart';
import 'package:flutter/material.dart';

class RideRequest extends StatefulWidget {

  const RideRequest({ super.key });

  @override
  State<RideRequest> createState() => _RideRequestState();
}

class _RideRequestState extends State<RideRequest> {

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text(''),),
           body: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
              boxShadow: [BoxShadow(
                color: primaryColor,
                blurRadius: 16.0,
                spreadRadius: 0.5,
                offset: Offset(0.7, 0.7)
              )]
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Padding(padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [ 

                    ],
                  ),),
                )
              ],
            ),
           ),
       );
  }
}