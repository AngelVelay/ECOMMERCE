import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/app-bar/simple_app_bar/simple_app_bar.widget.dart';
import 'package:jexpoints/app/modules/rewards/entities/coupon.type.dart';
import 'package:jexpoints/app/shared/values/globals.dart';

import 'coupons.controller.dart';

class CouponsPage extends GetView<CouponsController> {
  const CouponsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff2222222),
      child: Scaffold(
        appBar: SimpleAppBar(title: 'Mis Cupones'),
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
    return item.isActive == true
        ? Padding(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              item.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ),
                          TextButton.icon(
                            style: ButtonStyle(
                                side: MaterialStateProperty.all(
                                    const BorderSide(
                                        width: 2, color: Colors.white)),
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10)),
                                textStyle: MaterialStateProperty.all(
                                    const TextStyle(fontSize: 15))),
                            onPressed: () {
                              controller.copyCoupon(item);
                            },
                            label: Text(
                              item.code.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            icon: const Icon(Icons.copy_rounded,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image(
                              image: NetworkImage(
                                  item.fileManagerThumbnail.toString()),
                              width: 100,
                              height: 100,
                            )),
                        const SizedBox(
                          width: 15,
                        ),
                        Flexible(
                          child: HtmlWidget(
                            item.description.toString(),
                            textStyle: const TextStyle(color: Colors.white),
                          ),
                        )
                      ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(children: [
                            const Text(
                              'Valido hasta',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 12),
                            ),
                            Text(
                              Globals.dateFormat
                                  .format(DateTime.parse(item.endDate!)),
                              style: const TextStyle(color: Colors.white),
                            )
                          ]),
                          TextButton(
                              onPressed: () => controller.toDetail(item),
                              child: const Text(
                                'Ver m??s',
                                style: TextStyle(
                                    color: Colors.white,
                                    decoration: TextDecoration.underline),
                              ))
                        ],
                      )
                    ]))),
          )
        : Container();
  }
}
