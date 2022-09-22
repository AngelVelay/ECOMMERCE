import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/cart/views/pay_page/pay.controller.dart';
import 'package:jexpoints/app/modules/home/views/tab-home/tab-home.controller.dart';

import 'package:jexpoints/app/modules/rewards/entities/payment-methods.type.dart';
import 'package:jexpoints/app/modules/rewards/views/coupons/coupons.controller.dart';

class addCreditCard extends GetView<PayController> {
  // @override
  // final AddCardController controller;

  // const addCreditCard(this.controller, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff2222222),
      child: SafeArea(
        left: false,
        right: false,
        bottom: true,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xff2222222),
              title: Text('Billetera',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold)),
            ),
            body: Column(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: _chooseMethodPayent(context),
                )),
              ],
            )),
      ),
    );
  }

  Widget _chooseMethodPayent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Metodos de pago',
            style: TextStyle(
                color: Colors.white,
                fontSize: 13.sp,
                fontWeight: FontWeight.bold)),
        Divider(
          color: Color(0xf2d2d2d2),
          thickness: 1,
        ),
        _chooseCreditCard(context),
        addMethodPay(),
        SizedBox(
          height: 30.h,
        ),
        _chooseCoupon(),
        SizedBox(
          height: 30.h,
        ),
        // _choosePromo()
      ],
    );
  }

  Widget _otherMethods(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Otros metodos',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold)),
        const Divider(
          color: Color(0xf2d2d2d2),
          thickness: 1,
        ),
        _chooseCreditCard(context)
      ],
    );
  }

  Widget addMethodPay() {
    return GestureDetector(
      onTap: () {
        Get.toNamed("/pay");
      },
      child: ListTile(
        leading: Icon(Icons.add, color: Colors.white, size: 30),
        title: Text('Agregar metodo de pago',
            style: TextStyle(
                color: Colors.white,
                fontSize: 13.sp,
                fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _chooseCreditCard(BuildContext context) {
    return SingleChildScrollView(child: Obx((() {
      return Container(
        width: double.infinity,
        child: Column(
          children: controller.creditCardList$.take(4).map((item) {
            return _creditCard(item, context);
          }).toList(),
        ),
      );
    })));
  }

  Widget _creditCard(PaymentMethods item, BuildContext context) {
    return RadioListTile<PaymentMethods>(
      controlAffinity: ListTileControlAffinity.trailing,
      value: item,
      groupValue: controller.selectedCreditCard.value,
      onChanged: (value) {
        controller.creditCardSelect(value as PaymentMethods, context);
      },
      activeColor: Colors.white,
      title: Row(
        children: [
          item.cardNumber.startsWith('5')
              ? Image.asset(
                  'assets/images/visa.png',
                  width: 50,
                  height: 50,
                )
              : item.cardNumber.startsWith('2')
                  ? Image.asset(
                      'assets/images/mastercard.png',
                      width: 50,
                      height: 50,
                    )
                  : Image.asset(
                      'assets/images/amex.png',
                      width: 50,
                      height: 50,
                    ),
          SizedBox(
            width: 15,
          ),
          Text('****  ${item.cardNumber.substring(15)}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

Widget couponsCount() {
  final controller = Get.find<HomeController>();
  return ListTile(
    leading: const Icon(Icons.local_activity_outlined,
        color: Colors.white, size: 30),
    title: Text('Cupones',
        style: TextStyle(
            color: Colors.white, fontSize: 13.sp, fontWeight: FontWeight.bold)),
    trailing: Text(controller.coupons$.length.toString(),
        style: TextStyle(
            color: Colors.white, fontSize: 13.sp, fontWeight: FontWeight.bold)),
  );
}

Widget _chooseCoupon() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Cupones',
          style: TextStyle(
              color: Colors.white,
              fontSize: 13.sp,
              fontWeight: FontWeight.bold)),
      const Divider(
        color: Color(0xf2d2d2d2),
        thickness: 1,
      ),
      _addCoupon()
    ],
  );
}

Widget _addCoupon() {
  return Column(
    children: [
      couponsCount(),
      ListTile(
        leading: Icon(Icons.add, color: Colors.white, size: 30),
        title: Text('Agregar codigo del cupon',
            style: TextStyle(
                color: Colors.white,
                fontSize: 13.sp,
                fontWeight: FontWeight.bold)),
      ),
    ],
  );
}

// Widget _choosePromo() {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text('Promociones',
//           style: TextStyle(
//               color: Colors.white,
//               fontSize: 13.sp,
//               fontWeight: FontWeight.bold)),
//       Divider(
//         color: Color(0xf2d2d2d2),
//         thickness: 1,
//       ),
//       _addPromo()
//     ],
//   );
// }

// Widget _addPromo() {
//   return ListTile(
//     leading: Icon(Icons.add, color: Colors.white, size: 30),
//     title: Text('Agregar codigo de la promocion',
//         style: TextStyle(
//             color: Colors.white, fontSize: 13.sp, fontWeight: FontWeight.bold)),
//   );
// }


//   Widget _creditCard(PaymentMethods item, BuildContext context) {
//     return Row(
//       children: [
//         Radio<PaymentMethods>(
//           value: item,
//           groupValue: controller.selectedCreditCard.value,
//           onChanged: (value) {
//             controller.creditCardSelect(value as PaymentMethods, context);
//           },
//         ),
//         SizedBox(
//           width: 5,
//         ),
//         _buildCreditCard(
//           // color: Color(StringToHex.toColor('${item.color}')),
//           color: Color(0xFF43578d),
//           cardExpiration: item.expirationDate,
//           cardHolder: item.fullName,
//           cardNumber: item.cardNumber,
//         ),
//       ],
//     );
//   }
// }

// Card _buildCreditCard(
//     {required Color color,
//     required cardNumber,
//     required cardHolder,
//     required cardExpiration}) {
//   return Card(
//     elevation: 4.0,
//     color: color,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(14),
//     ),
//     child: Container(
//       height: 150,
//       width: 300,
//       padding: const EdgeInsets.only(left: 16.0, right: 10.0, bottom: 22.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           _buildLogosBlock(),
//           Padding(
//             padding: const EdgeInsets.only(top: 5.0),
//             child: Text(
//               '$cardNumber',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 15,
//               ),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               _buildDetailsBlock(
//                 label: 'Nombre',
//                 value: cardHolder,
//               ),
//               _buildDetailsBlock(
//                   label: 'Fecha de Expiración', value: cardExpiration),
//             ],
//           ),
//         ],
//       ),
//     ),
//   );
// }

// // Build the top row containing logos
// Row _buildLogosBlock() {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: <Widget>[
//       Image.asset(
//         "assets/images/contact_less.png",
//         height: 20,
//         width: 18,
//       ),
//       Image.asset(
//         "assets/images/mastercard.png",
//         height: 40,
//         width: 40,
//       ),
//     ],
//   );
// }

// // Build Column containing the cardholder and expiration information
// Column _buildDetailsBlock({required String label, required String value}) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: <Widget>[
//       Text(
//         label,
//         style: TextStyle(
//             color: Colors.grey, fontSize: 9, fontWeight: FontWeight.bold),
//       ),
//       Text(
//         value,
//         style: TextStyle(
//             color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
//       )
//     ],
//   );
// }

// Column _anotherPayWay() {
//   return Column(
//     children: [
//       const Text(
//         'Tambien puedes pagar con :',
//         style: TextStyle(
//             color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
//       ),
//       const SizedBox(height: 10),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//               width: 60,
//               height: 60,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.white,
//                 ),
//                 onPressed: () {},
//                 child: const FadeInImage(
//                   image: NetworkImage(
//                       'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Apple_Pay_logo.svg/1200px-Apple_Pay_logo.svg.png'),
//                   placeholder: NetworkImage(
//                       'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Apple_Pay_logo.svg/1200px-Apple_Pay_logo.svg.png'),
//                 ),
//               )),
//           SizedBox(width: 60),
//           Container(
//               width: 60,
//               height: 60,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.white,
//                 ),
//                 onPressed: () {},
//                 child: const FadeInImage(
//                   fit: BoxFit.cover,
//                   image: NetworkImage(
//                       'https://s3.cointelegraph.com/storage/uploads/view/3278bdc14c74dd4e85732b776d0e5b1d.png'),
//                   placeholder: AssetImage('assets/images/face-id.png'),
//                 ),
//               )),
//         ],
//       ),
//     ],
//   );
// }

// Widget _buttonConfirm(context) {
//   final controller = Get.find<HomeController>();
//   return Padding(
//     padding: const EdgeInsets.all(20),
//     child: SizedBox(
//       height: 60,
//       width: MediaQuery.of(context).size.width,
//       child: CustomRoundedButton(
//         text: 'Confirmar Compra',
//         onPressed: () {
//           Get.toNamed(CartRouting.CHECKOUT_ROUTE, arguments: {
//             'total': controller.total$,
//             'cartProducts': controller.cartProducts$,
//             'selectedAddress': controller.selectedAddress$.value,
//             'defaultCoupon': controller.defaultCoupon$.value,
//             'selectedCreditCard': controller.selectedCreditCard$,
//           });
//         },
//       ),
//       // child: ElevatedButton.icon(
//       //   style: ButtonStyle(
//       //       backgroundColor: MaterialStateProperty.all<Color>(
//       //         Color(0xFF43578d),
//       //       ),
//       //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//       //           RoundedRectangleBorder(
//       //               borderRadius: BorderRadius.circular(18.0),
//       //               side: BorderSide(color: Colors.black)))),
//       //   icon: const Icon(
//       //     Icons.monetization_on,
//       //     size: 20,
//       //   ),
//       //   onPressed: () {
//       //     Get.toNamed('/confirm-compra');
//       //   },
//       //   label: const Text(' Confirmar Compra',
//       //       style: TextStyle(
//       //           fontWeight: FontWeight.bold,
//       //           fontSize: 20,
//       //           color: Colors.white)),
//       // ),
//     ),
//   );
// }

// Widget _addCreditCard() {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.end,
//     children: [
//       GestureDetector(
//         onTap: () {
//           Get.toNamed("/pay");
//         },
//         child: Container(
//           child: const Text(
//             'Agregar una tarjeta',
//             style: TextStyle(
//                 color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//         ),
//       ),
//       const SizedBox(width: 10),
//       const Icon(
//         Icons.arrow_forward_ios_sharp,
//         color: Colors.white,
//       ),
//     ],
//   );
// }

//  // return ListView.builder(
//               //   itemBuilder: (context, index) {
//               //     return Row(
//               //       children: [
//               //         Radio<CreditCard>(
//               //           value: controller.creditCardList$[index],
//               //           groupValue: controller.creditCardList$[index],
//               //           onChanged: (value) {
//               //             controller.selectedCreditCard(value as CreditCard);
//               //           },
//               //         ),
//               //         SizedBox(
//               //           width: 5,
//               //         ),
//               //         _buildCreditCard(
//               //             color: Color(StringToHex.toColor(
//               //                 '${controller.creditCardList$[index].color}')),
//               //             cardExpiration:
//               //                 "${controller.creditCardList$[index].cardExpiration}",
//               //             cardHolder:
//               //                 "${controller.creditCardList$[index].cardHolder}",
//               //             cardNumber:
//               //                 "${controller.creditCardList$[index].cardNumber}"),
//               //       ],
//               //     );
//               //   },
//               //   itemCount: controller.creditCardList$.length,
//               //   shrinkWrap: true,
//               //   physics: ClampingScrollPhysics(),
//               // );
