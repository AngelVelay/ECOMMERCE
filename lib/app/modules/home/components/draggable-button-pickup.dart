import 'package:badges/badges.dart';
import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/button/custom_button_transparent.dart';

import '../../../components/form-controls/custom-rounded-button-alt.widget.dart';
import 'tracking-pickup-qr.dart';

class DraggableButtonPickup extends StatelessWidget {
  const DraggableButtonPickup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableFab(
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
                isScrollControlled: true,
                backgroundColor: Color(0xff2222222),
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                builder: (context) => SizedBox(
                  height: MediaQuery.of(context).copyWith().size.height * 0.85,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          'Mostrar en Sucursal',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(
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
              fit: BoxFit.contain,
              placeholder: AssetImage('assets/images/magdalena.png'),
              image: AssetImage('assets/images/magdalena.png'),
            ),
          )),
    );
  }
}

Widget _buttonDetail() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
    child: SizedBox(
      width: double.infinity,
      child: ButtonTransparent(
        paddingHorizontal: 20,
        paddingVertical: 10,
        text: 'Ver detalle',
        onPressed: () {
          Get.toNamed('/delivery-detail');
        },
      ),
      // child: CustomRoundedButtonAlt(
      //   onPressed: () {
      //     Get.toNamed('/delivery-detail');
      //   },
      //   text: 'Ver detalle',
      // ),
    ),
  );
}
