import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/home/components/draggable-button.dart';
import 'package:jexpoints/app/modules/home/views/tab-home/components/address-choose.widget.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:ticket_widget/ticket_widget.dart';

import '../../../../components/form-controls/custom-rounded-button.widget.dart';
import '../../../home/views/tab-home/tab-home.controller.dart';
import '../../../main/views/main/main.page.dart';
import '../../../rewards/views/consume/components/tracker.dart';
import '../../components/pickup-delivery.page.dart';
import 'checkout.controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckOutPage extends GetView<CheckOutController> {
  const CheckOutPage({Key? key}) : super(key: key);

  final String data =
      "Pastel de Chocolate comprado en la Esperanza Sucursal Valle";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff222222),
      child: SafeArea(
        bottom: false,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xff2222222),
              title: Text('Confirmar pedido',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold)),
            ),
            body: SingleChildScrollView(
                child: Column(
              children: const [
                OnChangeDeliveryType(),
              ],
            ))),
      ),
    );
  }
}

class OnChangeDeliveryType extends StatefulWidget {
  const OnChangeDeliveryType({Key? key}) : super(key: key);

  @override
  State<OnChangeDeliveryType> createState() => _OnChangeDeliveryTypeState();
}

class _OnChangeDeliveryTypeState extends State<OnChangeDeliveryType> {
  bool changeDeliveryType = false;
  String deliveryType = ' Envio a domicilio';
  bool isExpanded = false;
  final controller = Get.find<CheckOutController>();
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _addressWidget(),
        _changeDeliveryandMethodPay(),
        _buttonConfirm(context),
        _terms()
        // _buttonConfirmDelivery(context)
      ],
    );
  }

  Widget _addressWidget() {
    final HomeController controller = Get.find();

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

  Widget _changeDeliveryandMethodPay() {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(children: [
          changeDeliveryType
              ? onChangeExpansionTilePickup()
              : onChangeExpansionTileDelivery(),
          _paymentMethod(),
          SizedBox(height: 20.h),
          const Divider(
            color: Color(0xff2d2d2d2d2),
            thickness: 1,
          ),
        ]),
      ),
      _detailDelivery()
    ]);
  }

  Widget onChangeExpansionTileDelivery() {
    return ExpansionTile(
        title: const Text(
          'Entrega a Domicilio',
          style: TextStyle(color: Colors.white),
        ),
        trailing: TextButton(
            child: const Icon(
              Icons.more_vert_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return _alertDialog(context, controller);
                },
              );
              // setState(() {
              //   changeDeliveryType = !changeDeliveryType;
              // });
            }),
        children: [
          SizedBox(
            width: double.infinity,
            child: HomeAddressSelect(homeController),
          ),
        ]);
  }

  Widget onChangeExpansionTilePickup() {
    return ExpansionTile(
        trailing: IconButton(
            icon: const Icon(
              Icons.more_vert_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return _alertDialog(context, controller);
                },
              );
              // setState(() {
              //   changeDeliveryType = !changeDeliveryType;
              // });
            }),
        title: const Text(
          'Recoger en Sucursal cerca de CP:14200',
          style: TextStyle(color: Colors.white),
        ),
        children: const [
          SizedBox(
            width: double.infinity,
            child: PickUpPage(),
          ),
        ]);
  }

  Widget _paymentMethod() {
    return Column(children: [
      ListTile(
          title: const Text('Forma de Pago',
              style: TextStyle(color: Colors.white)),
          subtitle: Row(
            children: [
              Text(
                  controller.selectedCreditCard$.isEmpty
                      ? 'Elige un metodo de pago'
                      : controller.selectedCreditCard$.value.first.cardNumber,
                  style: const TextStyle(color: Colors.white)),
              const SizedBox(width: 10),
              Image.asset('assets/images/mastercard.png', height: 30)
            ],
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.more_vert_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              Get.toNamed('/add-credit-card');
            },
          )),
    ]);
  }

  Widget _detailDelivery() {
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
                ' - \$${controller.coupons.amount}',
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
                ' - \$${controller.coupons.amount}',
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
                '\$ ${controller.total - controller.coupons.amount}',
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _alertDialog(context, controller) {
    final controller = Get.find<CheckOutController>();
    return AlertDialog(
      backgroundColor: Color(0xff222222),
      title: const Text(
        'Deseas cambiar la forma de envio?',
        style: TextStyle(color: Colors.white),
      ),
      content: Text(
          '¿Esta seguro de cambiar a ${changeDeliveryType ? 'Entregar en Domicilio' : 'Recoger en sucursal'}?',
          style: const TextStyle(color: Colors.white)),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancelar', style: TextStyle(color: Colors.red)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: const Text('Aceptar', style: TextStyle(color: Colors.blue)),
          onPressed: () {
            setState(() {
              changeDeliveryType = !changeDeliveryType;
            });
            Navigator.pop(context);
            // controller.adreesTap(context);
          },
        ),
      ],
    );
  }

  Widget _buttonConfirmDelivery(context) {
    final controller = Get.find<CheckOutController>();

    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
            height: 60,
            width: MediaQuery.of(context).size.width,
            child: CustomRoundedButton(
                text: 'Confirmar Compra',
                onPressed: () {
                  !changeDeliveryType
                      ? controller.changeMetodPickup()
                      : controller.changeMethodDelivery();

                  // controller.toPickup();
                })));
  }

  Widget _buttonConfirm(context) {
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
                    !changeDeliveryType
                        ? controller.changeMetodPickup()
                        : controller.changeMethodDelivery();
                  },
                  child: Text(
                    'Confirmar Compra',
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
}

Widget _terms() {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Card(
      color: Color(0xff222222),
      child: Text(
          'Al confirmar la compra acepta nuestros términos y condiciones dentro de la app ESPERANZA. Para soluciones y y/ocnsultas favor de comunicarse a contacto2@esperanza.mx',
          style: TextStyle(
            color: Colors.white,
            fontSize: 10.sp,
          ),
          textAlign: TextAlign.center),
    ),
  );
}
// Padding(
//   padding: const EdgeInsets.all(10.0),
//   child: Card(
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(15.0),
//     ),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         ListTile(
//           title: changeDeliveryType
//               ? onChangeExpansionTilePickup()
//               : onChangeExpansionTileDelivery(),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15.0),
//           child: ListTile(
//             trailing: TextButton(
//                 child: const Icon(
//                   Icons.add_card_rounded,
//                   size: 40,
//                   color: Colors.black,
//                 ),
//                 onPressed: () {
//                   Get.toNamed('/add-credit-card');
//                 }

//                 // controller.adreesTap(context);
//                 ),
//             title: const Text(
//               'Forma de Pago:',
//               style: TextStyle(color: Colors.black),
//             ),
//             subtitle: Text('5468 5684 5865 XXXX'),
//           ),
//         ),
//         const Divider(thickness: 2),
//         _detailDelivery(),
//         Center(
//           child: Column(
//             children: const [
//               // const Timeline(),
//               // _buttonConfirmDelivery(context),
//             ],
//           ),
//         )
//       ],
//     ),
//   ),
// ),
