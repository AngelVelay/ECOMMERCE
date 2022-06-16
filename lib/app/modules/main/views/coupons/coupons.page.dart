import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/main/entities/coupon.type.dart';

import '../../../../components/map_ubication/map_ubication.dart';
import 'coupons.controller.dart';

class CouponsPage extends GetView<CouponsController> {
  const CouponsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff2222222),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Mis Cupones'),
        ),
        body: _couponList(context),
      ),
    );
  }

  // List
  Widget _couponList(BuildContext context) {
    return Obx(() {
      return SingleChildScrollView(
          child: ListView.builder(
              // separatorBuilder: (context, index) => const Divider(thickness: 2),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: controller.coupons$.length,
              itemBuilder: (context, index) {
                return _couponListItem(context, controller.coupons$[index]);
              }));
    });
  }

  Widget _couponListItem(BuildContext context, Coupon item) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: DottedBorder(
          color: Colors.white,
          strokeWidth: 1,
          dashPattern: const [15, 10],
          radius: const Radius.circular(10),
          borderType: BorderType.RRect,
          child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image(
                        image: NetworkImage(item.url),
                        width: 100,
                        height: 100,
                      )),
                  const SizedBox(
                    width: 15,
                  ),
                  Flexible(
                      child: Text(
                    item.description,
                    style: const TextStyle(color: Colors.white70),
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                  ))
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(children: [
                      const Text(
                        'Valido hasta',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                      Text(
                        item.formattedValidTo!,
                        style: const TextStyle(color: Colors.white),
                      )
                    ]),
                    TextButton(
                        onPressed: () => controller.toDetail(item),
                        child: const Text(
                          'Ver más',
                          style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline),
                        ))
                  ],
                )
              ]))),
    );
  }
}