import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
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
            title: const Text('Confirmar pedido'),
          ),
          body: const Center(
              child: SingleChildScrollView(child: OnChangeDeliveryType())),
        ),
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
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ListTile(
                  title: changeDeliveryType
                      ? onChangeExpansionTilePickup()
                      : onChangeExpansionTileDelivery(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: ListTile(
                    trailing: TextButton(
                        child: const Icon(
                          Icons.add_card_rounded,
                          size: 40,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Get.toNamed('/add-credit-card');
                        }

                        // controller.adreesTap(context);
                        ),
                    title: const Text(
                      'Forma de Pago:',
                      style: TextStyle(color: Colors.black),
                    ),
                    subtitle: Text('5468 5684 5865 XXXX'),
                  ),
                ),
                const Divider(thickness: 2),
                _detailDelivery(),
                Center(
                  child: Column(
                    children: const [
                      // const Timeline(),
                      // _buttonConfirmDelivery(context),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        _buttonConfirmDelivery(context)
      ],
    );
  }

  Widget onChangeExpansionTileDelivery() {
    return ExpansionTile(
        trailing: TextButton(
            child: const Icon(
              Icons.change_circle_outlined,
              size: 40,
              color: Colors.black,
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
          'Entregar en Domicilio',
          style: TextStyle(color: Colors.black),
        ),
        children: [
          SizedBox(
            width: double.infinity,
            child: HomeAddressSelect(homeController),
          ),
        ]);
  }

  Widget onChangeExpansionTilePickup() {
    return ExpansionTile(
        trailing: TextButton(
            child: const Icon(
              Icons.change_circle_outlined,
              size: 40,
              color: Colors.black,
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
          style: TextStyle(color: Colors.black),
        ),
        children: const [
          SizedBox(
            width: double.infinity,
            child: PickUpPage(),
          ),
        ]);
  }

  Widget _detailDelivery() {
    return Column(
      children: [
        ListTile(
          title: const Text(
            'Cupon de descuento',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.black),
          ),
          leading: const Icon(
            Icons.card_giftcard_rounded,
            color: Colors.black,
          ),
          trailing: Text(
            ' - \$${controller.coupons.amount}',
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
          ),
        ),
        const ListTile(
          title: Text(
            'Envio',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.black),
          ),
          leading: Icon(
            Icons.local_shipping,
            color: Colors.black,
          ),
          trailing: Text(
            '\$ 50.00',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
          ),
        ),
        ListTile(
          title: const Text(
            'Total',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          trailing: Text(
            '\$ ${controller.total - controller.coupons.amount}',
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ],
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
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
            height: 60,
            width: MediaQuery.of(context).size.width,
            child: CustomRoundedButton(
                text: 'Confirmar Compra',
                onPressed: () {
                  controller.toPickup();
                })));
  }
}
