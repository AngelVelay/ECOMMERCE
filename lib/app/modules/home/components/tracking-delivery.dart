import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TrackingDelivery extends StatefulWidget {
  TrackingDelivery({Key? key}) : super(key: key);

  @override
  State<TrackingDelivery> createState() => _TrackingDeliveryState();
}

class _TrackingDeliveryState extends State<TrackingDelivery> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimelineTile(
              isFirst: true,
              axis: TimelineAxis.horizontal,
              alignment: TimelineAlign.center,
              endChild: Text('Preparando '),
              indicatorStyle: IndicatorStyle(
                height: 40,
                color: Colors.blue,
                padding: const EdgeInsets.all(8),
                iconStyle: IconStyle(
                  color: Colors.white,
                  iconData: Icons.store_mall_directory_rounded,
                ),
              ),
              beforeLineStyle: const LineStyle(
                color: Colors.blue,
                thickness: 6,
              ),
            ),
            TimelineTile(
              axis: TimelineAxis.horizontal,
              alignment: TimelineAlign.center,
              endChild: Text('Saliendo'),
              indicatorStyle: IndicatorStyle(
                height: 40,
                color: Colors.blue,
                padding: const EdgeInsets.all(8),
                iconStyle: IconStyle(
                  color: Colors.white,
                  iconData: Icons.delivery_dining,
                ),
              ),
              beforeLineStyle: const LineStyle(
                color: Colors.blue,
                thickness: 6,
              ),
            ),
            TimelineTile(
              axis: TimelineAxis.horizontal,
              alignment: TimelineAlign.center,
              endChild: Text('En camino'),
              indicatorStyle: IndicatorStyle(
                height: 40,
                color: Colors.blue,
                padding: const EdgeInsets.all(8),
                iconStyle: IconStyle(
                  color: Colors.white,
                  iconData: Icons.local_shipping_outlined,
                ),
              ),
              beforeLineStyle: const LineStyle(
                color: Colors.blue,
                thickness: 6,
              ),
            ),
            TimelineTile(
              isLast: true,
              axis: TimelineAxis.horizontal,
              alignment: TimelineAlign.center,
              endChild: Text('Entregado'),
              indicatorStyle: IndicatorStyle(
                height: 40,
                color: Colors.grey,
                padding: const EdgeInsets.all(8),
                iconStyle: IconStyle(
                    color: Colors.white, iconData: Icons.tag_faces_rounded),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

  //  showModalBottomSheet(
  //     context: context,
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(
  //         top: Radius.circular(20),
  //       ),
  //     ),
  //     clipBehavior: Clip.antiAliasWithSaveLayer,
  //     builder: (context) => Column(
  //       children: [
  //         const Padding(
  //           padding: EdgeInsets.all(20.0),
  //           child: Text(
  //             'Cambiar dirección',
  //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  //           ),
  //         ),
  //         SizedBox(
  //           height: MediaQuery.of(context).size.height * 0.48,
  //           child: HomeAddressSelect(homeController),
  //         ),
  //       ],
  //     ),
  //   );
  // }