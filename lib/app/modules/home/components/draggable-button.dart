import 'package:badges/badges.dart';
import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                  color: Colors.black,
                  height: MediaQuery.of(context).copyWith().size.height * 0.35,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'SIGUE TU PEDIDO',
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              color: Colors.white),
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
    padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 30),
    child: Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(30))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextButton(
                  onPressed: () {
                    Get.toNamed('/delivery-detail');
                  },
                  child: Text(
                    'Ver detalle',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontFamily: 'Montserrat',
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ),
        ],
      ),
    ),
  );
}
