import 'dart:convert';
import 'dart:typed_data';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:jexpoints/app/modules/ubications/entities/branches-tags.type.dart';
import 'package:jexpoints/app/modules/ubications/services/branches-tags/branches-tags.contract.dart';
import 'package:jexpoints/app/modules/ubications/views/ubications/utills/map_style.dart';

import 'utills/map_utils.dart';

// import 'package:jexpoints/app/modules/main/views/ubications/utills/map_utils.dart';

class UbicationsController extends GetxController {
  final IBranchTagsService branchService;

  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();
  var ubications = [];
  Set<Marker> allMarkers = <Marker>{}.obs;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{}.obs;
  String imgurl = "";
  int contador = 0;
  var isLoading = false.obs;
  late var branchesTags$ = <BranchesTags>[].obs;

  UbicationsController(this.branchService);

  @override
  void onInit() {
    super.onInit();
    fetchPost();
    final CustomInfoWindowController _customInfoWindowController =
        CustomInfoWindowController();
    branchesTags$.value = branchService.getTags() as List<BranchesTags>;
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
          markerId: MarkerId(element['id']),
          position: LatLng(double.parse(element['latitude']),
              double.parse(element['longitude'])),
          icon: BitmapDescriptor.fromBytes(bytes),
          // infoWindow: InfoWindow(
          //   title: element['name'],
          //   snippet: element['description'],
          // ),
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              GestureDetector(
                child: Container(
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
                      Container(
                        width: 300,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              scale: .2,
                              image: NetworkImage(
                                  "http://201.151.139.54/FileManagerDoctos/jexbit/" +
                                      element['geoIcon']),
                              fit: BoxFit.fitWidth,
                              filterQuality: FilterQuality.high),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          // color: Colors.red,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: Text(
                                element['name'],
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                                softWrap: false,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '.3 mi.',
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: Text(
                          element['description'],
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () async {
                  MapUtils.openMap(double.parse(element['latitude']),
                      double.parse(element['longitude']));
                },
              ),
              LatLng(double.parse(element['latitude']),
                  double.parse(element['longitude'])),
            );
          }));
      contador++;
    });
  }
}
