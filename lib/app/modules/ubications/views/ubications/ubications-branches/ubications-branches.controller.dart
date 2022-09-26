import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../entities/branches-tags.type.dart';
import '../../../entities/sucursal-type.dart';
import '../../../services/branches-tags/branches-tags.contract.dart';
import '../utills/map_style.dart';
import '../utills/map_utils.dart';

class UbicationsBranchesController extends GetxController {
  CameraPosition initialPosition =
      const CameraPosition(target: LatLng(19.4279804, -99.1610907), zoom: 16);
  Completer<GoogleMapController> mapController = Completer();
  Set<Marker> allMarkers = <Marker>{}.obs;

  Position? position;
  final IBranchTagsService branchService;
  final LatLng latLng = const LatLng(19.371114, -99.165478);
  final double zoom = 12;
  final Set<Marker> markers = <Marker>{}.obs;
  var isLoading = false.obs;
  var branchesTags$ = <BranchesTags>[].obs;
  var branches$ = <SucursalType>[].obs;
  var settings$ = [].obs;
  var ubications = [];
  var branchesToShow = <SucursalType>[].obs;
  var tags = [];
  String imgurl = "";
  String imgUber = "";
  String imgDidi = "";
  String imgGallo = "";
  String imgEsp = "";
  String imgBan = "";

  int contador = 0;

  UbicationsBranchesController(this.branchService);

  @override
  void onInit() async {
    super.onInit();
    branchesTags$.value = await branchService.getBranchesTags();
    branches$.value = await branchService.getBranches();
    getBranchesTags();
    marker();
  }

  Future<void> onMapCreated(GoogleMapController controller) async {
    controller.setMapStyle(styleMap);
  }

  final initialCameraPosition = const CameraPosition(
    target: LatLng(19.371114, -99.165478),
    zoom: 12,
  );

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  getBranchesTags() async {
    branchService.getBranchesTags().then((value) {
      branchesTags$.value = value;
      branchService.getBranches().then((value) {
        branches$.value = value;
        branchesToShow.value = branches$;
        value
            .map((e) => {
                  e.settingsId == null ||
                          e.settingsId == '00000000-0000-0000-0000-000000000000'
                      ? e.settingsId = ''
                      : getSettingsId(e.settingsId)
                })
            .toList();
      });
    });
    update();
  }

  getSettingsId(settingsId) async {
    branchService.getSettings(settingsId).then((data) {
      branches$.map((SucursalType branch) => {
            if (branch.settingsId == settingsId)
              {
                branch.tags = [] as TagsType,
                data.map((tag) => {
                      tags.map((tag2) => {
                            if (tag2['name'] == tag['name'])
                              {
                                branch.tags?.add(TagsType(
                                  id: tag2['id'],
                                  name: tag2['name'],
                                  icon: tag2['icon'],
                                  group: tag2['group'],
                                  isActive: tag2['isActive'],
                                  branchTagsId: tag2['id'],
                                  branchesConfigurationId: '',
                                  fileLink: '',
                                  isBySystem: false,
                                  isNew: false,
                                  iconTags: tag2['iconTags'],
                                )),
                              }
                          })
                    })
              },
            if (branch == branches$.last)
              {branchesToShow.value = branches$, isLoading.value = true}
          });
    });

    update();
  }

  animateCamera(double lat, double lng) async {
    GoogleMapController controller = await mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 13, bearing: 0)));
  }

  marker() {
    branchesToShow.forEach((element) => {
          markers.add(Marker(
            markerId: MarkerId(element.id.toString()),
            position:
                LatLng(element.latitude as double, element.longitude as double),
            infoWindow: InfoWindow(
              title: element.name,
              snippet: element.telefono.toString(),
            ),
            icon: BitmapDescriptor.defaultMarker,
          ))
        });
    update();
  }

  consumeTap(BuildContext context, SucursalType item) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (context) => Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                  Text(
                    item.name.toString(),
                    style: const TextStyle(
                        height: 1.5, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    item.description.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const Text(
                    'Hora de atención: Lunes a Viernes de 7:00 a 22:00',
                    style: TextStyle(height: 1.5, fontSize: 16),
                  ),
                  const Text(
                    'Telefono: 55-55-55-55',
                    style: TextStyle(height: 1.5, fontSize: 16),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.50,
                    // height: 350,
                    child: map(item),
                  ),
                ],
              ),
            ));
  }

  map(item) {
    final initialCameraPosition = CameraPosition(
      target: LatLng(double.parse(item.latitude), double.parse(item.longitude)),
      zoom: 18,
    );
    return Scaffold(
      body: Column(children: <Widget>[
        Expanded(
            child: GoogleMap(
          initialCameraPosition: initialCameraPosition,
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          mapType: MapType.normal,
          onTap: (position) {
            debugPrint('Tapped: ${position.latitude}, ${position.longitude}');
          },
          markers: <Marker>{
            Marker(
              markerId: const MarkerId('1'),
              position: LatLng(
                  double.parse(item.latitude), double.parse(item.longitude)),
              icon: BitmapDescriptor.defaultMarker,
              infoWindow: InfoWindow(
                onTap: () async {
                  MapUtils.openMap(double.parse(item.latitude),
                      double.parse(item.longitude));
                },
                title: item.name,
                snippet: item.description,
              ),
            ),
          },
          compassEnabled: true,
        ))
      ]),
    );
  }
}
