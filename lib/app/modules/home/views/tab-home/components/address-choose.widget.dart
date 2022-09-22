import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/button/custom_button_transparent.dart';
import 'package:jexpoints/app/modules/cart/views/map-add-address/map-add-address.page.dart';
import 'package:jexpoints/app/modules/home/entities/address.type.dart';
import '../../../../../components/form-controls/custom-rounded-button.widget.dart';
import '../../../../main/entities/address.type.dart';
import '../tab-home.controller.dart';

class HomeAddressSelect extends GetView<HomeController> {
  @override
  final HomeController controller;

  const HomeAddressSelect(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Color(0xff2222222),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'Selecciona un domicilio',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.sp,
                ),
              ),
            ),
            const Divider(
              color: Colors.white,
              height: 2,
            ),
            _list(context),
            ButtonTransparent(
              text: 'Agregar Dirección',
              paddingHorizontal: 20,
              paddingVertical: 10,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AddAdressPage();
                }));
              },
            )
          ],
        ),
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

  Widget _listItem(UserAddress item, BuildContext context) {
    return Obx((() {
      return Row(children: [
        Radio<UserAddress>(
          value: item,
          groupValue: controller.selectedAddress$.value,
          onChanged: (value) {
            controller.addressSelect(value as UserAddress, context);
            // Navigator.of(context, rootNavigator: true).pop();
          },
        ),
        const SizedBox(width: 10),
        Text('${item.street} No.${item.outsideNumber}, CP. ${item.zipcode}',
            style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold)),
      ]);
    }));
  }

  Widget _button(BuildContext context) {
    return Container(
        height: 60,
        child: CustomRoundedButton(
          text: 'Agrega una nueva dirección',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AddAdressPage();
            }));
          },
        ));
  }
}
