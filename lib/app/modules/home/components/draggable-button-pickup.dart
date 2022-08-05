import 'package:badges/badges.dart';
import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/form-controls/custom-rounded-button-alt.widget.dart';
import 'tracking-delivery.dart';
import 'tracking-pickup-qr.dart';

class DraggableButtonPickup extends StatelessWidget {
  const DraggableButtonPickup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
            child: DraggableFab(
      child: Badge(
          showBadge: true,
          badgeContent: const Text(
            '1',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          child: FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Color(0XFF2222222),
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                builder: (context) => Container(
                  height: MediaQuery.of(context).copyWith().size.height * 0.85,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          'Mostrar en Sucursal',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 500,
                        child: TrackingPickup(),
                      ),
                      _buttonDetail(),
                    ],
                  ),
                ),
              );
            },
            child: const FadeInImage(
              fit: BoxFit.cover,
              placeholder: AssetImage('assets/images/delivery-man.png'),
              image: AssetImage('assets/images/delivery-man.png'),
            ),
          )),
    )));
  }
}

Widget _buttonDetail() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
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
