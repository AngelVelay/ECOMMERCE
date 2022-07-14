import 'package:flutter/material.dart';

import 'timeline.dart';

class HomeDelivery extends StatelessWidget {
  const HomeDelivery({Key? key}) : super(key: key);
  // final CheckOutController checkOutController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [_totalBuyDelivery(context), const Timeline()],
      ),
    );
  }

  Widget _totalBuyDelivery(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Envio a Domicilio',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        const ListTile(
          trailing: Icon(
            Icons.location_on,
            color: Colors.black,
            size: 30,
          ),
          title: Text(
            'Enviado a:',
            style: TextStyle(color: Colors.black),
          ),
          subtitle: Text(
              'Calle de la Esperanza, Colonia Valle, C.P. 54700, Valle de Bravo, Tamaulipas'),
        ),
        const ListTile(
          trailing: Icon(Icons.credit_card, color: Colors.black, size: 30),
          title: Text(
            'Forma de Pago:',
            style: TextStyle(color: Colors.black),
          ),
          subtitle: Text('5625 2356 XXXX'),
        ),
        const Divider(thickness: 2),
        Column(
          children: const [
            ListTile(
              title: Text(
                'Cupon de descuento',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
              leading: Icon(
                Icons.card_giftcard_rounded,
                color: Colors.black,
              ),
              trailing: Text(
                ' -\$10.00',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ),
            ListTile(
              title: Text(
                'Total',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              trailing: Text(
                '\$ 100.00',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
