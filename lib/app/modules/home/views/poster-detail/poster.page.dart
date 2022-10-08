import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/app-bar/simple_app_bar/simple_app_bar.widget.dart';
import 'poster.controller.dart';

class PosterPage extends GetView<PosterController> {
  const PosterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: SimpleAppBar(title: controller.item?.title ?? 'Publicidad'),
          body: Column(
            children: [Expanded(child: imagePublicity()), productDesciption(context)],
          )),
    );
  }

  Widget imagePublicity() {
    return Stack(children: [
      SizedBox(
          width: double.infinity,
          child: Obx(() => controller.postersImage$.value != ''
              ? Image.network(
                  controller.postersImage$.value,
                  fit: BoxFit.cover,
                )
              : const Center(child: CircularProgressIndicator()))),
    ]);
  }

  Widget productDesciption(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 500,
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,          
          children: <Widget>[
            // Title and Heart
            Row(
              children: <Widget>[                
                SizedBox(
                  width: MediaQuery.of(context).size.width - 60,
                  child: Text('${controller.item?.title}',
                      overflow: TextOverflow.clip,                    
                      style: const TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                )
              ],
            ),

            const SizedBox(height: 5),

            // Subtitle
            Row(
              children: [
                const Text('Del ', style: TextStyle(color: Colors.white70)),
                Text(controller.formattedBeginDate,
                    style: const TextStyle(color: Colors.white70)),
                const Text(' al ', style: TextStyle(color: Colors.white70)),
                Text(controller.formattedEndDate,
                    style: const TextStyle(color: Colors.white70)),
              ],
            ),

            // Spacer
            const SizedBox(height: 30),

            // Description
            const Text('Descripción', style: TextStyle(color: Colors.white)),
            const SizedBox(height: 5),
            HtmlWidget('${controller.item?.description}',
                textStyle: const TextStyle(color: Colors.white70, height: 1.3)),

            const SizedBox(height: 30),

            // Terms
            const Text('Terminos y condiciones',
                style: TextStyle(color: Colors.white)),
            const SizedBox(height: 5),
            HtmlWidget('${controller.item?.terms}',
                textStyle: const TextStyle(color: Colors.white70, height: 1.3)),

            // const Spacer(),
            // //Button
            // Center(
            //   child: SizedBox(
            //     width: 400,
            //     child: ButtonTransparent(
            //       text: 'Compartir Publicidad',
            //       paddingHorizontal: 20,
            //       paddingVertical: 10,
            //       onPressed: () {
            //         controller.shareData();
            //       },
            //     ),
            //   ),
            // ),
          ],
        ));
  }
}
