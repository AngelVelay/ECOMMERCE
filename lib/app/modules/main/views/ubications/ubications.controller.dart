import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:jexpoints/app/modules/main/views/ubications/utills/map_style.dart';
import 'package:jexpoints/app/modules/main/views/ubications/utills/map_utils.dart';

class UbicationsController extends GetxController {
  var ubications = [];
  Set<Marker> allMarkers = <Marker>{}.obs;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{}.obs;
  String imgurl = "";
  int contador = 0;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPost();
  }

  Future<void> onMapCreated(GoogleMapController controller) async {
    controller.setMapStyle(styleMap);
  }

  final initialCameraPosition = const CameraPosition(
    target: LatLng(19.371114, -99.165478),
    zoom: 12,
  );

  Future<void> fetchPost() async {
    final response = await http.get(
      Uri.parse(
          'http://dev.jexbit.mx/JexcoreService/api/OrganizationsApplicationsKeys/db755596-ed44-417b-9a5a-8512964932a8/branches'),
    );

    ubications = json.decode(response.body);

    ubications.forEach((element) async {
      imgurl = "http://201.151.139.54/FileManagerDoctos/jexbit/" +
          element['geoIcon'];

      Uint8List bytes =
          (await NetworkAssetBundle(Uri.parse(imgurl)).load(imgurl))
              .buffer
              .asUint8List();

      allMarkers.add(Marker(
        markerId: MarkerId(contador.toString()),
        position: LatLng(double.parse(element['latitude']),
            double.parse(element['longitude'])),
        icon: BitmapDescriptor.fromBytes(bytes),
        infoWindow: InfoWindow(
          title: element['name'],
          snippet: element['description'],
          onTap: () async {
            MapUtils.openMap(double.parse(element['latitude']),
                double.parse(element['longitude']));
          },
        ),
      ));
      contador++;
    });
  }
}
