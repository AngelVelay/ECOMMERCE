import 'package:badges/badges.dart';
import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/form-controls/custom-rounded-button-alt.widget.dart';
import 'package:jexpoints/app/modules/home/views/tab-home/tab-home.controller.dart';

import 'tracking-delivery.dart';

class DraggableButton extends StatelessWidget {
  const DraggableButton();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: DraggableFab(
      child: Badge(
          showBadge: true,
          badgeContent: const Text(
            '1',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                builder: (context) => Container(
                  height: MediaQuery.of(context).copyWith().size.height * 0.35,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Sigue tu pedido',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        height: 100,
                        child: TrackingDelivery(),
                      ),
                      _buttonDetail()
                    ],
                  ),
                ),
              );
            },
            child: const FadeInImage(
              fit: BoxFit.cover,
              placeholder: AssetImage('assets/images/delivery_m.png'),
              image: AssetImage('assets/images/delivery_m.png'),
            ),
          )),
    ));
  }
}

Widget _buttonDetail() {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      width: double.infinity,
      child: CustomRoundedButtonAlt(
        onPressed: () {
          Get.toNamed('/delivery-detail');
        },
        text: 'Ver detalle',
      ),
    ),
  );
}
