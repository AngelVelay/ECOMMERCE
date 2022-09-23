import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/circle_icon_button/circle_icon_button.dart';
import 'package:jexpoints/app/modules/home/views/tab-home/tab-home.controller.dart';

import '../../../home/views/tab-home/components/cart-controls.widget.dart';
import '../../../main/entities/product.type.dart';
import '../../components/store-cart-controlls.widget.dart';
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
                title: Text(
                  controller.category.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold),
                ),
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
            onEditingComplete: () => controller.search(context),
            // onEditingComplete: () {},
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
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
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
                    childAspectRatio: 0.9,
                  ),
                  itemBuilder: (context, index) => _productItem(
                      context,
                      controller.findedProducts$.isNotEmpty
                          ? controller.findedProducts$[index]
                          : Product(
                              id: '',
                              name: '',
                              description: '',
                              price: 0,
                              category: category,
                              cartValue: 0,
                              categoryId: '',
                              imageFileId: '',
                              imageLink: '',
                              isActive: false,
                              points: 0,
                              topRate: 0,
                            )),
                );
        }),
      ),
    );
  }

  Widget _productItem(BuildContext context, Product item) {
    return item.isActive == true
        ? Container(
            width: 130,
            height: 190,
            margin: const EdgeInsets.symmetric(horizontal: 5),
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
                        Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                                onTap: () {},
                                child: const Icon(
                                  Icons.favorite_border,
                                  size: 20,
                                ))).paddingAll(5)
                      ])),
                ),
                Text(item.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Montserrat-Bold')),
                Text(
                  '\$ ${item.price}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 15,
                      fontFamily: 'Montserrat-Bold',
                      color: Colors.white),
                ),
                HomeCartControls(item)
              ],
            ),
          )
        : Container();
  }
}
