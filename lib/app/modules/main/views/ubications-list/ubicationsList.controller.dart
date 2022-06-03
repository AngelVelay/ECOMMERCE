import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jexpoints/app/components/map_ubication/map_ubication.dart';
import 'package:jexpoints/app/modules/main/entities/ubications.type.dart';
import 'package:http/http.dart' as http;
import 'package:jexpoints/app/modules/main/views/ubications/ubications.controller.dart';

class UbicationsListController extends GetxController {
  @override
  void onInit() {
    getBranches();
    super.onInit();
  }

  var reports$ = <dynamic>[].obs;
  var isLoading = false.obs;

  getBranches() async {
    isLoading.value = true;
    var response = await fetchPost();
    reports$.value =
        response.map((json) => UbicationsObject.fromJson(json)).toList();
    isLoading.value = false;
  }

  Future<dynamic> fetchPost() async {
    final response = await http.get(
      Uri.parse(
          'http://dev.jexbit.mx/JexcoreService/api/OrganizationsApplicationsKeys/3e0bc783-033c-43ef-b612-479f236b008e/branches'),
    );
    return json.decode(response.body);
  }

  consumeTap(BuildContext context, UbicationsObject item) {
    print(item);

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
              padding: EdgeInsets.only(left: 20, right: 20),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                  Text(
                    item.name,
                    style: TextStyle(
                        height: 1.5, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    item.description,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Hora de atención: Lunes a Viernes de 7:00 a 22:00',
                    style: TextStyle(height: 1.5, fontSize: 16),
                  ),
                  Text(
                    'Telefono: 55-55-55-55',
                    style: TextStyle(height: 1.5, fontSize: 16),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.55,
                    child: map(item),
                  ),

// CONTENEDOR ASINCRONO
                  // Container(
                  //   height: MediaQuery.of(context).size.height * 0.55,
                  //   child: FutureBuilder(
                  //     future: map(item),
                  //     builder: (context, snapshot) {
                  //       if (snapshot.hasData) {
                  //         return snapshot.data;
                  //       } else {
                  //         return Center(
                  //           child: CircularProgressIndicator(),
                  //         );
                  //       }
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ));
  }

  map(item)  {
    final initialCameraPosition = CameraPosition(
      target: LatLng(
        double.parse(item.latitude),
        double.parse(item.longitude),
      ),
      zoom: 18,
    );

    // var icon = await BitmapDescriptor.fromAssetImage(
    //     ImageConfiguration(devicePixelRatio: 3.2), 'assets/images/marker.png');

    // if (item.geoIcon == "esperanza_pointer.png") {
    //    icon = await BitmapDescriptor.fromAssetImage(
    //       ImageConfiguration(devicePixelRatio: 3.2),
    //       "assets/images/esperanza_pointer.png");
    // }else{
    //    icon = await BitmapDescriptor.fromAssetImage(
    //       ImageConfiguration(devicePixelRatio: 3.2),
    //       "assets/images/bonpane_pointer.png");
    // }

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
                double.parse(item.latitude),
                double.parse(item.longitude),
              ),
              icon: BitmapDescriptor.defaultMarker,
              // icon: icon,
              infoWindow: InfoWindow(
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
