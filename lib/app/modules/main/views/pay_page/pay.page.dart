import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:jexpoints/app/modules/main/views/pay_page/pay.controller.dart';
import 'package:jexpoints/app/components/custom_input/custom_input.dart';

class PayPage extends GetView<PayController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: false,
      right: false,
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            controller.card$.value.id == 0
                ? 'Agregar metodo de pago'
                : 'Datos de tarjeta',
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        body: SingleChildScrollView(
          child: Obx((() {
            return Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 10),
                  _buildCreditCard(),
                  const SizedBox(
                    height: 20,
                  ),
                  _formCreditCard(context),
                ],
              ),
            );
          })),
        ),
      ),
    );
  }

// Build the credit card widget
  Card _buildCreditCard() {
    return Card(
      elevation: 4.0,
      color: const Color(0xFF000000),
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
                controller.cardNumber$.value,
                style: const TextStyle(
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
                  value: controller.cardHolder$.value,
                ),
                _buildDetailsBlock(
                    label: 'Numero de Expiración',
                    value: controller.cardExpiration$.value)
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
          label,
          style: const TextStyle(
              color: Colors.grey, fontSize: 9, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: const TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget _formCreditCard(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            CustomInputField(
              maxLength: 16,
              inputFormatter:
                  FilteringTextInputFormatter.allow(RegExp(r'[A-Z,a-z," "]')),
              controller: controller.cardHolder,
              keyboardType: TextInputType.text,
              labelText: 'Nombre del titular',
              prefixIcon: Icons.person_outline_outlined,
            ),
            SizedBox(height: 10),
            CustomInputField(
              inputFormatter: controller.cardNUmberFormatter,
              controller: controller.cardNumber,
              keyboardType: TextInputType.number,
              labelText: 'Numero de tarjeta',
              prefixIcon: Icons.credit_card,
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: CustomInputField(
                    inputFormatter: controller.cardExpirationFormatter,
                    controller: controller.cardExpiration,
                    keyboardType: TextInputType.datetime,
                    labelText: 'Vencimiento',
                    prefixIcon: Icons.date_range,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: CustomInputField(
                    inputFormatter: controller.cardCVVFormatter,
                    controller: controller.cardCVV,
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
                  onPressed: () => controller.save(context),
                  label: Text(
                      controller.card$.value.id == 0
                          ? 'Agregar Tarjeta'
                          : 'Guardar datos',
                      style: const TextStyle(
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
