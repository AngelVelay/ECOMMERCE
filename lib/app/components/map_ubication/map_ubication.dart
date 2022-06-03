import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class UbicationMap extends StatelessWidget {
  const UbicationMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              builder: (context) => Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: MapFlutter(),
                  ));
        },
        child: Text('Ubicacion'),
      )),
    );
  }
}

class MapFlutter extends StatelessWidget {
  const MapFlutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(19.3711356607997, -99.16553229774138),
        zoom: 15.0,
        rotation: 0.0,
      ),
      layers: [
        TileLayerOptions(
            urlTemplate:
                "https://api.mapbox.com/styles/v1/angelvelay/cl30cmwab002315o5h97wv64f/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYW5nZWx2ZWxheSIsImEiOiJja3p3ZWRuM2EwNHl6MnBuMDFoOTBneHZ6In0.aCUaNlzXlTwhEMVBw6vOjQ",
            additionalOptions: {
              'accessToken':
                  'pk.eyJ1IjoiYW5nZWx2ZWxheSIsImEiOiJja3p3ZWRuM2EwNHl6MnBuMDFoOTBneHZ6In0.aCUaNlzXlTwhEMVBw6vOjQ',
              'id': 'mapbox.mapbox-streets-v8',
            }),
        MarkerLayerOptions(
          markers: [
            Marker(
              width: 60.0,
              height: 60.0,
              point: LatLng(19.3711356607997, -99.16553229774138),
              builder: (ctx) => Container(
                child: FadeInImage(
                  placeholder: AssetImage('assets/images/marker.png'),
                  image: AssetImage('assets/images/marker.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
