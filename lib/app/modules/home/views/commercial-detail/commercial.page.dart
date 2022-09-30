import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/button/custom_button_transparent.dart';

import '../publicidad_detail/publicidad.controller.dart';

class ProductPage extends GetView<PublicidadController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xff262A2D),
          body: Column(
            children: [
              Expanded(child: ImagePublicity(controller)),

              // Spacer(),

              productDesciption(controller)
            ],
          )),
    );
  }
}

Widget arrowBack() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        size: 30,
      ),
      onPressed: () {
        Get.back();
      },
    ),
  );
}

Widget ImagePublicity(PublicidadController controller) {
  return Stack(children: [
    Container(
        width: double.infinity,
        child: Obx(() => controller.postersImage$.value != ''
            ? Image.network(
                controller.postersImage$.value,
                fit: BoxFit.cover,
              )
            : const Center(child: CircularProgressIndicator()))),
    arrowBack()
  ]);
}

Widget productDesciption(PublicidadController controller) {
  return Container(
      width: double.infinity,
      height: 400,
      padding: EdgeInsets.all(40),
      decoration: decorationGreyBox(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Title and Heart
          Row(
            children: <Widget>[
              Text('${controller.item[5]}',
                  style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              Spacer(),
              Icon(Icons.heart_broken, color: Colors.red)
            ],
          ),
          // Spacer
          SizedBox(height: 10),

          // Subtitle
          Text('${controller.item[1]}',
              style: TextStyle(color: Colors.white70)),

          // Spacer
          SizedBox(height: 20),

          // Description
          HtmlWidget('${controller.item[2]}',
              textStyle: TextStyle(color: Colors.white70, height: 1.3)),

          SizedBox(height: 20),

          // Description
          HtmlWidget('${controller.item[4]}',
              textStyle: TextStyle(color: Colors.white70, height: 1.3)),

          Spacer(),
          // Total and Button

          Center(
            child: Container(
              width: 400,
              child: ButtonTransparent(
                text: 'Compartir Publicidad',
                paddingHorizontal: 20,
                paddingVertical: 10,
                onPressed: () {
                  controller.shareData();
                },
              ),
            ),
          ),
        ],
      ));
}

BoxDecoration decorationGreyBox() {
  return BoxDecoration(
      color: Color(0xff262A2D),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40), topRight: Radius.circular(40)));
}
