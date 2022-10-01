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
            }),
      );
    });
  }

  Widget _item(BuildContext context, Product item) {
    return GestureDetector(
        onTap: () {
          controller.toProductDetail(item);
        },
        child: item.isActive == true
            ? Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Colors.white),
                child: Column(children: [
                  Stack(
                    children: [
                      Container(
                          height: 120.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(15.0),
                                  topRight: Radius.circular(15.0)),
                              image: DecorationImage(
                                  image: NetworkImage(item.imageLink),
                                  fit: BoxFit.cover))),
                      Obx((() {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                  onTap: () {
                                    controller.addFavorite(item);
                                    Get.snackbar(
                                      'Producto agregado a favoritos',
                                      item.name,
                                      colorText: Colors.white,
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor:
                                          Colors.black.withOpacity(0.5),
                                      duration: Duration(seconds: 2),
                                    );
                                  },
                                  child: controller.likedProducts$
                                          .where((element) =>
                                              element.id == item.id)
                                          .isNotEmpty
                                      ? GestureDetector(
                                          onTap: (() =>
                                              controller.deleteFavorite(item)),
                                          child: const Icon(Icons.favorite,
                                              color: Colors.red),
                                        )
                                      : GestureDetector(
                                          onTap: () =>
                                              controller.addFavorite(item),
                                          child: const Icon(
                                            Icons.favorite_border,
                                          ),
                                        ))),
                        );
                      })),
                    ],
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    width: double.infinity,
                    child: Text(
                      item.name,
                      style: const TextStyle(
                          color: Color(0xFF575E67),
                          fontFamily: 'Varela',
                          fontSize: 14.0),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text('\$${item.price}',
                      style: const TextStyle(
                          color: Color(0xFFCC8053),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  const Divider(
                    color: Colors.grey,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.addCart(item, context);
                      Get.snackbar(
                        'Producto agregado al carrito',
                        item.name,
                        colorText: Colors.white,
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.black.withOpacity(0.5),
                        duration: Duration(seconds: 2),
                      );
                    },
                    child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(Icons.shopping_basket,
                                  color: Color(0xFFD17E50), size: 12.0),
                              Text('Agregar al carrito',
                                  style: TextStyle(
                                      fontFamily: 'Monsterrat',
                                      color: Color(0xFFD17E50),
                                      fontSize: 12.0))
                            ])),
                  )
                ]))
            : Container());
  }
}

//   Widget _list(BuildContext context) {
//     return Obx(() {
//       return Expanded(
//           child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: controller.productsImpulseList$.length,
//               itemBuilder: (_, int index) {
//                 return _item(
//                     context, controller.productsImpulseList$[index].product);
//               }));
//     });
//   }

//   Widget _item(BuildContext context, Product item) {
//     return item.isActive == true
//         ? Container(
//             width: 130,
//             height: 190,
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
//                           height: 130,
//                           fit: BoxFit.cover,
//                         ),
//                         Obx((() {
//                           return Align(
//                               alignment: Alignment.topRight,
//                               child: GestureDetector(
//                                   onTap: () {
//                                     controller.addFavorite(item);
//                                   },
//                                   child: controller.likedProducts$
//                                           .where((element) =>
//                                               element.id == item.id)
//                                           .isNotEmpty
//                                       ? const Icon(Icons.favorite,
//                                           color: Colors.red)
//                                       : const Icon(
//                                           Icons.favorite_border,
//                                         )));
//                         })).paddingAll(5)
//                       ])),
//                 ),
//                 Text(item.name,
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     textAlign: TextAlign.center,
//                     style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 15,
//                         fontFamily: 'Montserrat-Bold')),
//                 Text(
//                   '\$ ${item.price}',
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                       fontSize: 15,
//                       fontFamily: 'Montserrat-Bold',
//                       color: Colors.white),
//                 ),
//                 HomeCartControls(item)
//               ],
//             ),
//           )
//         : Container();
//   }
// }
