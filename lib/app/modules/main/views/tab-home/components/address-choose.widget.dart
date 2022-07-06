import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/core/utils/sheet.utils.dart';

import '../../../entities/address.type.dart';
import '../../map-add-address/map-add-address.page.dart';
import '../tab-home.controller.dart';
import 'address-add.widget.dart';

class HomeAddressSelect extends GetView<HomeController> {
  @override
  final HomeController controller;

  const HomeAddressSelect(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_list(context), _button(context)],
      ),
    );
  }

  Widget _list(BuildContext context) {
    return Column(
      children: controller.addressList$.map((a) {
        return _listItem(a, context);
      }).toList(),
    );
  }

  Widget _listItem(Address item, BuildContext context) {
    return Row(children: [
      Radio<Address>(
        value: item,
        groupValue: controller.selectedAddress$.value,
        onChanged: (value) {
          controller.addressSelect(value as Address, context);
        },
      ),
      const SizedBox(width: 10),
      Text('${item.street} No.${item.outsideNumber}, CP. ${item.zipCode}'),
    ]);
  }

  Widget _button(BuildContext context) {
    return Container(
      height: 50,
      child: ElevatedButton.icon(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              const Color(0xFF43578d),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.black)))),
        icon: const Icon(Icons.location_on),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddAdressPage();
          }));
          // SheetUtils.show(context, HomeAddressAdd(controller),
          //     title: 'Agregar Domicilio');
        },
        label: const Text('Agrega una nueva dirección'),
      ),
    );
  }
}
