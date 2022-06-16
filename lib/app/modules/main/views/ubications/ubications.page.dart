import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jexpoints/app/modules/main/views/ubications/ubications.controller.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class UbicationsPage extends GetView<UbicationsController> {


//    @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Home(),
//     );
//   }
// }

// class Home extends StatefulWidget{
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   late GoogleMapController mapController; //contrller for Google map
//   final Set<Marker> markers = new Set(); //markers for google map
//   static const LatLng showLocation = const LatLng(27.7089427, 85.3086209); //location to show in map
  
//   @override
//   Widget build(BuildContext context) {
//     return  Padding(
//       padding: const EdgeInsets.only(bottom: 65),
//       child: Scaffold(
//             appBar: AppBar( 
//                title: Text("Multiple Markers in Google Map"),
//                backgroundColor: Colors.deepOrangeAccent,
//             ),
//             body: GoogleMap( //Map widget from google_maps_flutter package
//                       zoomGesturesEnabled: true, //enable Zoom in, out on map
//                       initialCameraPosition: CameraPosition( //innital position in map
//                         target: showLocation, //initial position
//                         zoom: 15.0, //initial zoom level
//                       ),
//                       markers: getmarkers(), //markers to show on map
//                       mapType: MapType.normal, //map type
//                       onMapCreated: (controller) { //method called when map is created
//                         setState(() {
//                           mapController = controller; 
//                         });
//                       },
//                     ),
//          ),
//     );
//   }

//   Set<Marker> getmarkers() { //markers to place on map





//     setState(() {
//       markers.add(Marker( //add first marker
//         markerId: MarkerId(showLocation.toString()),
//         position: showLocation, //position of marker
//         infoWindow: InfoWindow( //popup info 
//           title: 'Marker Title First ',
//           snippet: 'My Custom Subtitle',
//         ),
//         icon: BitmapDescriptor.defaultMarker, //Icon for Marker
//       ));

//       markers.add(Marker( //add second marker
//         markerId: MarkerId(showLocation.toString()),
//         position: LatLng(27.7099116, 85.3132343), //position of marker
//         infoWindow: InfoWindow( //popup info 
//           title: 'Marker Title Second ',
//           snippet: 'My Custom Subtitle',
//         ),
//         icon: BitmapDescriptor.defaultMarker, //Icon for Marker
//       ));

//       markers.add(Marker( //add third marker
//         markerId: MarkerId(showLocation.toString()),
//         position: LatLng(27.7137735, 85.315626), //position of marker
//         infoWindow: InfoWindow( //popup info 
//           title: 'Marker Title Third ',
//           snippet: 'My Custom Subtitle',
//         ),
//         icon: BitmapDescriptor.defaultMarker, //Icon for Marker
//       ));

//        //add more markers here 
//     });

//     return markers;
//   }

//     Future<void> fetchPost() async {
//     final response = await http.get(
//       Uri.parse('http://dev.jexbit.mx/JexcoreService/api/Organizations/6047b5dc-2e46-4dc3-951c-ce84ddb83dd3/branches'),
//     );

//   List<dynamic> responseJsonUbications = [];

    
// responseJsonUbications = json.decode(response.body);

//     print(responseJsonUbications);
//   }



  // static final CameraPosition _kYeditepe =
  //     CameraPosition(target: LatLng(40.971991, 29.152793), zoom: 17, tilt: 17);

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     // appBar: backAppBar(context, 'MAP'.tr),
  //     body: GoogleMap(
  //       mapType: MapType.normal,
  //       initialCameraPosition: _kYeditepe,
  //       markers: Set<Marker>.of(controller.markers.values),
  //       onMapCreated: (GoogleMapController  mapController) {
  //         rootBundle.loadString('assets/map_styles.txt').then((string) {
  //           String _mapStyle = string;
  //           mapController.setMapStyle(_mapStyle);
  //           _controller.complete(mapController);
  //         });
  //       },
  //     ),
  //   );
  // }


  const UbicationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    if (arguments['ubication'] != null) {

      final ubication = arguments['ubication'];

      final initialCameraPosition = CameraPosition(
        target: LatLng(
          double.parse(ubication.latitude),
          double.parse(ubication.longitude),
        ),
        zoom: 18,
      );

      return ChangeNotifierProvider<UbicationsController>(
          create: (_) => UbicationsController(),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 68),
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
              body: Consumer<UbicationsController>(
                builder: (_, controller, __) => GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: initialCameraPosition,
                  onMapCreated: controller.onMapCreated,
                  markers: controller.allMarkers,
                ),
              ),
            ),
          ));
    } else {
      return ChangeNotifierProvider<UbicationsController>(
          create: (_) => UbicationsController(),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 68),
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: const Color(0xff2222222),
                automaticallyImplyLeading: false,
                title: const Text('Ubicaciones'),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.list_alt),
                    onPressed: () {
                      Navigator.pushNamed(context, '/ubications-list');
                    },
                  ),
                ],
              ),
              body: Consumer<UbicationsController>(
                builder: (_, controller, __) => GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: controller.initialCameraPosition,
                  onMapCreated: controller.onMapCreated,
                  markers: controller.allMarkers,
                ),
              ),
            ),
          ));
    }
  }
}
