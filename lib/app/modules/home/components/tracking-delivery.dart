import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              endChild: Text('Preparando ',
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      color: Colors.white)),
              indicatorStyle: IndicatorStyle(
                height: 40,
                color: Colors.white,
                padding: const EdgeInsets.all(8),
                iconStyle: IconStyle(
                  color: Colors.black,
                  iconData: Icons.storefront_rounded,
                ),
              ),
              beforeLineStyle: const LineStyle(
                color: Colors.white,
                thickness: 6,
              ),
            ),
            TimelineTile(
              axis: TimelineAxis.horizontal,
              alignment: TimelineAlign.center,
              endChild: Text('Saliendo',
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      color: Colors.white)),
              indicatorStyle: IndicatorStyle(
                height: 40,
                color: Colors.white,
                padding: const EdgeInsets.all(8),
                iconStyle: IconStyle(
                  color: Colors.black,
                  iconData: Icons.card_travel_rounded,
                ),
              ),
              beforeLineStyle: const LineStyle(
                color: Colors.white,
                thickness: 6,
              ),
            ),
            TimelineTile(
              axis: TimelineAxis.horizontal,
              alignment: TimelineAlign.center,
              endChild: Text('En camino',
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      color: Colors.white)),
              indicatorStyle: IndicatorStyle(
                height: 40,
                color: Colors.white,
                padding: const EdgeInsets.all(8),
                iconStyle: IconStyle(
                  color: Colors.black,
                  iconData: Icons.motorcycle_outlined,
                ),
              ),
              beforeLineStyle: const LineStyle(
                color: Colors.white,
                thickness: 6,
              ),
            ),
            TimelineTile(
              isLast: true,
              axis: TimelineAxis.horizontal,
              alignment: TimelineAlign.center,
              endChild: Text('Entregado',
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      color: Colors.white)),
              indicatorStyle: IndicatorStyle(
                height: 40,
                color: Colors.white,
                padding: const EdgeInsets.all(8),
                iconStyle: IconStyle(
                    color: Colors.black, iconData: Icons.tag_faces_outlined),
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