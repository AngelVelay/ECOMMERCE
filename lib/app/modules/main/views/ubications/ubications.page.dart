import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jexpoints/app/modules/main/views/ubications/ubications.controller.dart';
import 'package:provider/provider.dart';

class UbicationsPage extends GetView<UbicationsController> {
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
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xff2222222),
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
                initialCameraPosition: initialCameraPosition,
                onMapCreated: controller.onMapCreated,
                markers: controller.allMarkers,
              ),
            ),
          ));
    } else {
      return ChangeNotifierProvider<UbicationsController>(
          create: (_) => UbicationsController(),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xff2222222),
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
          ));
    }
  }
}
