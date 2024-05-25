// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:convert';

import 'package:cudo_ride_app/user_dashboard.dart';
import 'package:cudo_ride_app/utilities/alert.dart';
import 'package:cudo_ride_app/utilities/getit.dart';
import 'package:cudo_ride_app/utilities/server.dart';
import 'package:cudo_ride_app/utilities/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:http/http.dart' as http;
import 'package:google_api_headers/google_api_headers.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart' as poly;

class MapServices extends ChangeNotifier {
  final status = TextEditingController();
  dynamic amount = 0;
  double distance = 0;
  bool loading = false;

  late Completer<GoogleMapController> fcontroller;
  TextEditingController searchController = TextEditingController();
  TextEditingController dropoff = TextEditingController();

  poly.PolylinePoints polylinePoints = poly.PolylinePoints();
  Map<PolylineId, Polyline> polylines = {}; //polylines to show direction
  final List<Marker> markers = <Marker>[];
  List places = [];

  LatLng? pickupLatlng;
  LatLng? dropLatlng;

  final token = getIt.get<LocalStorageService>().getString("token");
  final storage = getIt.get<LocalStorageService>();

  CameraPosition camPosition = const CameraPosition(
    target: LatLng(0, 0),
    zoom: 14,
  );

  setCameraPosition(lat, lng) async {
    CameraPosition cameraPosition = CameraPosition(
      target: LatLng(lat, lng),
      zoom: 15,
    );
    GoogleMapController controller = await fcontroller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    return;
  }

  getSuggestions(String input) async {
    String? lat = storage.getString('lat');
    String? lng = storage.getString('lng');
    String? latLng = "$lat,$lng";
    String region = 'ng';
    String placesApi = Server().kGoogleApiKey;

    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request =
        '$baseURL?input=$input&key=$placesApi&sessiontoken=$token&region=$region&radius=500&location=$latLng';
    var response = await http.get(Uri.parse(request));
    // print(response.body);
    if (response.statusCode == 200) {
      places = json.decode(response.body)['predictions'];
    } else {
      print("error");
      // errorAlert(context, "Failed to load predictions");
      throw Exception('Failed to load predictions');
    }
    return places;
  }

  getCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      // errorAlert(error.toString());
    });

    await Geolocator.getCurrentPosition().then((value) async {
      if (searchController.text == '') {
        // await getAddressFromLatLng(value);
        //  searchController.text =  await getPlaceId(value.latitude, value.longitude);
      }
      storage.setString("lat", "${value.latitude}");
      storage.setString("lng", "${value.longitude}");
      // pickupLatlng.latitude = value.latitude;
      await setCameraPosition(value.latitude, value.longitude);
      notifyListeners();
    });
  }

  getPlaceId(latitude, longitude) async {
    String placesApi = Server().kGoogleApiKey;
    dynamic place;

    String baseURL = 'https://maps.googleapis.com/maps/api/geocode/json';
    String request = '$baseURL?latlng=$latitude,$longitude&key=$placesApi';
    var response = await http.get(Uri.parse(request));

    if (response.statusCode == 200) {
      place = json.decode(response.body);
      await setMarker(place['results'][0]['place_id'], "Pickup");
      place = place['results'][0]['formatted_address'];
    } else {
      print("Failed to autoload location");
    }
    return place;
  }

  setMarker(String placeId, String name) async {
    String pin = "assets/images/start_pin.png";

    BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      pin,
    );

    GoogleMapsPlaces _places = GoogleMapsPlaces(
      apiKey: Server().kGoogleApiKey,
      apiHeaders: await GoogleApiHeaders().getHeaders(),
    );
    PlacesDetailsResponse detail = await _places.getDetailsByPlaceId(placeId);
    double lat = detail.result.geometry!.location.lat;
    double lng = detail.result.geometry!.location.lng;

    if (name == "dropoff") {
      dropLatlng = LatLng(lat, lng);
    } else {
      pickupLatlng = LatLng(lat, lng);
    }
    markers.add(Marker(
      markerId: MarkerId(name),
      position: LatLng(lat, lng),
      // icon: markerbitmap,
      infoWindow: InfoWindow(
        title: name,
      ),
    ));
    setCameraPosition(lat, lng);
    notifyListeners();
    if (pickupLatlng != null && dropLatlng != null) {
      getDirections();
    }
  }

  getDirections() async {
    List<LatLng> polylineCoordinates = [];

    poly.PolylineResult result =
        await polylinePoints.getRouteBetweenCoordinates(
      Server().kGoogleApiKey,
      poly.PointLatLng(pickupLatlng!.latitude, pickupLatlng!.longitude),
      poly.PointLatLng(dropLatlng!.latitude, dropLatlng!.longitude),
      travelMode: poly.TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((poly.PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    addPolyLine(polylineCoordinates);
    CameraPosition cameraPosition = CameraPosition(
      target: LatLng(pickupLatlng!.latitude, pickupLatlng!.longitude),
      zoom: 15,
    );

    GoogleMapController controller = await fcontroller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    notifyListeners();
  }

  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.deepPurpleAccent,
      points: polylineCoordinates,
      width: 5,
    );
    polylines[id] = polyline;
    notifyListeners();
  }

  bookings(context) async {
    final loader = progressLoader(context);
    loader.show();
    final req = await Server().req(context, "/bookings", type: 'post', data: {
      'pick_up_lat': pickupLatlng?.latitude,
      'pick_up_lng': pickupLatlng?.longitude,
      'drop_off_lat': dropLatlng?.latitude,
      'drop_off_lng': dropLatlng?.longitude,
      "drop_off": dropoff.text,
      "pick_up": searchController.text,
      "status": "pending",
      "amount": amount,
    });

    final res = json.decode(req.body);
    print(res);
    loader.dismiss();

    if (res['success'] == true) {
      successAlert(context, 'Your driver is on the way');
      Get.to(UserDashboard());
    } else {
      errorAlert(context, res['message']);
    }
    return;
  }

  getPrice(context) async {
    loading = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 3));
    final distanceInMeters = Geolocator.distanceBetween(
      dropLatlng!.latitude,
      dropLatlng!.longitude,
      pickupLatlng!.latitude,
      pickupLatlng!.longitude,
    );
    /*  distance = distanceInMeters / 1000;
    amount = distance * 1000; */
    final response = await Server().req(context, '/get-price/$distance');
    amount = response.body;
    print(response.body);
    loading = false;
    notifyListeners();
    print(distance);
    // await Get.to(Confirmorder());
    return distanceInMeters;
  }
}
