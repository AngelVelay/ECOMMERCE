import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/main/entities/reviews.type.dart';

import 'package:jexpoints/app/modules/main/views/profile/profile.controller.dart';
import 'package:jexpoints/app/modules/main/views/tab-rewards/tab-rewards.controller.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../components/circular-progress-bar/circular-progress-bar.dart';
import '../../../../components/linear-progress-bar/linear-progress-bar.dart';
import '../../entities/coupon.type.dart';
import '../consume/consume.page.dart';
import '../tab-home/components/user-number-card.dart';

class RewardsPage extends GetView<RewardsController> {
  const RewardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff222222),
      child: SafeArea(
        bottom: false,
        child: DefaultTabController(
            length: 3,
            child: Scaffold(
              body: _body(context),
            )),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        children: [
          _header(),
          const userCardNumber()
          // _tabBar(context)
        ],
      ),
    );
  }

  Widget _header() {
    return Container(
        color: Color(0XFF222222),
        child: Column(
          children: [
            Row(children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: CircularProgressBar(
                  sizeProgressBar: 45.0,
                  AvatarSize: 40,
                  percent: 8,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _userName(),
                  _pointsIndicator(),
                  const SizedBox(height: 10),
                  _levelIndicator()
                ],
              ),
            ]),
          ],
        ));
  }

  Widget _pointsIndicator() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 130,
            height: 40,
            color: const Color(0xFF43578d),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const FadeInImage(
                    placeholder: AssetImage('assets/images/estrella.png'),
                    image: AssetImage('assets/images/estrella.png')),
                Container(width: 10),
                const Text('35 pts',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white)),
              ],
            ),
          ),
        ));
  }

  Widget _userName() {
    return Padding(
        padding: EdgeInsets.all(10),
        child: const Text('Angel Velay',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white)));
  }

  Widget _levelIndicator() {
    return LinearPercentIndicator(
        width: 200,
        animation: true,
        lineHeight: 25,
        animationDuration: 2000,
        percent: 0.8,
        center: const Text("Nivel Oro",
            style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        barRadius: const Radius.circular(16),
        progressColor: const Color(0xFFc59400));
  }

  // static Widget _levelBar() {
  //   return const Padding(
  //     padding: EdgeInsets.only(bottom: 0, left: 10),
  //     child: LinearProgressBar(
  //       trailing: 'Platino',
  //     ),
  //   );
  // }

  Widget _tabBar(context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(25.0)),
            child: TabBar(
              indicator: BoxDecoration(
                  color: Color(0xff2222222),
                  borderRadius: BorderRadius.circular(25.0)),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              tabs: const [
                Tab(
                  text: 'Consumos',
                ),
                Tab(
                  text: 'Cupones',
                ),
                Tab(
                  text: 'Reseñas',
                ),
              ],
            ),
          ),
        ),
        Expanded(
            child: TabBarView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: _consumeInfo(context),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: _couponList(context),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: _reviewList(context),
            ),
          ],
        ))
      ],
    );
  }

  Widget _reviewList(BuildContext context) {
    return Obx(() {
      return SingleChildScrollView(
          child: ListView.builder(
              // separatorBuilder: (context, index) => const Divider(thickness: 2),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: controller.reviews$.length,
              itemBuilder: (context, index) {
                return _reviewListItem(context, controller.reviews$[index]);
              }));
    });
  }

  Widget _reviewListItem(BuildContext context, Review item) {
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
                    Row(
                      children: [
                        Text(
                          item.name,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                      ],
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
                        image: NetworkImage(item.productURL),
                        width: 100,
                        height: 100,
                      )),
                  const SizedBox(
                    width: 15,
                  ),
                  Flexible(
                      child: Text(
                    '"${item.comment}"',
                    style: const TextStyle(
                        color: Colors.white70, fontStyle: FontStyle.italic),
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                  ))
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RatingBar.builder(
                      initialRating: item.rating,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    )
                  ],
                )
              ]))),
    );
  }

  static Widget _consumeInfo(BuildContext context) {
    return Column(children: [
      // List Header
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Mis Compras',
              style: TextStyle(fontSize: 22, color: Colors.white)),
          GestureDetector(
            onTap: () {
              Get.toNamed("/consume");
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Ver Todos', style: Theme.of(context).textTheme.headline4),
                Icon(Icons.arrow_forward_ios, color: Colors.white),
              ],
            ),
          )
        ],
      ).paddingSymmetric(horizontal: 10),
      const Divider(thickness: 2),
      consumeInfo()
    ]);
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
                    Row(
                      children: [
                        Text(
                          item.title,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(width: 70),
                        TextButton.icon(
                            icon: Icon(Icons.copy_rounded, color: Colors.white),
                            style: ButtonStyle(
                                side: MaterialStateProperty.all(
                                    const BorderSide(
                                        width: 2, color: Colors.white)),
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10)),
                                textStyle: MaterialStateProperty.all(
                                    TextStyle(fontSize: 15))),
                            onPressed: () {
                              controller.shareData(item);
                            },
                            label: Text(
                              item.code,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )),
                      ],
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
