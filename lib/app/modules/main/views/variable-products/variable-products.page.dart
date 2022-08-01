import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../entities/product.type.dart';
import '../tab-home/components/cart-controls.widget.dart';
import '../tab-home/tab-home.controller.dart';
import 'variable-products.controller.dart';

class VariableProductsPage extends GetView<VariableProductsController> {
  VariableProductsPage({Key? key}) : super(key: key);

  final HomeController controllerHome = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Arma tu paquete'),
          backgroundColor: Color(0xff2222222),
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(child: _orderPack(controllerHome.productsPackList$)),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Column(
                      children: [
                        Text('Agrega productos al paquete',
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          height: 250,
                          child: Expanded(child: Obx(() {
                            return complemetsList();
                          })),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text('Agrega un complemento',
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          height: 250,
                          child: Expanded(
                              flex: 1,
                              child: Obx(() {
                                return complemetsList();
                              })),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _orderPack(item) {
    return Stack(children: [
      Center(child: Image.asset('assets/images/container.png')),
      Obx(() {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: item.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onDoubleTap: () => Badge(
                badgeColor: Colors.grey,
                badgeContent: const Icon(
                  Icons.remove,
                  color: Colors.black,
                  size: 20,
                ),
              ),
              child: Container(
                margin: EdgeInsets.all(30),
                child: Container(
                  width: 50,
                  height: 50,
                  child: Image.asset(item[index].url),
                ),
              ),
            );
          },
        );
      })
    ]);
  }

  Widget orderListComplements() {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: ((context, index) {
        return orderListItem(controllerHome.variableProductsList$[index]);
      }),
      itemCount: controllerHome.variableProductsList$.length,
    );
  }

  Widget orderListItem(Product item) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10)),
      width: 150,
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => controllerHome.toProductDetail(item),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(children: [
                  FadeInImage(
                    placeholder: const NetworkImage(
                        'https://acegif.com/wp-content/uploads/loading-11.gif'),
                    image: AssetImage(item.imageLink),
                    width: double.infinity,
                    height: 120,
                    fit: BoxFit.contain,
                  ),
                  const Align(
                      alignment: Alignment.bottomRight,
                      child: Icon(Icons.add_circle_rounded,
                          color: Colors.white, size: 30)),
                ])),
          ),
          Divider(
            color: Colors.white,
            thickness: 1,
          ),
          Text(item.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 20)),
          Text(
            '\$ ${item.price}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 10),
          ChipVariable(item)
        ],
      ),
    );
  }

  Widget complemetsList() {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: ((context, index) {
        return complemetsListItem(controllerHome.variableProductsList$[index]);
      }),
      itemCount: controllerHome.variableProductsList$.length,
    );
  }

  Widget complemetsListItem(Product item) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(10)),
        width: 120,
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            GestureDetector(
              // onTap: () => controllerHome.toProductDetail(item),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(children: [
                    FadeInImage(
                      placeholder: const NetworkImage(
                          'https://acegif.com/wp-content/uploads/loading-11.gif'),
                      image: AssetImage(item.imageLink),
                      width: double.infinity,
                      height: 80,
                      fit: BoxFit.contain,
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          icon: Icon(Icons.add_circle_rounded),
                          color: Colors.white,
                          iconSize: 30.0,
                          onPressed: () {
                            controllerHome.addProductToPack(item);
                            print(item.name);
                          },
                        )),
                  ])),
            ),
            const Divider(
              color: Colors.white,
              thickness: 1,
            ),
            Text(item.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 15)),
            Text(
              '\$ ${item.price}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 10),
            item.quantity?.values.isNotEmpty == true
                ? ChipVariable(item)
                : const Chip(
                    label: Text('1 Pieza'),
                    backgroundColor: Colors.white,
                  ),
          ],
        ));
  }

  Widget ChipVariable(Product item) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              for (var i = 0; i < item.quantity!.values.length; i++)
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Chip(
                    label: Text(
                      item.category?.name == 'refrescos'
                          ? '${item.quantity!.values.elementAt(i)} Litro'
                          : '${item.quantity!.values.elementAt(i)} gr',
                      style: const TextStyle(color: Colors.black),
                    ),
                    backgroundColor: Colors.white,
                  ),
                ),
            ],
          ),
        ));
  }
}
