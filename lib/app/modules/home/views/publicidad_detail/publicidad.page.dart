import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'publicidad.controller.dart';

class PublicidadPage extends GetView<PublicidadController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Publicidad'),
        backgroundColor: const Color(0xFF222222),
      ),
      body: Column(
        children: [
          _header(controller),
          _center(controller),
          _bottomButton(context, controller)
        ],
      ),
    );
  }

  static Widget _header(PublicidadController controller) {
    return Expanded(
      child: SizedBox(
          width: double.infinity,
          child: FadeInImage(
            fit: BoxFit.contain,
            placeholder: const AssetImage('assets/images/loading.gif'),
            image: NetworkImage(controller.item[0]),
          )),
    );
  }

  Widget _center(PublicidadController controller) {
    return Column(
      children: [
        Text('${controller.item[1]}',
            style: const TextStyle(fontSize: 25, color: Colors.white)),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: HtmlWidget('${controller.item[2]}',
              textStyle: const TextStyle(fontSize: 16, color: Colors.white)),
        ),
      ],
    );
  }

  static Widget _bottomButton(BuildContext context, controller) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: 205,
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20)),
                child: GestureDetector(
                  onTap: () {
                    controller.shareData();
                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.share_sharp,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Compartir Publicidad',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        )
                      ]),
                ),
              ),
            )
          ],
        ));
  }
}
