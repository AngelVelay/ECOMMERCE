import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:jexpoints/app/modules/home/views/details/detail.controller.dart';
import 'package:jexpoints/app/modules/home/views/details_screen/widgets/constants.dart';

class Header extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      decoration: const BoxDecoration(
        color: Color(0xff4efeb),
      ),
      child: Hero(
        tag: controller.itemDetail.id,
        child: Image.network(
          controller.itemDetail.imageLink,
          width: double.infinity,
          height: 250,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
