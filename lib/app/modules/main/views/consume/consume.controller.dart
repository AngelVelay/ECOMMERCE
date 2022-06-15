import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:jexpoints/app/modules/main/entities/my-shopping.type.dart';
import 'package:jexpoints/app/modules/main/services/shopping/shopping.contract.dart';
import 'package:jexpoints/app/modules/main/views/checkout/checkout.page.dart';
import 'package:jexpoints/app/modules/main/views/consume/consume.page.dart';

import '../../../../components/map_ubication/map_ubication.dart';
import 'components/timeline.dart';

class ConsumeController extends GetxController {
  final IShoppingService shoppingService;

  late var shoppingList$ = <MyShopping>[].obs;

  ConsumeController(this.shoppingService);

  @override
  void onInit() async {
    super.onInit();
    shoppingList$.value = await shoppingService.get();
  }

  consumeTapMap(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (context) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Text(
                    'Sucursal Colonia del Valle',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Calle Colonia del Valle #123',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.48,
                    child: const MapFlutter(),
                  ),
                ],
              ),
            ));
  }

  consumeTapDeliveryInfo(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (context) => Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  const Text(
                    'Envio a domicilio',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.48,
                      child: _totalBuyDelivery(context)),
                ],
              ),
            ));
  }

  Widget _totalBuyDelivery(context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Pedido enviado a :',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Text(
              'Calle Alamo 123 C.P 14200',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Divider(thickness: 2),
            Column(
              children: [
                Text(
                  'Metodo de pago :',
                  style: TextStyle(fontSize: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(
                        width: 50,
                        height: 50,
                        image: NetworkImage(
                            'https://cdn-icons-png.flaticon.com/512/349/349221.png')),
                    Text('5555 0235 XXXX XXXX',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ],
                ),
              ],
            ),
            Divider(thickness: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Subtotal',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
                Text(
                  '\$480',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Envio',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
                Text(
                  '\$50',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Cupon de Descuento',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
                Text(
                  ' - \$50',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ],
            ),
            Divider(
              color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Total a Pagar',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  '\$480',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
            Timeline()
          ],
        ));
  }

  void selectedDeliveryType(MyShopping item, BuildContext context) {
    if (item.deliveryType == DeliveryType.envioADomicilio) {
      consumeTapDeliveryInfo(context);
    } else {
      consumeTapMap(context);
    }
  }
}
