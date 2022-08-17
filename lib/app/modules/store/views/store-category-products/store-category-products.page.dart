import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/circle_icon_button/circle_icon_button.dart';
import 'package:jexpoints/app/modules/home/views/tab-home/tab-home.controller.dart';

import '../../../home/views/tab-home/components/cart-controls.widget.dart';
import '../../../main/entities/product.type.dart';
import 'store-category-products.controller.dart';

class StoreCategoryProductsPage
    extends GetView<StoreCategoryProductsController> {
  var category = Get.arguments['category'];
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        left: false,
        right: false,
        child: GetBuilder<StoreCategoryProductsController>(
          builder: (value) => Scaffold(
              appBar: AppBar(
                title: Text(controller.category.name),
              ),
              body: SingleChildScrollView(
                child: Column(children: <Widget>[
                  const SizedBox(height: 20),
                  _searchInput(context),
                  const SizedBox(height: 20),
                  _productList(context, category),
                ]),
              )),
        ));
  }

  Widget _searchInput(BuildContext context) {
    return Center(
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          width: MediaQuery.of(context).size.width - 50,
          height: 50,
          child: TextField(
            controller: controller.keywordCtrl,
            // onEditingComplete: () => controller.search(context),
            onEditingComplete: () {},
            // autofocus: true,
            cursorColor: Colors.black,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
                hintText: "Buscar producto",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    width: 2,
                    color: Colors.black,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    width: 2,
                    color: Colors.black,
                  ),
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                suffixIcon: const Icon(Icons.food_bank, color: Colors.black)),
          )),
    );
  }

  // List
  Widget _productList(BuildContext context, category) {
    return SingleChildScrollView(
      child: Obx(() {
        return controller.findedProducts$.isEmpty
            ? SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.no_food_outlined,
                      size: 100,
                      color: Colors.white,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "No hay productos en Stock",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              )
            : GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.findedProducts$.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) =>
                    _productItem(context, homeController.productList$[index]));
      }),
    );
  }

  Widget _productItem(BuildContext context, Product item) {
    return Container(
      width: 130,
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => controller.toProductDetail(item),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(children: [
                  FadeInImage(
                    placeholder: const NetworkImage(
                        'https://acegif.com/wp-content/uploads/loading-11.gif'),
                    image: NetworkImage(item.imageLink),
                    width: double.infinity,
                    height: 115,
                    fit: BoxFit.cover,
                  ),
                ])),
          ),
          const SizedBox(height: 3),
          Text(
            item.name,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            softWrap: false,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            '\$ ${item.price}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6,
          ),
          HomeCartControls(item,
              key: ValueKey(item.id),
              altColor: Colors.black,
              labelColor: Colors.white),

          // Row(children: [
          //   (item.cartValue! > 0)
          //       ? CircleIconButton(
          //           iconData: Icons.remove,
          //           onPressed: () => homeController.deleteCart(item),
          //           size: 15,
          //           foregroundColor: Colors.black,
          //         )
          //       : Container(),
          //   const Spacer(),
          //   (item.cartValue! > 0)
          //       ? Text(
          //           '${item.cartValue.obs}',
          //           style: TextStyle(
          //             color: Colors.white,
          //             fontSize: 15,
          //           ),
          //         )
          //       : Container(),
          //   const Spacer(),
          //   CircleIconButton(
          //     iconData: Icons.add,
          //     onPressed: () => homeController.addCart(item, context),
          //     size: 15,
          //     foregroundColor: Colors.black,
          //   ),
          // ])
        ],
      ),
    );
  }
}
