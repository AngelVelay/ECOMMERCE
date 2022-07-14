// import 'package:custom_info_window/custom_info_window.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:jexpoints/app/modules/main/views/ubications/ubications.controller.dart';

// class UbicationsPage extends GetView<UbicationsController> {
//   const UbicationsPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final CustomInfoWindowController _customInfoWindowController =
//         CustomInfoWindowController();

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xff2222222),
//         title: const Text('Ubicaciones'),
//         automaticallyImplyLeading: false,
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(Icons.list_alt),
//             onPressed: () {
//               Navigator.pushNamed(context, '/ubications-list');
//             },
//           ),
//         ],
//       ),
//       body: Stack(children: [
//         Padding(
//           padding: const EdgeInsets.only(bottom: 60),
//           child: Obx(() {
//             if (Get.put(UbicationsController()).allMarkers.length > 10) {
//               return Container(
//                 child: GoogleMap(
//                   mapType: MapType.normal,
//                   initialCameraPosition:
//                       Get.put(UbicationsController()).initialCameraPosition,
//                   markers: Set<Marker>.of(
//                       Get.put(UbicationsController()).allMarkers.obs),
//                   onTap: (position) {
//                     _customInfoWindowController.hideInfoWindow!();
//                   },
//                   compassEnabled: false,
//                   onCameraMove: (position) {
//                     _customInfoWindowController.onCameraMove!();
//                   },
//                   // onMapCreated: controller.onMapCreated);
//                   onMapCreated: (GoogleMapController controller) {
//                     _customInfoWindowController.googleMapController =
//                         controller;
//                   },
//                 ),
//               );
//             } else {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           }),
//         ),
//         CustomInfoWindow(
//           controller: _customInfoWindowController,
//           height: 200,
//           width: 300,
//           offset: 35,
//         ),
//       ]),
//     );
//   }
// }

import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jexpoints/app/modules/main/views/ubications/utills/map_utils.dart';

class UbicationsPage extends StatefulWidget {
  const UbicationsPage({Key? key}) : super(key: key);

  @override
  _CustomMarkerInfoWindowScreenState createState() =>
      _CustomMarkerInfoWindowScreenState();
}

class _CustomMarkerInfoWindowScreenState extends State<UbicationsPage> {
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();
  final LatLng _latLng = const LatLng(19.371114, -99.165478);
  final double _zoom = 12;
  final Set<Marker> _markers = <Marker>{}.obs;
  var ubications = [];
  String imgurl = "";
  String imgUber = "";
  String imgDidi = "";
  String imgGallo = "";
  String imgEsp = "";
  String imgBan = "";

  int contador = 0;

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    // final response = await http.get(
    //   Uri.parse(
    //       'http://dev.jexbit.mx/JexcoreService/api/OrganizationsApplicationsKeys/db755596-ed44-417b-9a5a-8512964932a8/branches'),
    // );

    final response = await http.get(
      Uri.parse('https://mocki.io/v1/8b1235d2-34cb-4f4a-a445-9b3406ed4ed2'),
    );

    ubications = json.decode(response.body);

