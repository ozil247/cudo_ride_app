// import 'dart:async';
// import 'dart:convert';

// import 'package:ars_dialog/ars_dialog.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter_polyline_points/flutter_polyline_points.dart' as poly;
// import 'package:google_maps_webservice/places.dart';
// import 'package:google_api_headers/google_api_headers.dart';
// import 'package:get/get.dart';

// class MapVm extends ChangeNotifier {
//   late Completer<GoogleMapController> fcontroller;
//   final storage = getIt.get<LocalStorageService>();
//   final token = getIt.get<LocalStorageService>().getString("token");
//   poly.PolylinePoints polylinePoints = poly.PolylinePoints();
//   Map<PolylineId, Polyline> polylines = {}; //polylines to show direction
//   final List<Marker> markers = <Marker>[];
//   List places = [];

//   int? _rideId;

//   int? get rideId => _rideId;

//   set rideId(int? rideId) {
//     _rideId = rideId;
//   }

//   bool loading = false;

//   final pickup = TextEditingController();
//   final dropoff = TextEditingController();

//   LatLng? pickupLatlng;
//   LatLng? dropLatlng;
//   double? distance;
//   double price = 100;
//   String amount = "0";
//   dynamic _capacity = 1;

//   dynamic get capacity => _capacity;

//   set capacity(dynamic capacity) {
//     _capacity = capacity;
//     notifyListeners();
//   }

//   final name = TextEditingController();
//   final phone = TextEditingController();
//   final items = TextEditingController();

//   CameraPosition camPosition = const CameraPosition(
//     target: LatLng(0, 0),
//     zoom: 14,
//   );

//   NearbyRideRes? rideStatusRes;

//   RideDetailsRes? rideDetailsRes;

//   Timer? timer;

//   checkStaus() {
//     timer = Timer.periodic(const Duration(seconds: 5), (timer) {
//       getRideDetails();
//     });
//   }

//   getRideDetails() async {
//     final req = await Server().req("/ride-details/$rideId");
//     final Map<String, dynamic> res = json.decode(req.body);
//     rideDetailsRes = RideDetailsRes.fromJson(res);
//     notifyListeners();
//     return rideDetailsRes;
//   }

//   activeRide() async {
//     final req = await Server().req("/active-ride");
//     final Map<String, dynamic> res = json.decode(req.body);
//     if (res['data'] != null) {
//       rideId = res['data'];
//       print(rideId);
//       await Get.offAll(RideDetailsScreen(rideId: res['data']));
//     }
//   }

//   getNearbyRide(rideId) async {
//     loading = true;
//     final req =
//         await Server().req("/nearby-drivers?ride_id=$rideId", type: "post");
//     final Map<String, dynamic> res = json.decode(req.body);
//     rideStatusRes = NearbyRideRes.fromJson(res);
//     loading = false;
//     if (rideStatusRes?.success == false) {
//       errorAlert(res['message']);
//     }
//     notifyListeners();
//     return rideStatusRes;
//   }

//   getUserCurrentLocation() async {
//     await Geolocator.requestPermission()
//         .then((value) {})
//         .onError((error, stackTrace) async {
//       await Geolocator.requestPermission();
//       errorAlert(error.toString());
//     });

//     await Geolocator.getCurrentPosition().then((value) async {
//       if (pickup.text == '') {
//         pickup.text = await getPlaceId(LatLng(value.latitude, value.longitude));
//       }
//       storage.setString("lat", "${value.latitude}");
//       storage.setString("lng", "${value.longitude}");
//       await setCameraPosition(value.latitude, value.longitude);
//       notifyListeners();
//     });
//   }

//   setCameraPosition(lat, lng) async {
//     CameraPosition cameraPosition = CameraPosition(
//       target: LatLng(lat, lng),
//       zoom: 15,
//     );
//     GoogleMapController controller = await fcontroller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
//     return;
//   }

//   getSuggestions(String input) async {
//     String? lat = storage.getString('lat');
//     String? lng = storage.getString('lng');
//     String? latLng = "$lat,$lng";

//     String region = 'ng';
//     String placesApi = Server().kGoogleApiKey;

//     String baseURL =
//         'https://maps.googleapis.com/maps/api/place/autocomplete/json';
//     String request =
//         '$baseURL?input=$input&key=$placesApi&sessiontoken=$token&region=$region&radius=500&location=$latLng';
//     var response = await http.get(Uri.parse(request));
//     if (response.statusCode == 200) {
//       places = json.decode(response.body)['predictions'];
//     } else {
//       errorAlert("Failed to load predictions");
//       throw Exception('Failed to load predictions');
//     }
//     return places;
//   }

//   getPlaceId(LatLng cord) async {
//     String placesApi = Server().kGoogleApiKey;
//     dynamic place;

//     String baseURL = 'https://maps.googleapis.com/maps/api/geocode/json';
//     String request =
//         '$baseURL?latlng=${cord.latitude},${cord.longitude}&key=$placesApi';
//     var response = await http.get(Uri.parse(request));

