import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/home/entities/address.type.dart';
import 'package:jexpoints/app/modules/home/views/tab-home/tab-home.controller.dart';
import 'package:jexpoints/app/modules/store/views/tab-shopping-cart/tab-shoppin-cart.page.dart';

import '../../../main/entities/address.type.dart';
import 'interested-products/interested-products.page.dart';
import 'products-for-you/products-for-you.page.dart';

class SuggestionsPage extends GetView<HomeController> {
  const SuggestionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: Text('Sugerencias',
              style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600)),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Badge(
                  animationType: BadgeAnimationType.fade,
                  badgeColor: Colors.black,
                  badgeContent: Text(
                    '${controller.cartItems$}',
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  child: Icon(Icons.shopping_cart),
                ),
                onPressed: () {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShoppingCartPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            addressChangecard(controller),
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    ProductsForYou(),
                    InterestedProducts(),
                  ],
                ),
              ),
            ),
            _coupons(controller),
            applyCouponButton(controller)
          ],
        ),
      );
    }));
  }
}

Widget addressChangecard(HomeController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: _deliveryAddress(controller)),
        const SizedBox(width: 10),
        Expanded(child: _deliveryTime(controller))
      ],
    ),
  );
}

Widget _deliveryAddress(HomeController controller) {
  return Container(
    height: 50,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Entregar ahora',
            style: TextStyle(
                fontSize: 11.sp,
                color: Colors.white,
                fontWeight: FontWeight.w300)),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  // border: Border.all(color: Colors.grey.shade300),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                      size: 20,
                    ),
                    dropdownColor: Colors.black,
                    isExpanded: true,
                    value: controller.selectedAddress$.value,
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                    items: controller.addressList$
                        .map((e) => DropdownMenuItem(
                              child: Text(e.street,
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis)),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (value) {
                      controller.selectedAddress$.value = value as UserAddress;
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _deliveryTime(HomeController controller) {
  return Row(
    children: [
      Expanded(
        child: Container(
          height: 30,
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(30),
          ),
          child: DropdownButtonHideUnderline(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: DropdownButton(
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                  size: 20,
                ),
                dropdownColor: Colors.black,
                isExpanded: true,
                value: controller.selectedAddress$.value,
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                items: controller.addressList$
                    .map((e) => DropdownMenuItem(
                          child: Text(e.street),
                          value: e,
                        ))
                    .toList(),
                onChanged: (value) {
                  controller.selectedAddress$.value = value as UserAddress;
                },
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _coupons(HomeController controller) {
  return Obx(() {
    return controller.defaultCoupon$.value.id != 0
        ? DottedBorder(
            color: Colors.white,
            strokeWidth: 1,
            dashPattern: const [5, 3],
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            radius: const Radius.circular(50),
            borderType: BorderType.RRect,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              GestureDetector(
                  // onTap: () => controller.toCouponDetail(),
                  onTap: () => controller.toCoupons(),
                  child: Text(controller.defaultCoupon$.value.shortDescription,
                      style:
                          const TextStyle(fontSize: 13, color: Colors.white))),
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
          ).paddingOnly(left: 35, right: 35, bottom: 10)
        : Container();
  });
}

Widget applyCouponButton(controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 10),
    child: Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(30))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextButton(
                onPressed: () {
                  controller.toCheckout();
                },
                child: Text(
                  'Proceder al pago',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontFamily: 'Montserrat',
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                )),
          ),
        ],
      ),
    ),
  );
}

// Widget _button(controller) {
//   return Padding(
//     padding: const EdgeInsets.all(20.0),
//     child: Container(
//         width: double.infinity,
//         child: CustomRoundedButton(
//           text: 'Proceder a pagar',
//           onPressed: () {
//             controller.toCheckout();
//           },
//         )),
//   );
// }
