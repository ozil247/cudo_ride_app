// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:cudo_ride_app/utilities/colors.dart';
import 'package:cudo_ride_app/utilities/text_style.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const BackButton(
            color: Color(0xffFF9E00),
          ),
          backgroundColor: primaryColor,
          title: Text(
            'About Us',
            style: bigTextYellow,
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              // ignore: prefer_const_constructors
              SizedBox(
                height: 70,
              ),
              Divider(
                height: 10,
                endIndent: 100,
                indent: 100,
                thickness: 2,
                color: Color(0xffFF9E00),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    'Grow Your Business With Cudo Services',
                    style: bigTextBlue,
                  ),
                ),
              ),

              Divider(
                height: 10,
                endIndent: 100,
                indent: 100,
                thickness: 2,
                color: Color(0xffFF9E00),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                    child: Text(
                  'Getting qualified professionals to do your jobs no longer requires you to break a neck. Cudo service is a work marketplace. We connect people with different skills to clients/employers who is in need of their services.We help employers grow their business by connecting them to best skills and qualified professionals.',
                  style: smallTextBlue,
                )),
              ),

              Divider(
                  height: 10,
                  endIndent: 100,
                  indent: 100,
                  thickness: 2,
                  color: Color(0xffFF9E00)),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child:Text('Our Story', style: bigTextBlue,),
                ),
              ),
              Divider(
                height: 10,
                endIndent: 100,
                indent: 100,
                thickness: 2,
                color: Color(0xffFF9E00),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text('OUR STORY We created CUDO because we believe connecting with nearby service providers should be as easy as putting A PHONE CALL across. The platform helps customers book reliable and quality services - delivered by trained professionals conveniently at home.',style: smallTextBlue,),
                ),
              ),
              Divider(
                  height: 10,
                  endIndent: 100,
                  indent: 100,
                  thickness: 2,
                  color: Color(0xffFF9E00)),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child:Text('How do we achieve this?',style: bigTextBlue,)
                ),
              ),
              Divider(
                height: 10,
                endIndent: 100,
                indent: 100,
                thickness: 2,
                color: Color(0xffFF9E00),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text('Once on our platform, our match-making algorithm identifies professionals who are closest to the users requirements and available at the requested time and date. And once booked, we ensure quality delivery, from the assignment to the job completion.',style: smallTextBlue,)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
