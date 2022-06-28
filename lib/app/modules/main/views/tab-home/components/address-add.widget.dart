import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/custom_input/custom_input.dart';
import 'package:jexpoints/app/modules/main/views/tab-home/tab-home.controller.dart';

class HomeAddressAdd extends GetView<HomeController> {
  @override
  final HomeController controller;

  const HomeAddressAdd(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      color: Color(0xff2222222),
      child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const CustomInputField(
                    keyboardType: TextInputType.text,
                    labelText: 'Calle y Numero',
                    prefixIcon: Icons.place_rounded,
                  ),
                  const SizedBox(height: 10),
                  const CustomInputField(
                    keyboardType: TextInputType.text,
                    labelText: 'Alcaldia',
                    prefixIcon: Icons.business,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Expanded(
                        child: CustomInputField(
                          keyboardType: TextInputType.datetime,
                          labelText: 'CP',
                          prefixIcon: Icons.numbers,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CustomInputField(
                          keyboardType: TextInputType.number,
                          labelText: 'Referencias',
                          prefixIcon: Icons.account_balance_outlined,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFF43578d),
                        ),
                        shape: MaterialStateProperty
                            .all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: const BorderSide(color: Colors.black)))),
                    icon: const Icon(
                      Icons.location_on,
                      size: 20,
                    ),
                    onPressed: () {},
                    label: const Text('Guardar dirección',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white)),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
