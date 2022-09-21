import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jexpoints/app/shared/values/enviroments.dart';
import 'package:location/location.dart' as location;

class DetailDeliveryController extends GetxController {
  CameraPosition initialPosition =
      const CameraPosition(target: LatLng(19.4279804, -99.1610907), zoom: 16);

  LatLng? addressLatLng;
  var addressName = ''.obs;

  Completer<GoogleMapController> mapController = Completer();
  Position? position;

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{}.obs;
  BitmapDescriptor? deliveryIcon;
  BitmapDescriptor? homeIcon;

  Set<Polyline> polylines = <Polyline>{}.obs;
  List<LatLng> points = [];

  DetailDeliveryController() {
    checkGPS();
  }

  // ClientAddressMapController() {
  //   checkGPS(); // VERIFICAR SI EL GPS ESTA ACTIVO
  // }

  Future setLocationDraggableInfo() async {
    double lat = initialPosition.target.latitude;
    double lng = initialPosition.target.longitude;

    List<Placemark> address = await placemarkFromCoordinates(lat, lng);

    if (address.isNotEmpty) {
      String direction = address[0].thoroughfare ?? '';
      String street = address[0].subThoroughfare ?? '';
      String city = address[0].locality ?? '';
      String department = address[0].administrativeArea ?? '';
      String country = address[0].country ?? '';
      addressName.value = '$direction #$street, $city, $department';
      addressLatLng = LatLng(lat, lng);
      print(
          'LAT Y LNG: ${addressLatLng?.latitude ?? 0} ${addressLatLng?.longitude ?? 0}');
    }
  }

  void selectRefPoint(BuildContext context) {
    if (addressLatLng != null) {
      Map<String, dynamic> data = {
        'address': addressName.value,
        'lat': addressLatLng!.latitude,
        'lng': addressLatLng!.longitude,
      };
      // Navigator.pop(context, data);
      Navigator.pushNamed(context, '/confirm-compra');
    }
  }

  Future<BitmapDescriptor> createMarkerFromAsset(String path) async {
    ImageConfiguration configuration = const ImageConfiguration();

    BitmapDescriptor descriptor =
        await BitmapDescriptor.fromAssetImage(configuration, path);

    return descriptor;
  }

  void addMarker(String markerId, double lat, double lng, String title,
      String content, BitmapDescriptor icon) {
    MarkerId id = MarkerId(markerId);
    Marker marker = Marker(
      markerId: id,
      icon: icon,
      position: LatLng(lat, lng),
      infoWindow: InfoWindow(
        title: title,
        snippet: content,
      ),
    );

    markers[id] = marker;

    update();
  }

  void checkGPS() async {
    deliveryIcon = await createMarkerFromAsset('assets/images/moto1.png');
    homeIcon = await createMarkerFromAsset('assets/images/home.png');

    bool isLocationEnabled = await Geolocator.isLocationServiceEnabled();

    if (isLocationEnabled == true) {
      updateLocation();
    } else {
      bool locationGPS = await location.Location().requestService();
      if (locationGPS == true) {
        updateLocation();
      }
    }
  }

  void updateLocation() async {
    try {
      await _determinePosition();
      position = await Geolocator.getLastKnownPosition(); // LAT Y LNG (ACTUAL)
      animateCameraPosition(
          position?.latitude ?? 19.4279804, position?.longitude ?? -99.1610907);
      addMarker(
        'repartidor',
        position?.latitude ?? 19.2992995,
        position?.longitude ?? -99.1137442,
        'Repartidor',
        '',
        deliveryIcon!,
      );
      addMarker(
          'home', 19.3452273, -99.1971445, 'Lugar de Entrega', '', homeIcon!);

      LatLng from = LatLng(
          position?.latitude ?? 19.4279804, position?.longitude ?? -99.1610907);
      LatLng to = LatLng(19.3452273, -99.1971445);

      setPolylines(from, to);
    } catch (e) {
      print('Error: ${e}');
    }
  }

  Future<void> setPolylines(LatLng from, LatLng to) async {
    PointLatLng origin = PointLatLng(from.latitude, from.longitude);
    PointLatLng destination = PointLatLng(to.latitude, to.longitude);
    PolylineResult result = await PolylinePoints().getRouteBetweenCoordinates(
        Enviroments.GOOGLE_API_KEY, origin, destination);

    for (PointLatLng point in result.points) {
      points.add(LatLng(point.latitude, point.longitude));
    }

    Polyline polyline = Polyline(
      polylineId: PolylineId('poly'),
      points: points,
      color: Colors.black,
      width: 3,
    );

    polylines.add(polyline);
    update();
  }

  Future animateCameraPosition(double lat, double lng) async {
    GoogleMapController controller = await mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 16, bearing: 0)));
  }

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

  void onMapCreate(GoogleMapController controller) {
    try {
      controller.setMapStyle('''[
  {
    "featureType": "administrative.land_parcel",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "administrative.neighborhood",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi.business",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  }
]''');
      mapController.complete(controller);
    } catch (e) {
      print('Error: ${e}');
    }
  }
}
