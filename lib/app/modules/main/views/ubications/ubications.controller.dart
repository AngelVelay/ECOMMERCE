import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:jexpoints/app/modules/main/views/ubications/utills/map_style.dart';

class UbicationsController extends ChangeNotifier {
  Set<Marker> allMarkers = {};

  String imgurl = "";

  int contador = 0;

  List<dynamic> responseJsonUbications = [];

  Future<void> onMapCreated(GoogleMapController controller) async {
    controller.setMapStyle(styleMap);
    await fetchPost();
  }

  final initialCameraPosition = const CameraPosition(
    target: LatLng(19.371114, -99.165478),
    zoom: 12,
  );

  Future<void> fetchPost() async {
    final response = await http.get(
      Uri.parse(
          'https://mocki.io/v1/bb31251b-5077-498d-9c0f-51d4d88c2498'),
    );

    responseJsonUbications = json.decode(response.body);

    responseJsonUbications.forEach((element) async {
      imgurl = "http://201.151.139.54/FileManagerDoctos/jexbit/" +
          element['GeoIcon'];

      Uint8List bytes =
          (await NetworkAssetBundle(Uri.parse(imgurl)).load(imgurl))
              .buffer
              .asUint8List();

      allMarkers.add(Marker(
        markerId: MarkerId(contador.toString()),
        position: LatLng(element['latitude'],
           element['longitude']),
        icon: BitmapDescriptor.fromBytes(bytes),
        infoWindow: InfoWindow(
          title: element['name'],
          snippet: element['description'],
        ),
      ));
      contador++;
      notifyListeners();
    });
  }
}
