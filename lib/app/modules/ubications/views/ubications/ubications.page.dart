import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jexpoints/app/shared/values/enviroments.dart';

import 'ubications-branches/ubications-branches.controller.dart';
import 'utills/map_utils.dart';

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
    Timer(const Duration(milliseconds: 1000), () {
      setState(() {});
    });
    loadData();
  }

  Future<void> loadData() async {
    final controller = Get.find<UbicationsBranchesController>();

    controller.branchesToShow.forEach((element) async {
      if (element == null || element.geoIcon == null) {
        return;
      }
      imgurl = '${Enviroments.FILES_URL}pointers/${element.geoIcon}';

      if (element.isActive == true) {
        imgUber = controller.branchesTags$
            .where((p0) => p0.name == 'Uber')
            .first
            .fileLink
            .toString();
      } else {
        imgUber = "https://fondosmil.com/fondo/17536.jpg";
      }
      if (element.isActive == true) {
        imgDidi = controller.branchesTags$
            .where((p0) => p0.name == 'DidiFood')
            .first
            .fileLink;
      } else {
        imgDidi = "https://fondosmil.com/fondo/17536.jpg";
      }
      if (element.isActive == true) {
        imgGallo = controller.branchesTags$
            .where((p0) => p0.name == 'SantoGallo')
            .first
            .fileLink;
      } else {
        imgGallo = "https://fondosmil.com/fondo/17536.jpg";
      }
      if (element.isActive == true) {
        imgEsp = controller.branchesTags$
            .where((p0) => p0.name == 'Esperanza')
            .first
            .fileLink;
      } else {
        imgUber = "https://fondosmil.com/fondo/17536.jpg";
      }

      Uint8List bytes =
          (await NetworkAssetBundle(Uri.parse(imgurl)).load(imgurl))
              .buffer
              .asUint8List();

      _markers.add(Marker(
          markerId: MarkerId(element.id.toString()),
          position: LatLng(
              double.parse(element.latitude), double.parse(element.longitude)),
          icon: BitmapDescriptor.fromBytes(bytes),
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  color: const Color(0xff2222222),
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
                                    element.geoIcon.toString()),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      onTap: () async {
                        MapUtils.openMap(double.parse(element.latitude),
                            double.parse(element.latitude));
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
                              element.name!,
                              maxLines: 2,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
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
                        element.description!,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        element.telefono.toString(),
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        element.horario.toString(),
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
              LatLng(double.parse(element.latitude),
                  double.parse(element.longitude)),
            );
          }));

      if (mounted) {
        setState(() {
          contador++;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
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
                padding: const EdgeInsets.only(bottom: 5),
                child: _markers.length > 150
                    ? GoogleMap(
                        onTap: (position) {
                          _customInfoWindowController.hideInfoWindow!();
                        },
                        onCameraMove: (position) {
                          _customInfoWindowController.onCameraMove!();
                        },
                        onMapCreated: (GoogleMapController controller) {
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
                width: 320,
                offset: 35,
              ),
            ],
          ));
    });
  }
}
