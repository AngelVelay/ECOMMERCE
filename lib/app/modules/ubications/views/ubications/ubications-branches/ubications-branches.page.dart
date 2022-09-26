import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'ubications-branches.controller.dart';

class BranchesUbicationsPage extends GetView<UbicationsBranchesController> {
  BranchesUbicationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UbicationsBranchesController>(
        builder: (value) => SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  iconTheme: const IconThemeData(color: Colors.white),
                  title: const Text(
                    'Ubicaciónes',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                body: Stack(
                  children: [
                    _googleMaps(),
                    // markerList()
                    // _iconMyLocation(),
                  ],
                ),
              ),
            ));
  }

  // Widget markerList() {
  //   return ListView.builder(
  //     itemCount: controller.branches$.length,
  //     itemBuilder: (context, index) {
  //       return ListTile(
  //         title: Text(controller.branches$[index].name.toString()),
  //         subtitle: Text(controller.branches$[index].telefono.toString()),
  //         leading: const Icon(Icons.location_on),
  //         onTap: () {
  //           // controller.mapController.animateCamera(
  //           //   CameraUpdate.newCameraPosition(
  //           //     CameraPosition(
  //           //       target: LatLng(
  //           //         controller.branches$[index].latitude as double,
  //           //         controller.branches$[index].longitude as double,
  //           //       ),
  //           //       zoom: 16,
  //           //     ),
  //           //   ),
  //           // );
  //         },
  //       );
  //     },
  //   );
  // }

  // Widget _iconMyLocation() {
  //   return Container(
  //     margin: EdgeInsets.only(bottom: 40),
  //     child: Center(
  //       child: Image.asset(
  //         'assets/images/marker.png',
  //         width: 65,
  //         height: 65,
  //       ),
  //     ),
  //   );
  // }

  Widget _googleMaps() {
    return GoogleMap(
      markers: controller.markers,
      initialCameraPosition: controller.initialPosition,
      mapType: MapType.normal,
      onMapCreated: controller.onMapCreated,
      myLocationButtonEnabled: false,
      myLocationEnabled: true,
      onCameraMove: (position) {
        controller.initialPosition = position;
      },
      // onCameraIdle: () async {
      //   await controller
      //       .setLocationDraggableInfo(); // EMPEZAR A OBTNER LA LAT Y LNG DE LA POSICION CENTRAL DEL MAPA
      // },
    );
  }
}
