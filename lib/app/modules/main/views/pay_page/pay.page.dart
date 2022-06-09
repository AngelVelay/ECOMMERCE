import 'package:flutter/material.dart';

import '../../../../components/custom_input/custom_input.dart';

class PayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff2222222),
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff2222222),
            title: Text('Agregar metodo de pago'),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildTitleSection(
                      title: "Agregar metodo de pago",
                      subTitle: "Como desea pagar?"),
                  _buildCreditCard(
                      color: Color(0xFF000000),
                      cardExpiration: "05/2024",
                      cardHolder: "ANGEL VELAY",
                      cardNumber: "9874 4785 XXXX 6548"),
                  TextFieldCreditCard()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Build the title section
  Column _buildTitleSection({@required title, @required subTitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 16.0),
          child: Text(
            '$title',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 16.0),
          child: Text(
            '$subTitle',
            style: TextStyle(fontSize: 21, color: Colors.black45),
          ),
        )
      ],
    );
  }

  // Build the credit card widget
  Card _buildCreditCard(
      {required Color color,
      required String cardNumber,
      required String cardHolder,
      required String cardExpiration}) {
    return Card(
      elevation: 4.0,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Container(
        height: 200,
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildLogosBlock(),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                '$cardNumber',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildDetailsBlock(
                  label: 'Nombre',
                  value: cardHolder,
                ),
                _buildDetailsBlock(
                    label: 'Numero de Expiración', value: cardExpiration),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Build the top row containing logos
  Row _buildLogosBlock() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Image.asset(
          "assets/images/contact_less.png",
          height: 20,
          width: 18,
        ),
        Image.asset(
          "assets/images/mastercard.png",
          height: 50,
          width: 50,
        ),
      ],
    );
  }

// Build Column containing the cardholder and expiration information
  Column _buildDetailsBlock({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '$label',
          style: TextStyle(
              color: Colors.grey, fontSize: 9, fontWeight: FontWeight.bold),
        ),
        Text(
          '$value',
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class TextFieldCreditCard extends StatelessWidget {
  const TextFieldCreditCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            CustomInputField(
              keyboardType: TextInputType.text,
              labelText: 'Nombre del titular',
              prefixIcon: Icons.person_outline_outlined,
            ),
            SizedBox(height: 10),
            SizedBox(height: 10),
            CustomInputField(
              keyboardType: TextInputType.number,
              labelText: 'Numero de tarjeta',
              prefixIcon: Icons.credit_card,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: CustomInputField(
                    keyboardType: TextInputType.datetime,
                    labelText: 'Fecha de vencimiento',
                    prefixIcon: Icons.date_range,
                  ),
                ),
                Expanded(
                  child: CustomInputField(
                    keyboardType: TextInputType.number,
                    labelText: 'CVV',
                    prefixIcon: Icons.credit_score_rounded,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFF43578d),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.black)))),
                  icon: const Icon(
                    Icons.monetization_on,
                    size: 20,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/add-credit-card');
                  },
                  label: const Text('Agregar Tarjeta',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
