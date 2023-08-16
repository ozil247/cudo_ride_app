// ignore_for_file: prefer_const_constructors

import 'package:cudo_ride_app/auth/register.dart';
import 'package:cudo_ride_app/utilities/text_style.dart';
import 'package:cudo_ride_app/view_models/auth_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<AuthVm>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: const BackButton(
          color: Color(0xffFF9E00),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 60),
            width: 250,
            child: Text(
              'Enter The 4 Digit Code Sent To You',
              style: bigTextBlue,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            height: 100,
            child: Form(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 68,
                  width: 150,
                  child: Center(
                    child: TextFormField(
                      controller: vm.otp_code,

                      //onChanged: (value) {
                      // if (value.length == 1) {
                      //    FocusScope.of(context).nextFocus();
                      // }
                      // },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              // ignore: prefer_const_constructors
                              borderSide: BorderSide(
                                // ignore: prefer_const_constructors
                                color: Color(0xff1A214F),
                              ),
                              borderRadius: BorderRadius.circular(7))),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(4),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                ),
              ],
            )),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, left: 10, right: 20),
                  child: SizedBox(
                    width: 90,
                    height: 50,
                    // ignore: sort_child_properties_last
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            //please change Dashboard to Register
                            builder: (context) => OtpPage(),
                          ),
                        );
                      },
                      // ignore: sort_child_properties_last
                      child: Text(
                        'resend',
                        style: smallTextBlue,
                      ),

                      style: ElevatedButton.styleFrom(
                        //change background color of button
                        // onPrimary: Colors.yellow, //change text color of button
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 10, right: 20),
                  child: SizedBox(
                    width: 100,
                    height: 50,
                    // ignore: sort_child_properties_last
                    child: ElevatedButton(
                      onPressed: () { vm.otpVerify(context);},
                      // ignore: sort_child_properties_last
                      child: Text(
                        'Next',
                        style: smallTextBlue,
                      ),

                      style: ElevatedButton.styleFrom(
                        //change background color of button
                        // onPrimary: Colors.yellow, //change text color of button
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
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
