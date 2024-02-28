// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables, unused_field, unused_import, non_constant_identifier_names, prefer_final_fields, unused_element, avoid_print, avoid_types_as_parameter_names

import 'dart:async';

import 'package:cudo_ride_app/utilities/colors.dart';
import 'package:cudo_ride_app/utilities/locations_service.dart';
import 'package:cudo_ride_app/utilities/text_style.dart';
import 'package:cudo_ride_app/view_models/map_services.dart';
import 'package:cudo_ride_app/view_models/vehicle_vm.dart';
import 'package:cudo_ride_app/widget/navbar.dart';
import 'package:cudo_ride_app/widget/user_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  TextEditingController _searchController = TextEditingController();

  List<dynamic> _placeList = [];

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<MapServices>(context, listen: false).get_current_location();
    Provider.of<MapServices>(context, listen: false).fcontroller = Completer();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<MapServices>(context);

    return Scaffold(
      drawer: UserNavbar(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: secondaryColor),
        backgroundColor: primaryColor,
        elevation: 0,
        title: Row(
          children: [
            Text(
              'Cudo Ride',
              style: TextStyle(color: secondaryColor),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Add the Google Map here
          SizedBox(
            child: GoogleMap(
              myLocationEnabled: true,
              mapType: MapType.normal,
              mapToolbarEnabled: true,
              markers: Set<Marker>.of(vm.markers),
              polylines: Set<Polyline>.of(vm.polylines.values),
              initialCameraPosition: vm.camPosition,
              onMapCreated: (GoogleMapController controller) {
                vm.fcontroller.complete(controller);
              },
            ),
          ),
          // Add the input field here

          Align(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Column(
                    children: [
                      TypeAheadFormField(
                          textFieldConfiguration: TextFieldConfiguration(
                            controller: vm.searchController,
                            decoration: InputDecoration(
                              labelText: 'Pickup Location',
                              hintStyle: smallTextBlue,
                              suffixIcon: Icon(
                                Icons.location_on_outlined,
                                color: secondaryColor,
                              ),
                            ),
                            onChanged: (value) {},
                          ),
                          onSuggestionSelected: (dynamic suggestion) {
                            vm.setMarker(suggestion['place_id'], "pickup");
                            vm.searchController.text =
                                suggestion['description'];
                            _displayBottomSheet(context);
                          },
                          itemBuilder: (context, dynamic place) {
                            return ListTile(title: Text(place['description']));
                          },
                          suggestionsCallback: (Pattern) async {
                            return await vm.getSuggestions(Pattern);
                          }),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  TypeAheadFormField(
                    hideOnEmpty: false,
                    textFieldConfiguration: TextFieldConfiguration(
                      controller: vm.dropoff,
                      decoration: InputDecoration(
                        labelText: 'Enter drop off location',
                        hintStyle: smallTextBlue,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            vm.dropoff.text = '';
                          },
                          child: Icon(
                            Icons.close,
                            color: secondaryColor,
                          ),
                        ),
                      ),
                    ),
                    suggestionsCallback: (pattern) async {
                      return await vm.getSuggestions(pattern);
                    },
                    itemBuilder: (context, dynamic place) {
                      return ListTile(
                        title: Text(place['description']),
                      );
                    },
                    transitionBuilder: (context, suggestionsBox, controller) {
                      return suggestionsBox;
                    },
                    onSuggestionSelected: (dynamic suggestion) {
                      vm.setMarker(suggestion['place_id'], "dropoff");
                      vm.dropoff.text = suggestion['description'];
                      _displayBottomSheet(context);
                    },
                    loadingBuilder: (context) =>
                        CircularProgressIndicator.adaptive(),
                    hideKeyboardOnDrag: true,
                    hideSuggestionsOnKeyboardHide: false,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _displayBottomSheet(BuildContext context) {
    final vm = Provider.of<MapServices>(context, listen: false);
    if (vm.searchController.text == '' || vm.dropoff.text == '') {
      return;
    }
    return showModalBottomSheet(
        context: context,
        isDismissible: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
        builder: (context) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Card(
                    child: ListTile(
                      selectedTileColor: secondaryColor,
                      leading: Image.asset(
                        'assets/car.png',
                        height: 120,
                        width: 120,
                      ),
                      title: Text(
                        'Cudo Ride',
                        style: smallTextBlue,
                      ),
                      subtitle: Text(
                        'arrives in 10mins',
                      ),
                      trailing: Text(
                        '  N1000',
                        style: smallTextBlue,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        _displayBottomSheet(context);
                      },
                      child: Text('Accept')),
                )
              ],
            ));
  }
}
