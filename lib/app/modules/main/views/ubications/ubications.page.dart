import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jexpoints/app/modules/main/views/ubications/ubications.controller.dart';

class UbicationsPage extends GetView<UbicationsController> {
  const UbicationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomInfoWindowController _customInfoWindowController =
        CustomInfoWindowController();
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
        body: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: Obx(() {
              if (Get.put(UbicationsController()).allMarkers.length > 150) {
                return GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition:
                        Get.put(UbicationsController()).initialCameraPosition,
                    markers: Set<Marker>.of(
                        Get.put(UbicationsController()).allMarkers.obs),
                    onTap: (position) {
                      _customInfoWindowController.hideInfoWindow!();
                    },
                    compassEnabled: false,
                    onCameraMove: (position){
                      _customInfoWindowController.onCameraMove!();
                    },
                    // onMapCreated: controller.onMapCreated);
                    onMapCreated: (GoogleMapController controller) {
                      _customInfoWindowController.googleMapController = controller;

// showInfoWindows();

                    });
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
          ),
        ]));
  }

  showInfoWindows(){


  }


}
