import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Timeline extends StatelessWidget {
  const Timeline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      // child: Expanded(
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
                color: Colors.grey,
                padding: const EdgeInsets.all(8),
                iconStyle: IconStyle(
                  color: Colors.white,
                  iconData: Icons.store_mall_directory_rounded,
                ),
              ),
              beforeLineStyle: const LineStyle(
                color: Colors.grey,
                thickness: 6,
              ),
            ),
            TimelineTile(
              axis: TimelineAxis.horizontal,
              alignment: TimelineAlign.center,
              endChild: Text('En camino'),
              indicatorStyle: IndicatorStyle(
                height: 40,
                color: Colors.grey,
                padding: const EdgeInsets.all(8),
                iconStyle: IconStyle(
                  color: Colors.white,
                  iconData: Icons.local_shipping_outlined,
                ),
              ),
              beforeLineStyle: const LineStyle(
                color: Colors.grey,
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
      // ),
    );
  }
}
