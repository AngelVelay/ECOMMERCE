import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:jexpoints/app/modules/main/views/tab-home/tab-home.controller.dart';

class ShoppingCart extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Mi Carrito',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.black)),
            ),
            _cartProduct(controller),
            Padding(
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
                    Icons.monetization_on,
                    size: 20,
                  ),
                  onPressed: () => controller.toPayment(),
                  label: const Text('Pagar',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white)),
                ),
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}

Widget _cartProduct(HomeController controller) {
  return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: controller.productList$.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Container(
                  height: 80,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: FadeInImage(
                        placeholder: const NetworkImage(
                            'https://tenor.com/view/loading-gif-9212724.gif'),
                        image: NetworkImage(controller.productList$[index].url),
                      )),
                ),
                Expanded(
                    child: ListTile(
                  title: Text(
                    controller.productList$[index].name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$ ${controller.productList$[index].price}',
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '${controller.productList$[index].points} pts',
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.remove_circle_outline_outlined,
                              size: 25, color: Colors.black),
                          Text('1', style: TextStyle(fontSize: 25)),
                          Icon(Icons.add_circle_outline_outlined,
                              size: 25, color: Colors.black),
                        ],
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
        );
      });
}
