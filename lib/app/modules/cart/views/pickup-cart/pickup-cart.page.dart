import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../home/views/tab-home/tab-home.controller.dart';
import '../../../main/entities/product.type.dart';
import '../checkout/map_pickup/ubications.page.dart';

class PickupPage extends GetView<HomeController> {
  const PickupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Recoger en Sucursal'),
          ),
          body: Column(
            children: [_MapPickup(), _listPickup(context), _totalBuy(context)],
          )),
    );
  }

  Widget _MapPickup() {
    return const Expanded(
      flex: 2,
      child: MapPickupPage(),
    );
  }

  Widget _listPickup(BuildContext context) {
    final size = MediaQuery.of(context).size.height * 0.85;

    return Expanded(
      child: Container(
          height: size - 350,
          child: Obx(() {
            return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: controller.cartProducts$.length,
                itemBuilder: (BuildContext context, int index) {
                  return _pickUpListItem(
                      controller.cartProducts$[index], context);
                });
          })),
    );
  }

  Widget _pickUpListItem(Product item, context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FadeInImage(
                    placeholder: const NetworkImage(
                        'https://tenor.com/view/loading-gif-9212724.gif'),
                    image: NetworkImage(item.imageLink),
                  )),
            ),
            Expanded(
              child: ListTile(
                title: Text(
                  item.name,
                  style: Theme.of(context).textTheme.headline5,
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '\$ ${item.price}',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '${item.points} pts',
                      style: Theme.of(context).textTheme.headline5,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
                width: 80,
                child: Text(
                  '${item.cartValue} X \$${item.price}',
                  style: Theme.of(context).textTheme.headline5,
                ))
          ],
        ),
      ),
    );
  }

  Widget _totalBuy(context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total: ',
            style: Theme.of(context).textTheme.headline2,
          ),
          Text(
            '\$ ${controller.subtotal$}',
            style: Theme.of(context).textTheme.headline2,
          ),
        ],
      ),
    );
  }
}