    ubications.forEach((element) async {
      imgurl = "http://201.151.139.54/FileManagerDoctos/jexbit/" +
          element['geoIcon'];

      if (element['IsActive'] == "1") {
        imgUber = "https://i.postimg.cc/R0jN2DnZ/5f4921b668ecc70004ae7047.png";
      } else {
        imgUber = "https://fondosmil.com/fondo/17536.jpg";
      }
      if (element['IsActive'] == "1") {
        imgDidi = "https://i.postimg.cc/m2nxBf8R/descarga.png";
      } else {
        imgDidi = "https://fondosmil.com/fondo/17536.jpg";
      }
      if (element['IsActive'] == "1") {
        imgGallo = "https://santogallo.com/_assets/images/logo.png";
      } else {
        imgGallo = "https://fondosmil.com/fondo/17536.jpg";
      }
      if (element['IsActive'] == "1") {
        imgEsp =
            "https://media.glassdoor.com/sql/2701591/pastelerias-esperanza-squarelogo-1633693225130.png";
      } else {
        imgUber = "https://fondosmil.com/fondo/17536.jpg";
      }

      Uint8List bytes =
          (await NetworkAssetBundle(Uri.parse(imgurl)).load(imgurl))
              .buffer
              .asUint8List();

      _markers.add(Marker(
          markerId: MarkerId(element['id']),
          position: LatLng(double.parse(element['latitude']),
              double.parse(element['longitude'])),
          icon: BitmapDescriptor.fromBytes(bytes),
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      child: Container(
                        width: 300,
                        height: 60,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              scale: .2,
                              image: NetworkImage(
                                  "http://201.151.139.54/FileManagerDoctos/jexbit/" +
                                      element['baner']),
                              fit: BoxFit.fitWidth,
                              filterQuality: FilterQuality.high),
                          // borderRadius: const BorderRadius.all(
                          //   Radius.circular(10.0),
                          // ),
                          // color: Colors.black,
                        ),
                      ),
                      onTap: () async {
                        MapUtils.openMap(double.parse(element['latitude']),
                            double.parse(element['longitude']));
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 10,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 250,
                            height: 30,
                            child: Text(
                        element['name'],
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                          ),
                          // const Spacer(),
                          // Container(
                          //   width: 50,
                          //   height: 80,
                          //   decoration: BoxDecoration(
                          //     image: DecorationImage(
                          //         image: NetworkImage(imgUber),
                          //         fit: BoxFit.fitWidth,
                          //         filterQuality: FilterQuality.high),
                          //     borderRadius: const BorderRadius.all(
                          //       Radius.circular(10.0),
                          //     ),
                          //   ),
                          // ),
                          // Container(
                          //   width: 50,
                          //   height: 80,
                          //   decoration: BoxDecoration(
                          //     image: DecorationImage(
                          //         scale: .2,
                          //         image: NetworkImage(imgDidi),
                          //         fit: BoxFit.fitWidth,
                          //         filterQuality: FilterQuality.high),
                          //     borderRadius: const BorderRadius.all(
                          //       Radius.circular(10.0),
                          //     ),
                          //   ),
                          // ),
                          // Container(
                          //   width: 50,
                          //   height: 80,
                          //   decoration: BoxDecoration(
                          //     image: DecorationImage(
                          //         scale: .2,
                          //         image: NetworkImage(imgGallo),
                          //         fit: BoxFit.fitWidth,
                          //         filterQuality: FilterQuality.high),
                          //     borderRadius: const BorderRadius.all(
                          //       Radius.circular(10.0),
                          //     ),
                          //   ),
                          // ),
                          // Container(
                          //   width: 50,
                          //   height: 80,
                          //   decoration: BoxDecoration(
                          //     image: DecorationImage(
                          //         scale: .2,
                          //         image: NetworkImage(imgEsp),
                          //         fit: BoxFit.fitWidth,
                          //         filterQuality: FilterQuality.high),
                          //     borderRadius: const BorderRadius.all(
                          //       Radius.circular(10.0),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        element['description'],
                        maxLines: 2,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        "Telefono: 5512345678",
                        maxLines: 2,
                      ),
                    ),
                     const Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        "Horario: 8:00 a.m. a 9:00 p.m.",
                        maxLines: 2,
                      ),
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            width: 50,
                            height: 80,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(imgUber),
                                  fit: BoxFit.fitWidth,
                                  filterQuality: FilterQuality.high),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            width: 50,
                            height: 80,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  scale: .2,
                                  image: NetworkImage(imgDidi),
                                  fit: BoxFit.fitWidth,
                                  filterQuality: FilterQuality.high),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            width: 50,
                            height: 80,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  scale: .2,
                                  image: NetworkImage(imgGallo),
                                  fit: BoxFit.fitWidth,
                                  filterQuality: FilterQuality.high),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            width: 50,
                            height: 80,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  scale: .2,
                                  image: NetworkImage(imgEsp),
                                  fit: BoxFit.fitWidth,
                                  filterQuality: FilterQuality.high),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              LatLng(double.parse(element['latitude']),
                  double.parse(element['longitude'])),
            );
          }));
      contador++;

      if (mounted) {
        setState(() {});
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff2222222),
        title: const Text('Ubicaciones'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.list_alt),
            onPressed: () {
              Navigator.pushNamed(context, '/ubications-list');
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: _markers.length > 150
                ? GoogleMap(
                    onTap: (position) {
                      _customInfoWindowController.hideInfoWindow!();
                    },
                    onCameraMove: (position) {
                      _customInfoWindowController.onCameraMove!();
                    },
                    onMapCreated: (GoogleMapController controller) async {
                      _customInfoWindowController.googleMapController =
                          controller;
                    },
                    markers: _markers,
                    initialCameraPosition: CameraPosition(
                      target: _latLng,
                      zoom: _zoom,
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 248,
            width: 300,
            offset: 35,
          ),
        ],
      ),
    );
  }
}
