// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:jexpoints/app/modules/home/views/tab-home/components/cart-controls.widget.dart';
// import '../../../../main/entities/product.type.dart';
// import '../tab-home.controller.dart';

// class HomeTopProducts extends GetView<HomeController> {
//   const HomeTopProducts({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       height: 290,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           _header(),
//           const SizedBox(height: 10),
//           _listWidget(context),
//         ],
//       ).paddingOnly(left: 10),
//     );
//   }

//   Widget _header() {
//     return SizedBox(
//       width: double.infinity,
//       child: Padding(
//           padding:
//               const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Image.asset(
//                 'assets/images/top_semanal.png',
//                 height: 35,
//                 fit: BoxFit.cover,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text('Top ',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           fontFamily: 'Montserrat-Regular',
//                           fontSize: 15.sp,
//                           color: Colors.white)),
//                   Text('Semanal',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           fontFamily: 'NewYork',
//                           fontSize: 15.sp,
//                           color: Colors.white)),
//                 ],
//               ),
//               const SizedBox(height: 10),
//             ],
//           )),
//     );
//   }

//   Widget _listWidget(BuildContext context) {
//     return Obx(() {
//       return Expanded(
//         child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: controller.productsImpulseList$.length,
//             itemBuilder: (_, int index) {
//               return _itemWidget(
//                   context, controller.productsImpulseList$[index].product);
//             }),
//       );
//     });
//   }

//   Widget _itemWidget(BuildContext context, Product item) {
//     double itemSize = 130;
//     return item.isActive == true
//         ? Container(
//             width: itemSize,
//             height: itemSize,
//             margin: const EdgeInsets.symmetric(horizontal: 5),
//             child: Column(
//               children: [
//                 GestureDetector(
//                   onTap: () => controller.toProductDetail(item),
//                   child: ClipRRect(
//                       borderRadius: BorderRadius.circular(10),
//                       child: Stack(children: [
//                         FadeInImage(
//                           placeholder: const NetworkImage(
//                               'https://acegif.com/wp-content/uploads/loading-11.gif'),
//                           image: NetworkImage(item.imageLink),
//                           width: double.infinity,
//                           height: itemSize,
//                           fit: BoxFit.cover,
//                         ),
//                         Align(
//                                 alignment: Alignment.topRight,
//                                 child: GestureDetector(
//                                     onTap: () {},
//                                     child:
//                                         Icon(Icons.favorite_border, size: 20)))
//                             .paddingAll(5),
//                       ])),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 Text(item.name,
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 1,
//                     softWrap: false,
//                     textAlign: TextAlign.center,
//                     style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 13,
//                         fontFamily: 'Montserrat-Regular')),
//                 Text(
//                   '\$ ${item.price}0' /*TODO: FORMAT EN HARDCODE: CAMBIAR*/,
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                       fontSize: 13,
//                       fontFamily: 'Montserrat-Bold',
//                       color: Colors.white),
//                 ),
//                 HomeCartControls(item),
//               ],
//             ),
//           )
//         : Container();
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/circle_icon_button/circle_icon_button.dart';
import 'package:jexpoints/app/modules/home/views/tab-home/components/cart-controls.widget.dart';
import 'package:jexpoints/app/modules/home/views/tab-home/tab-home.controller.dart';
import 'package:jexpoints/app/modules/main/entities/product.type.dart';

class HomeTopProducts extends GetView<HomeController> {
  const HomeTopProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 285,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _header(),
          const SizedBox(height: 10),
          _list(context),
        ],
      ),
    );
  }

  Widget _header() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/top_semanal.png',
                height: 35,
                fit: BoxFit.cover,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('Top  ',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15.sp, color: Colors.white)),
                Text('Semanal',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'NewYork',
                        fontSize: 15.sp,
                        color: Colors.white)),
              ]),
              const SizedBox(height: 10),
            ],
          )),
    );
  }

  Widget _list(BuildContext context) {
    return Obx(() {
      return Expanded(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.productsImpulseList$.length,
              itemBuilder: (_, int index) {
                return _item(
                    context, controller.productsImpulseList$[index].product);
              }));
    });
  }

  Widget _item(BuildContext context, Product item) {
    return item.isActive == true
        ? Container(
            width: 130,
            height: 190,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => controller.toProductDetail(item),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Stack(children: [
                        FadeInImage(
                          placeholder: const NetworkImage(
                              'https://acegif.com/wp-content/uploads/loading-11.gif'),
                          image: NetworkImage(item.imageLink),
                          width: double.infinity,
                          height: 130,
                          fit: BoxFit.cover,
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                                onTap: () {},
                                child: const Icon(
                                  Icons.favorite,
                                  size: 20,
                                  color: Colors.pinkAccent,
                                ))).paddingAll(5)
                      ])),
                ),
                Text(item.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Montserrat-Bold')),
                Text(
                  '\$ ${item.price}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 15,
                      fontFamily: 'Montserrat-Bold',
                      color: Colors.white),
                ),
                HomeCartControls(item)
              ],
            ),
          )
        : Container();
  }
}
