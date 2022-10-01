import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/cart/components/apply-coupon.page.dart';
import 'package:jexpoints/app/modules/rewards/rewards.module.dart';
import 'package:jexpoints/app/modules/rewards/views/coupons/coupons.page.dart';

import '../../../home/views/tab-home/components/cart-controls.widget.dart';
import '../../../home/views/tab-home/tab-home.controller.dart';
import '../../../main/entities/product.type.dart';

class ShoppingCartPage extends StatelessWidget {
  ShoppingCartPage({Key? key}) : super(key: key);
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff2222222),
        title: Text(
          'Mi carrito',
          style: TextStyle(
              color: Colors.white,
              fontSize: 13.sp,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold),
        ).paddingSymmetric(horizontal: 10),
        actions: [
          Obx((() {
            return TextButton(
                onPressed: () {
                  controller.toogleDelete$.value =
                      !controller.toogleDelete$.value;
                },
                child: controller.toogleDelete$.value
                    ? const Text(
                        'Cancelar',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold),
                      )
                    : const Text(
                        'Eliminar',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold),
                      ));
          })).paddingSymmetric(horizontal: 10),
        ],
      ),
      body: controller.cartProducts$.isNotEmpty
          ? Column(children: [
              Expanded(
                  flex: 2,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _addressWidget(),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: _cartProductList(
                            context,
                            controller,
                          ),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                  child: Column(
                children: [applyCouponButton(), buttonTotalToogle(context)],
                // children: [applyCouponButton(), buttonTotalToogle(context)],
              )) // _button()
            ])
          : SizedBox(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.remove_shopping_cart_outlined,
                      color: Colors.grey,
                      size: 100,
                    ),
                    Text(
                      "No hay productos en el carrito",
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
      // ApplyCoupon()
    ));
  }

  Widget _addressWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.location_on, color: Colors.white, size: 30),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  '${controller.selectedAddress$.value.street} ${controller.selectedAddress$.value.outsideNumber} ${controller.selectedAddress$.value.town} ${controller.selectedAddress$.value.zipcode}  ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold)),
              Text(
                  'Cerca de ${controller.selectedAddress$.value.streetNotes} ${controller.selectedAddress$.value.suburb}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }

  Widget _cartProductList(BuildContext context, controller) {
    return controller.cartProducts$.length > 0
        ? SizedBox(child: Obx(() {
            return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: controller.cartProducts$.length,
                itemBuilder: (BuildContext context, int index) {
                  return _cartProductListItem(controller.cartProducts$[index]);
                });
          }))
        : SizedBox(
            height: MediaQuery.of(context).size.height / 1.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.remove_shopping_cart_outlined,
                  color: Colors.grey,
                  size: 100,
                ),
                Text(
                  "No hay productos en el carrito",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ],
            ),
          );
  }

  Widget _cartProductListItem(Product item) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            SizedBox(
              height: 78,
              width: 78,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: FadeInImage(
                    fit: BoxFit.cover,
                    placeholder: const NetworkImage(
                        'https://acegif.com/wp-content/uploads/loading-11.gif'),
                    image: NetworkImage(item.imageLink),
                  )),
            ),
            Expanded(
                child: ListTile(
              title: Text(
                item.name,
                style: const TextStyle(
                    fontSize: 10,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '\$ ${item.price}',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '${item.points} pts',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )),
            Obx(() {
              return controller.toogleDelete$.value
                  ? IconButton(
                      onPressed: () {
                        controller.deleteCartItems(item);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ))
                  : SizedBox(
                      width: 80,
                      child: HomeCartControls(
                        item,
                        labelColor: Colors.white,
                        altColor: Colors.black,
                      ));
            })
          ],
        ),
      ),
    );
  }

  Widget applyCouponButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, left: 20, top: 30),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextButton(
                  onPressed: () {
                    Get.toNamed(RewardsRouting.COUPONS_ROUTE);
                  },
                  child: Text(
                    'Codigo de Descuento',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.sp,
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

  Widget buttonTotalToogle(context) {
    return Obx((() {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 100.0),
                child: Divider(
                  color: Color(0xff2D2D2D),
                  thickness: 3,
                ),
              ),
              TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      builder: (context) => Container(
                        color: Color(0xff222222),
                        height: MediaQuery.of(context).copyWith().size.height *
                            0.37,
                        child: Column(
                          children: [
                            Container(
                              child: _detailTotal(controller),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    title: Text(
                      'SUBTOTAL',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      '\$ ${controller.subtotalBuy()}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            ],
          ),
        ),
      );
    }));
  }
}

Widget _detailTotal(HomeController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
    child: Card(
      color: const Color(0xff222222),
      child: Column(
        children: [
          ListTile(
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            title: Text(
              'SUBTOTAL',
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            ),
            trailing: Text(
              ' \$${controller.subtotalBuy()}',
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          ListTile(
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            title: Text(
              'DESCUENTO',
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            ),
            trailing: Text(
              ' - \$${controller.couponDiscount()}',
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.red),
            ),
          ),
          ListTile(
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            title: Text(
              'ENVIO',
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            ),
            trailing: Text(
              '\$ 50.00',
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          ListTile(
            title: Text(
              'TOTAL',
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            trailing: Text(
              '\$ ${controller.subtotalBuy()}',
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          continueButton(controller)
        ],
      ),
    ),
  );
}

Widget continueButton(controller) {
  return Padding(
    padding: const EdgeInsets.only(right: 20.0, left: 20),
    child: Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextButton(
                onPressed: () {
                  controller.toSuggestions();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Continuar',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.sp,
                        fontFamily: 'Montserrat',
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                )),
          ),
        ],
      ),
    ),
  );
}
