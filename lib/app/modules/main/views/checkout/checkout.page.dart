import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jexpoints/app/modules/main/views/consume/components/timeline.dart';
import 'package:jexpoints/app/modules/main/views/tab-home/tab-home.page.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:ticket_widget/ticket_widget.dart';

import '../main/main.page.dart';
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
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: const Color(0xff2222222),
                title: const Text('Confirmar pedido'),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: _tabBar(context),
              )),
        ),
      ),
    );
  }

  Widget _tabBar(context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(25.0)),
            child: TabBar(
              indicator: BoxDecoration(
                  color: const Color(0xff2222222),
                  borderRadius: BorderRadius.circular(25.0)),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              tabs: const [
                 Tab(
                  text: 'Envio a Domicilio',
                ),
                 Tab(
                  text: 'Recoger en Sucursal',
                ),
              ],
            ),
          ),
        ),
        Expanded(
            child: TabBarView(
          children: [
            Expanded(
              child: Center(
                child: _totalBuyDelivery(context),
              ),
            ),
            Expanded(child: Center(child: _buttonConfirmTakeAway(context))),
          ],
        ))
      ],
    );
  }

  Widget _totalBuyDelivery(context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Envio a Domicilio',
                style:  TextStyle(fontSize: 20),
              ),
            ),
            ListTile(
              trailing: TextButton(
                child: const Icon(
                  Icons.change_circle,
                  color: Colors.black,
                  size: 40,
                ),
                onPressed: () {
                  controller.adreesTap(context);
                },
              ),
              title: const Text(
                'Enviar a:',
                style: TextStyle(color: Colors.black),
              ),
              subtitle: Text(
                  '${controller.selectedAddress.street} #${controller.selectedAddress.number} CP:${controller.selectedAddress.zipcode} '),
            ),
            const ListTile(
              trailing:  Icon(Icons.credit_score_sharp),
              title:  Text(
                'Forma de Pago:',
                style: TextStyle(color: Colors.black),
              ),
              subtitle:  Text('5625 2356 XXXX'),
            ),
            const Divider(thickness: 2),
            Column(
              children: [
                ListTile(
                  title: const Text(
                    'Cupon de descuento',
                    style:  TextStyle(
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
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                ),
                const ListTile(
                  title: Text(
                    'Envio',
                    style:  TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                  leading:  Icon(
                    Icons.local_shipping,
                    color: Colors.black,
                  ),
                  trailing:  Text(
                    '\$ 50.00',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Total',
                    style:  TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  trailing: Text(
                    '\$ ${controller.total - controller.coupons.amount}',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            Center(
              child: Column(
                children: [
                  const Timeline(),
                  _buttonConfirmDelivery(context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _totalBuyTakeAway(context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Recoger en Sucursal',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const ListTile(
              trailing:  Icon(Icons.location_on),
              title:  Text(
                'Enviar a:',
                style: TextStyle(color: Colors.black),
              ),
              subtitle:  Text('Calle falsa 123'),
            ),
            const ListTile(
              trailing:  Icon(Icons.credit_score_sharp),
              title:  Text(
                'Forma de Pago:',
                style:  TextStyle(color: Colors.black),
              ),
              subtitle:  Text('Calle falsa 123'),
            ),
            const Divider(thickness: 2),
            Column(
              children: [
                Builder(
                  builder: (context) {
                    return const ListTile(
                      title:  Text(
                        'Total',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      leading:  Icon(
                        Icons.attach_money,
                        color: Colors.black,
                      ),
                      trailing:  Text(
                        '\$ 100.00',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    );
                  }
                ),
                const ListTile(
                  title: Text(
                    'Envio',
                    style:  TextStyle(
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
                    style:  TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const Timeline(),
                _buttonConfirmDelivery(context),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buttonConfirmDelivery(context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton.icon(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                const Color(0xFF43578d),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: Colors.black)))),
          icon: const Icon(
            Icons.check,
            size: 20,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => _gifConfirm(),
              ),
            );
          },
          label: const Text('Enviar Pedido',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white)),
        ),
      ),
    );
  }

  Widget _buttonConfirmTakeAway(context) {
    final String data =
        "Pastel de Chocolate comprado en la Esperanza Sucursal Valle";
    return Center(
      child: TicketWidget(
        width: 350.0,
        height: 500.0,
        isCornerRounded: true,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
                        style: const TextStyle(color: Colors.green),
                      ),
                    ),
                  ),
                  Row(
                    children: const <Widget>[
                       Text(
                        'Esperanza',
                        style:  TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                       Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child:  Icon(
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
                child:  Text(
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
                        'Numero de Pedido', '4568538', 'Fecha', '24-12-2022'),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, right: 15.0),
                      child: ticketDetailsWidget(
                          'Descuento', '\$200', 'Cupon', '66BDFDC'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, right: 40.0),
                      child: ticketDetailsWidget(
                          'Total a Pagar', '\$100', 'Puntos', '21'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Expanded(
                      child: QrImage(
                    data: data,
                    gapless: true,
                    size: 200,
                    errorCorrectionLevel: QrErrorCorrectLevel.H,
                  )),
                ),
              )
            ],
          ),
        ),
      ),
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
}
// return Padding(
//   padding: const EdgeInsets.all(20.0),
//   child: SizedBox(
//     height: 60,
//     width: MediaQuery.of(context).size.width,
//     child: ElevatedButton.icon(
//       style: ButtonStyle(
//           backgroundColor: MaterialStateProperty.all<Color>(
//             const Color(0xFF43578d),
//           ),
//           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//               RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(18.0),
//                   side: const BorderSide(color: Colors.black)))),
//       icon: const Icon(
//         Icons.place,
//         size: 20,
//       ),
//       onPressed: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => UbicationsPage(),
//           ),
//         );
//       },
//       label: const Text('Ver Sucursales',
//           style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 20,
//               color: Colors.white)),
//     ),
//   ),
// );

Widget _gifConfirm() {
  return Center(
      child: AnimatedSplashScreen(
          splashIconSize: 500,
          duration: 3000,
          splash: Container(
            height: 600,
            child: Column(
              children: const [
                Expanded(
                  child: FadeInImage(
                      height: 600,
                      width: 600,
                      fit: BoxFit.cover,
                      placeholder: AssetImage('assets/images/delivery.gif'),
                      image: AssetImage('assets/images/delivery.gif')),
                ),
                Text('Tu pedido esta en camino...',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          // nextScreen: const HomePage(),
          nextScreen:  const MainPage(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: const Color(0xFFffffff)));
}
// 