import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jexpoints/app/components/circle_icon_button/circle_icon_button.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../../components/circular-progress-bar/circular-progress-bar.dart';
import '../../../home/views/tab-home/components/user-number-card.dart';
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
          Obx(() {
            return _header();
          }),
          const SizedBox(height: 20),
          const userCardNumber(),
          const SizedBox(height: 20),
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
              radius: 40, // Image radius
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
            fontWeight: FontWeight.bold,
            fontSize: 16,
            letterSpacing: 1.5,
            color: Colors.white));
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
        const SizedBox(width: 10),
        Text('${controller.user$.value.membership?.points} pts',
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Colors.white)),
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
    return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: LinearPercentIndicator(
          width: 280,
          animation: true,
          lineHeight: 20,
          animationDuration: 2000,
          percent: 0.8,
          // center: const Text("Nivel Oro",
          //     style: TextStyle(
          //         fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),
          barRadius: const Radius.circular(15),
          progressColor: Colors.grey[600],
          // trailing: Column(
          //   children: const [
          //     Text(
          //       '43 pts',
          //       style: TextStyle(fontSize: 10, color: Colors.white),
          //     ),
          //     Text(
          //       'Platino',
          //       style: TextStyle(fontSize: 10, color: Colors.white),
          //     )
          //   ],
          // ),
        ).paddingSymmetric(vertical: 1, horizontal: 0));
  }

  Widget _menu(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.menuItems.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 1.7,
            ),
            itemBuilder: (context, index) =>
                _menuItem(context, controller.menuItems[index])));
  }

  Widget _menuItem(BuildContext context, Menu menuItem) {
    return GestureDetector(
        onTap: () => controller.toRoute(menuItem.route),
        child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 235, 235, 235),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  Icon(
                    menuItem.icon,
                    size: 28,
                  ),
                  const SizedBox(height: 5),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      menuItem.label,
                      style: const TextStyle(fontSize: 13),
                    )
                  ]),
                  const Spacer(),
                ])));
  }

  // Widget _reviewList(BuildContext context) {
  //   return Obx(() {
  //     return SingleChildScrollView(
  //         child: ListView.builder(
  //             // separatorBuilder: (context, index) => const Divider(thickness: 2),
  //             physics: const NeverScrollableScrollPhysics(),
  //             shrinkWrap: true,
  //             scrollDirection: Axis.vertical,
  //             itemCount: controller.reviews$.length,
  //             itemBuilder: (context, index) {
  //               return _reviewListItem(context, controller.reviews$[index]);
  //             }));
  //   });
  // }

  // Widget _reviewListItem(BuildContext context, Review item) {
  //   return Padding(
  //     padding: const EdgeInsets.all(20),
  //     child: DottedBorder(
  //         color: Colors.white,
  //         strokeWidth: 1,
  //         dashPattern: const [15, 10],
  //         radius: const Radius.circular(10),
  //         borderType: BorderType.RRect,
  //         child: Padding(
  //             padding: const EdgeInsets.all(15),
  //             child: Column(children: [
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: [
  //                   Row(
  //                     children: [
  //                       Text(
  //                         item.name,
  //                         overflow: TextOverflow.ellipsis,
  //                         style: const TextStyle(
  //                             color: Colors.white, fontSize: 20),
  //                       ),
  //                     ],
  //                   )
  //                 ],
  //               ),
  //               const SizedBox(
  //                 height: 20,
  //               ),
  //               Row(children: [
  //                 ClipRRect(
  //                     borderRadius: BorderRadius.circular(5),
  //                     child: Image(
  //                       image: NetworkImage(item.productURL),
  //                       width: 100,
  //                       height: 100,
  //                     )),
  //                 const SizedBox(
  //                   width: 15,
  //                 ),
  //                 Flexible(
  //                     child: Text(
  //                   '"${item.comment}"',
  //                   style: const TextStyle(
  //                       color: Colors.white70, fontStyle: FontStyle.italic),
  //                   maxLines: 6,
  //                   overflow: TextOverflow.ellipsis,
  //                 ))
  //               ]),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   RatingBar.builder(
  //                     initialRating: item.rating,
  //                     minRating: 1,
  //                     direction: Axis.horizontal,
  //                     allowHalfRating: true,
  //                     itemCount: 5,
  //                     itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
  //                     itemBuilder: (context, _) => const Icon(
  //                       Icons.star,
  //                       color: Colors.amber,
  //                     ),
  //                     onRatingUpdate: (rating) {
  //                       print(rating);
  //                     },
  //                   )
  //                 ],
  //               )
  //             ]))),
  //   );
  // }

}
