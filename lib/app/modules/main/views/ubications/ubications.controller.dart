import 'dart:convert';
import 'dart:typed_data';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:jexpoints/app/modules/main/views/ubications/utills/map_style.dart';
import 'package:jexpoints/app/modules/main/views/ubications/utills/map_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class UbicationsController extends ChangeNotifier {
  // Map<MarkerId, Marker> markers = <MarkerId, Marker>{}.obs;

  // @override
  // void onInit() {
  //   super.onInit();
  //   generateMarkers();
  // }

  // generateMarkers() {
  //   int count = 0;
  //   for (var item in _markers) {
  //     count += 1;
  //     final String markerIdVal = 'marker_id_' + count.toString();
  //     final MarkerId markerId = MarkerId(markerIdVal);

  //     final Marker marker = Marker(
  //       markerId: markerId,
  //       position: LatLng(
  //         double.parse(item[1].toString()),
  //         double.parse(item[2].toString()),
  //       ),
  //       infoWindow:
  //           InfoWindow(title: item[0].toString(), snippet: 'Content'),
  //     );

  //     markers[markerId] = marker;
  //   }
  // }

  // final _markers = [
  //   [
  //     'Rektörlük',
  //     40.972877,
  //     29.152653,
  //     '/assets/img/number_1_3.png',
  //     'rektorluk'
  //   ],
  //   [
  //     'Mühendislik',
  //     40.972443,
  //     29.151457,
  //     '/assets/img/number_2_3.png',
  //     'muhendislik'
  //   ]
  //   // Continues
  // ];

  // void setMapStyle(String mapStyle) {}

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
          'http://dev.jexbit.mx/JexcoreService/api/OrganizationsApplicationsKeys/db755596-ed44-417b-9a5a-8512964932a8/branches'),
    );

    responseJsonUbications = json.decode(response.body);

    responseJsonUbications.forEach((element) async {
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
            //  Uri url = Uri.parse('geo:${element['latitude']},${element['longitude']}?q=${element['latitude']},${element['longitude']}');
            // // ignore: deprecated_member_use
            // await launch(url.toString());
            MapUtils.openMap(double.parse(element['latitude']), double.parse(element['longitude']));
          },
        ),
      ));
      contador++;
      notifyListeners();
    });
  }
}
