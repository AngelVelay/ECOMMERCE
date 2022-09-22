import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jexpoints/app/components/circle_icon_button/circle_icon_button.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../../components/circular-progress-bar/circular-progress-bar.dart';
import '../../../home/views/tab-home/components/user-number-card.dart';
import '../../rewards.module.dart';
import 'rewards.controller.dart';

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
            child: SingleChildScrollView(
              child: _body(context),
            )),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        children: [
          const SizedBox(height: 30),
          Obx(() {
            return _header();
          }),
          const SizedBox(height: 20),
          const userCardNumber(),
          const SizedBox(height: 20),
          _coupons(),
          const SizedBox(height: 40),
          _menu(context)
        ],
      ),
    );
  }

  Widget _header() {
    return Container(
      color: const Color(0XFF222222),
      child: Column(children: [
        const Padding(
            padding: EdgeInsets.all(10.0),
            child: CircleAvatar(
              radius: 33, // Image radius
              backgroundImage:
                  AssetImage('assets/images/female-07.jpg'), // Image URL
            )),
        // Stack(children: [
        //   const Padding(
        //     padding: EdgeInsets.all(10.0),
        //     child: CircularProgressBar(
        //       sizeProgressBar: 55.0,
        //       AvatarSize: 50,
        //       percent: 8,
        //     ),
        //   ),
        //   Positioned(
        //       top: 80,
        //       left: 90,
        //       child: CircleIconButton(
        //         iconData: Icons.edit,
        //         onPressed: () => controller.toUserDetails(),
        //         backgroundColor: Colors.black,
        //         foregroundColor: Colors.white,
        //       ))
        // ]),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _name(),
            const SizedBox(height: 10),
            _pointsIndicator(),
            const SizedBox(height: 15),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [_levelIndicator()])
          ],
        ),
      ]),
    );
  }

  Widget _name() {
    return Text(controller.user$.value.name,
        style: const TextStyle(
            fontSize: 20,
            letterSpacing: 0,
            color: Colors.white,
            fontFamily: 'Montserrat-Bold'));
  }

  Widget _pointsIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          width: 10,
          height: 10,
          child: FadeInImage(
              placeholder: AssetImage('assets/images/shine.png'),
              image: AssetImage('assets/images/shine.png')),
        ),
        const SizedBox(width: 5),
        controller.pointsLevel$.isNotEmpty
            ? Text('${controller.pointsLevel$.first.initialPoints} pts',
                style: const TextStyle(
                    fontSize: 10,
                    letterSpacing: 0,
                    color: Colors.white,
                    fontFamily: 'Montserrat-Bold'))
            : const Text('0 pts',
                style: TextStyle(
                    fontSize: 10,
                    letterSpacing: 0,
                    color: Colors.white,
                    fontFamily: 'Montserrat-Bold')),
        // Text('${controller.user$.value.membership?.points} pts',
        //     style: const TextStyle(fontSize: 10, color: Colors.white)),
        // Text(
        //     '  (${NumberFormat.currency(locale: "en_US", symbol: '\$ ').format(controller.user$.value.membership?.pointsValue)})',
        //     style: const TextStyle(fontSize: 13, color: Colors.white)
        // )
      ],
    );
    // return Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 20),
    //     child: ClipRRect(
    //       borderRadius: BorderRadius.circular(20),
    //       child: Container(
    //         width: 180,
    //         height: 40,
    //         color: const Color(0xFF43578d),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: [
    //             const FadeInImage(
    //                 placeholder: AssetImage('assets/images/estrella.png'),
    //                 image: AssetImage('assets/images/estrella.png')),
    //             const SizedBox(width: 10),
    //             Text('${controller.user$.value.membership?.points} pts',
    //                 style: const TextStyle(
    //                     fontWeight: FontWeight.bold,
    //                     fontSize: 15,
    //                     color: Colors.white)),
    //             Text(
    //                 '  (${NumberFormat.currency(locale: "en_US", symbol: '\$ ').format(controller.user$.value.membership?.pointsValue)})',
    //                 style: const TextStyle(fontSize: 13, color: Colors.white))
    //           ],
    //         ),
    //       ),
    //     ));
  }

  Widget _levelIndicator() {
    return LinearPercentIndicator(
      width: 250,
      animation: true,
      lineHeight: 16,
      animationDuration: 1500,
      percent: controller.pointsLevel$.isNotEmpty
          ? controller.pointsLevel$.first.discountPercentage!.toDouble() / 100
          : 0,
      barRadius: const Radius.circular(15),
      progressColor: controller.pointsLevel$.isNotEmpty
          ? controller.pointsLevel$.first.initialPoints! <= 100
              ? const Color(0xFF43578d)
              : controller.pointsLevel$[1].initialPoints! <= 500
                  ? Color(0xffffc600)
                  : Color.fromARGB(255, 0, 1, 4)
          : Colors.transparent,
    ).paddingSymmetric(vertical: 1, horizontal: 0);
  }

  Widget _coupons() {
    return SizedBox(
      width: 140,
      child: DottedBorder(
        color: Colors.white,
        strokeWidth: 0.5,
        dashPattern: const [4, 3],
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
        radius: const Radius.circular(50),
        borderType: BorderType.RRect,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          GestureDetector(
              onTap: () {
                Get.toNamed(RewardsRouting.COUPONS_ROUTE);
              },
              child: const Text('Mis Cupones',
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontFamily: 'NewYork'))),
          // const Spacer(),
          // GestureDetector(
          //     onTap: () {
          //       controller.toCoupons();
          //     },
          //     child: const Text(
          //       'Ver más',
          //       style: TextStyle(color: Colors.white, fontSize: 9),
          //     ))
        ]),
      ),
    );
  }

  Widget _menu(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70),
        child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.menuItems.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 25.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 1.6,
            ),
            itemBuilder: (context, index) =>
                _menuItem(context, controller.menuItems[index])));
  }

  Widget _menuItem(BuildContext context, Menu menuItem) {
    return GestureDetector(
        onTap: () => controller.toRoute(menuItem.route),
        child: Container(
            decoration: BoxDecoration(
              // color: const Color.fromARGB(255, 235, 235, 235),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  Icon(
                    menuItem.icon,
                    size: 18,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 15),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      menuItem.label,
                      style: const TextStyle(
                          fontSize: 8, color: Colors.white, letterSpacing: 1.0),
                    )
                  ]),
                  const Spacer(),
                ])));
  }
}
