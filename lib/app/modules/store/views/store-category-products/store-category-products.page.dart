import 'package:flutter/gestures.dart';
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
    return Scaffold(
        appBar: AppBar(
          title: Text(
            controller.category.name,
            style: TextStyle(
                color: Colors.white,
                fontSize: 13.sp,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(children: [
          _searchInput(context, controller),
          Expanded(
            child: _productList(context, category),
          ),
        ]));
  }

  Widget _productList(BuildContext context, category) {
    return Obx(() {
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
          : ListView(
              children: [
                SizedBox(height: 15.0),
                Container(
                    padding: EdgeInsets.only(right: 15.0),
                    width: MediaQuery.of(context).size.width - 30.0,
                    height: MediaQuery.of(context).size.height - 50.0,
                    child: GridView.builder(
                      padding: EdgeInsets.all(5),
                      shrinkWrap: true,
                      itemCount: controller.findedProducts$.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 0.0,
                        mainAxisSpacing: 15.0,
                        childAspectRatio: 0.8,
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
                                  cartValue: 0.obs,
                                  categoryId: '',
                                  imageFileId: '',
                                  imageLink: '',
                                  isActive: false,
                                  points: 0,
                                  topRate: 0,
                                )),
//                 );
                    )),
              ],
            );
    });
  }

  Widget _productItem(BuildContext context, Product item) {
    return item.isActive == true
        ? Padding(
            padding: EdgeInsets.all(5),
            child: InkWell(
                onTap: () {
                  controller.toProductDetail(item);
                },
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 3.0,
                              blurRadius: 5.0)
                        ],
                        color: Colors.white),
                    child: Column(children: [
                      Stack(
                        children: [
                          Container(
                              height: 120.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(15.0),
                                      topRight: Radius.circular(15.0)),
                                  image: DecorationImage(
                                      image: NetworkImage(item.imageLink),
                                      fit: BoxFit.cover))),
                          Obx((() {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                      onTap: () {
                                        homeController.addFavorite(item);
                                        Get.snackbar(
                                          'Producto agregado a favoritos',
                                          item.name,
                                          colorText: Colors.white,
                                          snackPosition: SnackPosition.BOTTOM,
                                          backgroundColor:
                                              Colors.black.withOpacity(0.5),
                                          duration: Duration(seconds: 2),
                                        );
                                      },
                                      child: homeController.likedProducts$
                                              .where((element) =>
                                                  element.id == item.id)
                                              .isNotEmpty
                                          ? const Icon(Icons.favorite,
                                              color: Colors.red)
                                          : const Icon(
                                              Icons.favorite_border,
                                            ))),
                            );
                          })),
                        ],
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        width: double.infinity,
                        child: Text(
                          item.name,
                          style: const TextStyle(
                              color: Color(0xFF575E67),
                              fontFamily: 'Varela',
                              fontSize: 14.0),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text('\$${item.price}',
                          style: const TextStyle(
                              color: Color(0xFFCC8053),
                              fontFamily: 'Varela',
                              fontSize: 14.0)),
                      Divider(
                        color: Colors.grey,
                      ),
                      GestureDetector(
                        onTap: () {
                          homeController.addCart(item, context);
                          Get.snackbar(
                            'Producto agregado al carrito',
                            item.name,
                            colorText: Colors.white,
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.black.withOpacity(0.5),
                            duration: Duration(seconds: 2),
                          );
                        },
                        child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Icon(Icons.shopping_basket,
                                      color: Color(0xFFD17E50), size: 12.0),
                                  Text('Agregar al carrito',
                                      style: TextStyle(
                                          fontFamily: 'Monsterrat',
                                          color: Color(0xFFD17E50),
                                          fontSize: 12.0))
                                ])),
                      )
                    ]))),
          )
        : Container();
  }
}

