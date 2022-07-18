import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:ticket_widget/ticket_widget.dart';
import '../../../entities/order.type.dart';

class OrderDetailPickup extends StatelessWidget {
  const OrderDetailPickup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: TicketWidget(
        width: 150.0,
        height: 150.0,
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
                        'Numero de Pedido', '4568538', 'Fecha', '24-12-2022'),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, right: 15.0),
                      child: ticketDetailsWidget(
                          'Descuento', '200', 'Cupon', '66BDFDC'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, right: 40.0),
                      child: ticketDetailsWidget(
                          'Total a Pagar', '100', 'Puntos', '21'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Expanded(
                      child: QrImage(
                    data: 'blablablabla',
                    gapless: true,
                    size: 150,
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

  Widget _title() {
    return Container();
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
