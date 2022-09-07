import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jexpoints/app/modules/ubications/views/ubications/ubications.controller.dart';

import 'utills/map_utils.dart';

class UbicationsPage extends StatefulWidget {
  const UbicationsPage({Key? key}) : super(key: key);

  @override
  _CustomMarkerInfoWindowScreenState createState() =>
      _CustomMarkerInfoWindowScreenState();
}

class _CustomMarkerInfoWindowScreenState extends State<UbicationsPage> {
  final branchesTagsController = Get.find<UbicationsController>();

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

    branchesTagsController.branchesTags$.forEach((elementBranch) {
      ubications.forEach((element) async {
        imgurl = "http://201.151.139.54/FileManagerDoctos/jexbit/" +
            element['geoIcon'];

        // ignore: unrelated_type_equality_checks
        if (elementBranch.isActive == "1") {
          imgUber = elementBranch.fileLink[0];
        } else {
          imgUber = "https://fondosmil.com/fondo/17536.jpg";
        }
        if (element['IsActive'] == "1") {
          imgDidi = "https://i.postimg.cc/m2nxBf8R/descarga.png";
        } else {
          imgDidi = elementBranch.fileLink[4];
        }
        if (element['IsActive'] == "1") {
          imgGallo = "https://i.postimg.cc/v8g8JWvd/Santo-Gallo-logo.png";
        } else {
          imgGallo = elementBranch.fileLink[2];
        }
        if (element['IsActive'] == "1") {
          imgEsp = "https://i.postimg.cc/k5KBPWC4/Esperanza-Logo.png";
        } else {
          imgUber = elementBranch.fileLink[3];
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
                                    image: NetworkImage(imgEsp),
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              padding: const EdgeInsets.only(bottom: 5),
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
              height: 250,
              width: 300,
              offset: 35,
            ),
          ],
        ),
      ),
    );
  }
}