//     if (response.statusCode == 200) {
//       place = json.decode(response.body);
//       await setMarker(place['results'][0]['place_id'], "Pickup");
//       place = place['results'][0]['formatted_address'];
//     } else {
//       errorAlert("Failed to autoload location");
//     }
//     return place;
//   }

//   setMarker(String placeId, String name) async {
//     String pin = "assets/images/start_pin.png";
//     if (name == 'Dropoff') {
//       pin = "assets/images/end_pin.png";
//     }
//     BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
//       ImageConfiguration(),
//       pin,
//     );

//     GoogleMapsPlaces _places = GoogleMapsPlaces(
//       apiKey: Server().kGoogleApiKey,
//       apiHeaders: await GoogleApiHeaders().getHeaders(),
//     );
//     PlacesDetailsResponse detail = await _places.getDetailsByPlaceId(placeId);
//     double lat = detail.result.geometry!.location.lat;
//     double lng = detail.result.geometry!.location.lng;

//     if (name == "Dropoff") {
//       dropLatlng = LatLng(lat, lng);
//     } else {
//       pickupLatlng = LatLng(lat, lng);
//     }
//     markers.add(Marker(
//       markerId: MarkerId(name),
//       position: LatLng(lat, lng),
//       // icon: markerbitmap,
//       infoWindow: InfoWindow(
//         title: name,
//       ),
//     ));
//     setCameraPosition(lat, lng);
//     notifyListeners();
//     if (pickupLatlng != null && dropLatlng != null) {
//       getDirections();
//     }
//   }

//   removeMarker(String name) async {
//     if (markers.isEmpty) {
//       return;
//     }
//     Marker? marker =
//         markers.firstWhereOrNull((marker) => marker.markerId == MarkerId(name));
//     markers.remove(marker);
//     if (name == "Dropoff") {
//       dropLatlng = null;
//     } else {
//       pickupLatlng = null;
//     }
//     polylines.clear();
//     notifyListeners();
//   }

//   getDirections() async {
//     List<LatLng> polylineCoordinates = [];

//     poly.PolylineResult result =
//         await polylinePoints.getRouteBetweenCoordinates(
//       Server().kGoogleApiKey,
//       poly.PointLatLng(pickupLatlng!.latitude, pickupLatlng!.longitude),
//       poly.PointLatLng(dropLatlng!.latitude, dropLatlng!.longitude),
//       travelMode: poly.TravelMode.driving,
//     );

//     if (result.points.isNotEmpty) {
//       result.points.forEach((poly.PointLatLng point) {
//         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//       });
//     } else {
//       print(result.errorMessage);
//     }
//     addPolyLine(polylineCoordinates);
//     CameraPosition cameraPosition = CameraPosition(
//       target: LatLng(pickupLatlng!.latitude, pickupLatlng!.longitude),
//       zoom: 15,
//     );

//     GoogleMapController controller = await fcontroller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
//     notifyListeners();
//   }

//   addPolyLine(List<LatLng> polylineCoordinates) {
//     PolylineId id = PolylineId("poly");
//     Polyline polyline = Polyline(
//       polylineId: id,
//       color: Colors.deepPurpleAccent,
//       points: polylineCoordinates,
//       width: 5,
//     );
//     polylines[id] = polyline;
//     notifyListeners();
//   }

//   getPrice(LatLng? pickup, LatLng? dropoff, context) async {
//     final loader = CustomProgressDialog(context, blur: 5, dismissable: false);
//     loader.show();
//     final distanceInMeters = Geolocator.distanceBetween(
//       dropoff!.latitude,
//       dropoff.longitude,
//       pickup!.latitude,
//       pickup.longitude,
//     );
//     distance = distanceInMeters / 1000;
//     final response = await Server().req('/get-price/$distance');
//     amount = response.body;
//     print(amount);
//     loader.dismiss();
//     await Get.to(Confirmorder());
//     return distanceInMeters;
//   }

//   Future<void> book(BuildContext context) async {
//     final loader = progressLoader(context);
//     loader.show();

//     final response = await Server().req('/book', type: 'post', data: {
//       'item': items.text,
//       'vehicle_type_id': capacity,
//       'price': amount,
//       'pick_up': pickup.text,
//       'drop_off': dropoff.text,
//       'pickup_latlng': "${pickupLatlng?.latitude},${pickupLatlng?.longitude}",
//       'dropoff_latlng': "${dropLatlng?.latitude},${dropLatlng?.longitude}",
//       'recipient_name': name.text,
//       'recipient_phone': phone.text,
//       "payment_method_id": 2,
//     });

//     final Map<String, dynamic> body = json.decode(response.body);
//     loader.dismiss();

//     if (response.statusCode == 422) {
//       errorAlert(body['errors'].toString(), title: body['message']);
//     }

//     if (body['success'] == true) {
//       rideId = body['data'];
//       Get.to(RideStatus(rideId: body['data']));
//     } else {
//       errorAlert(body['message']);
//     }

//     loader.dismiss();
//   }
// }