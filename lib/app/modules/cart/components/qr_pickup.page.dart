import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:ticket_widget/ticket_widget.dart';

import '../../../components/form-controls/custom-rounded-button.widget.dart';
import '../views/checkout/checkout.controller.dart';

class QrPickUp extends GetView<CheckOutController> {
  const QrPickUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Recoger en Sucursal'),
          ),
          body: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
            child: Container(
              child: Center(child: _buttonConfirmTakeAway(context, controller)),
            ),
          )),
    );
  }
}

Widget _buttonConfirmTakeAway(context, controller) {
  final String data =
      "Pastel de Chocolate comprado en la Esperanza Sucursal Valle";
  return Column(
    children: [
      Center(
        child: TicketWidget(
          width: 350.0,
          height: 450.0,
          isCornerRounded: true,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 120.0,
                      height: 25.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(width: 1.0, color: Colors.green),
                      ),
                      child: const Center(
                        child: Text(
                          'Sucursal',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ),
                    Row(
                      children: const <Widget>[
                        Text(
                          'Esperanza',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Icon(
                            Icons.location_on,
                            color: Colors.pink,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    'Ticket de Compra',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Column(
                    children: <Widget>[
                      ticketDetailsWidget(
                          'Numero de Pedido',
                          '${controller.numeroPedido}',
                          'Fecha',
                          '${controller.date}'),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0, right: 15.0),
                        child: ticketDetailsWidget('Descuento',
                            '${controller.coupons}', 'Cupon', '66BDFDC'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0, right: 40.0),
                        child: ticketDetailsWidget('Total a Pagar',
                            '${controller.total}', 'Puntos', '30'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Expanded(
                        child: QrImage(
                      data: controller.data,
                      gapless: true,
                      size: 150.0,
                      errorCorrectionLevel: QrErrorCorrectLevel.H,
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: CustomRoundedButton(
            text: 'Recoger Pedido',
            onPressed: () {
              controller.toPickup();
            },
            // child: ElevatedButton.icon(
            //   style: ButtonStyle(
            //       backgroundColor: MaterialStateProperty.all<Color>(
            //         const Color(0xFF43578d),
            //       ),
            //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            //           RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(18.0),
            //               side: const BorderSide(color: Colors.black)))),
            //   icon: const Icon(
            //     Icons.check,
            //     size: 20,
            //   ),
            //   onPressed: () {
            //     controller.toPickup();
            //   },
            //   label: const Text('Recoger Pedido',
            //       style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //           fontSize: 20,
            //           color: Colors.white)),
            // ),
          ),
        ),
      )
    ],
  );
}

Widget ticketDetailsWidget(String firstTitle, String firstDesc,
    String secondTitle, String secondDesc) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              firstTitle,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                firstDesc,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              secondTitle,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                secondDesc,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      )
    ],
  );
}
