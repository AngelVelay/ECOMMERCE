import 'package:flutter/material.dart';
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
            Expanded(flex: 1, child: _orderPack()),
            Expanded(
                flex: 1,
                child: Obx(() {
                  return orderListComplements();
                })),
            Container(
              height: 200,
              child: Expanded(
                  flex: 1,
                  child: Obx(() {
                    return complemetsList();
                  })),
            ),
          ],
        ),
      ),
    );
  }

  Widget _orderPack() {
    return Stack(
      children: [Image.asset('assets/images/container.png')],
    );
  }

  Widget orderListComplements() {
    return ListView.builder(
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
                        'https://tenor.com/view/loading-gif-9212724.gif'),
                    image: AssetImage(item.url),
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
          ChipVariable()
        ],
      ),
    );
  }

  Widget complemetsList() {
    return ListView.builder(
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
            onTap: () => controllerHome.toProductDetail(item),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(children: [
                  FadeInImage(
                    placeholder: const NetworkImage(
                        'https://tenor.com/view/loading-gif-9212724.gif'),
                    image: AssetImage(item.url),
                    width: double.infinity,
                    height: 80,
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
              style: const TextStyle(color: Colors.white, fontSize: 15)),
          Text(
            '\$ ${item.price}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 10),
          ChipVariable()
        ],
      ),
    );
  }

  Widget ChipVariable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Chip(
            labelPadding: EdgeInsets.all(2.0),
            avatar: CircleAvatar(
              backgroundColor: Colors.white70,
              child: Text(
                '1',
                style: TextStyle(color: Colors.black),
              ),
            ),
            label: Text(
              'Variable',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.blue,
            elevation: 6.0,
            shadowColor: Colors.grey[60],
            padding: EdgeInsets.all(8.0),
          ),
          SizedBox(
            width: 5,
          ),
          Chip(
            labelPadding: EdgeInsets.all(2.0),
            avatar: CircleAvatar(
              backgroundColor: Colors.white70,
              child: Text(
                '1',
                style: TextStyle(color: Colors.black),
              ),
            ),
            label: Text(
              'Variable',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.blue,
            elevation: 6.0,
            shadowColor: Colors.grey[60],
            padding: EdgeInsets.all(8.0),
          ),
        ],
      ),
    );
  }
}