Widget _searchInput(BuildContext context, controller) {
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
            suffixIcon: TextButton.icon(
                onPressed: () {
                  controller.keywordCtrl.clear();
                  controller.search(context);
                },
                icon: Icon(Icons.cancel),
                label: Text('')))),
  ));
}
// List
//   Widget _productList(BuildContext context, category) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: SingleChildScrollView(
//         child: Obx(() {
//           return controller.findedProducts$.isEmpty
//               ? SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.7,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const [
//                       Icon(
//                         Icons.no_food_outlined,
//                         size: 100,
//                         color: Colors.white,
//                       ),
//                       SizedBox(height: 10),
//                       Text(
//                         "No hay productos en Stock",
//                         style: TextStyle(fontSize: 20, color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 )
//               : GridView.builder(
//                   physics: const NeverScrollableScrollPhysics(),
//                   shrinkWrap: true,
//                   itemCount: controller.findedProducts$.length,
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     mainAxisSpacing: 12.0,
//                     crossAxisSpacing: 10.0,
//                     childAspectRatio: 0.9,
//                   ),
//                   itemBuilder: (context, index) => _productItem(
//                       context,
//                       controller.findedProducts$.isNotEmpty
//                           ? controller.findedProducts$[index]
//                           : Product(
//                               id: '',
//                               name: '',
//                               description: '',
//                               price: 0,
//                               category: category,
//                               cartValue: 0.obs,
//                               categoryId: '',
//                               imageFileId: '',
//                               imageLink: '',
//                               isActive: false,
//                               points: 0,
//                               topRate: 0,
//                             )),
//                 );
//         }),
//       ),
//     );
//   }

//   Widget _productItem(BuildContext context, Product item) {
//     return item.isActive == true
//         ? Container(
//             width: 130,
//             height: 190,
//             margin: const EdgeInsets.symmetric(horizontal: 5),
//             child: Column(
//               children: [
//                 GestureDetector(
//                     onTap: () => controller.toProductDetail(item),
//                     child: ClipRRect(
//                         borderRadius: BorderRadius.circular(10),
//                         child: Stack(children: [
//                           FadeInImage(
//                             placeholder: const NetworkImage(
//                                 'https://acegif.com/wp-content/uploads/loading-11.gif'),
//                             image: NetworkImage(item.imageLink),
//                             width: double.infinity,
//                             height: 115,
//                             fit: BoxFit.cover,
//                           ),
//                           Obx((() {
//                             return Align(
//                                 alignment: Alignment.topRight,
//                                 child: GestureDetector(
//                                     onTap: () {
//                                       homeController.addFavorite(item);
//                                     },
//                                     child: homeController.likedProducts$
//                                             .where((element) =>
//                                                 element.id == item.id)
//                                             .isNotEmpty
//                                         ? const Icon(Icons.favorite,
//                                             color: Colors.red)
//                                         : const Icon(
//                                             Icons.favorite_border,
//                                           )));
//                           }))
//                         ]))),
//                 Text(item.name,
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     textAlign: TextAlign.center,
//                     style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 15,
//                         fontFamily: 'Montserrat-Bold')),
//                 Text(
//                   '\$ ${item.price}',
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                       fontSize: 15,
//                       fontFamily: 'Montserrat-Bold',
//                       color: Colors.white),
//                 ),
//                 HomeCartControls(item)
//               ],
//             ),
//           )
//         : Container();
//   }
// }

// SafeArea(
//         left: false,
//         right: false,
//         child: GetBuilder<StoreCategoryProductsController>(
//           builder: (value) => Scaffold(
//               appBar: AppBar(
//                 title: Text(
//                   controller.category.name,
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 13.sp,
//                       fontFamily: 'Montserrat',
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//               body: SingleChildScrollView(
//                 child: Column(children: <Widget>[
//                   const SizedBox(height: 20),
//                   _searchInput(context),
//                   const SizedBox(height: 20),
//                   _productList(context, category),
//                 ]),
//               )),
//         ));

// Widget _searchInput(BuildContext context) {
  //   return Center(
  //       child: Container(
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(20),
  //     ),
  //     width: MediaQuery.of(context).size.width - 50,
  //     height: 50,
  //     child: TextField(
  //         controller: controller.keywordCtrl,
  //         onEditingComplete: () => controller.search(context),
  //         // onEditingComplete: () {},
  //         // autofocus: true,
  //         cursorColor: Colors.black,
  //         style: const TextStyle(color: Colors.black),
  //         decoration: InputDecoration(
  //             hintText: "Buscar producto",
  //             floatingLabelBehavior: FloatingLabelBehavior.always,
  //             border: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(20),
  //               borderSide: const BorderSide(
  //                 width: 2,
  //                 color: Colors.black,
  //               ),
  //             ),
  //             focusedBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(20),
  //               borderSide: const BorderSide(
  //                 width: 2,
  //                 color: Colors.black,
  //               ),
  //             ),
  //             prefixIcon: const Icon(
  //               Icons.search,
  //               color: Colors.black,
  //             ),
  //             suffixIcon: TextButton.icon(
  //                 onPressed: () {
  //                   controller.keywordCtrl.clear();
  //                   controller.search(context);
  //                 },
  //                 icon: Icon(Icons.cancel),
  //                 label: Text('')))),
  //   ));
