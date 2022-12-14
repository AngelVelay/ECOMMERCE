import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/home/views/tab-home/components/cart-controls.widget.dart';

import '../../../main/entities/product.type.dart';
import '../tab-home/tab-home.controller.dart';

class HomeSearchPage extends GetView<HomeController> {
  @override
  final HomeController controller;

  // ignore: use_key_in_widget_constructors
  const HomeSearchPage(this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff2222222),
      child: SafeArea(
        left: false,
        right: false,
        child: Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: CustomSliverDelegate(
                  controller,
                  expandedHeight: 80,
                ),
              ),
              SliverFillRemaining(
                  child: SingleChildScrollView(
                child: Column(children: [
                  _productList(context, controller),
                ]),
              )),
            ],
          ),
        ),
      ),
    );
  }

  // List
  Widget _productList(BuildContext context, HomeController controller) {
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
                        Icons.search_off_sharp,
                        size: 100,
                        color: Colors.white,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "No se encontaron resultados de b??squeda",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                )
              : GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.findedProducts$
                      .where((p0) => p0.isActive == true)
                      .length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 0.0,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) =>
                      _productItem(context, controller.findedProducts$[index]));
        }),
      ),
    );
  }

  Widget _productItem(BuildContext context, Product item) {
    return item.isActive
        ? Container(
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
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ])),
                ),
                const SizedBox(height: 3),
                Text(item.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white)),
                Text(
                  '\$ ${item.price}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                HomeCartControls(
                  item,
                  labelColor: Colors.white,
                  altColor: Colors.black,
                )
              ],
            ),
          )
        : const SizedBox();
  }
}

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;
  final HomeController controller;

  CustomSliverDelegate(
    this.controller, {
    required this.expandedHeight,
    this.hideTitleWhenExpanded = true,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarSize = expandedHeight - shrinkOffset;
    // final cardTopPosition = expandedHeight / 2 - shrinkOffset;
    final proportion = 2 - (expandedHeight / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;

    return SizedBox(
      height: expandedHeight + expandedHeight / 2,
      child: Stack(
        children: [
          SizedBox(
            height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
            child: AppBar(
                leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Get.back();
                      controller.keywordCtrl.clear();
                    }),
                backgroundColor: Color(0xFF222222),
                elevation: 0.0,
                title: Text(
                  'Buscar Producto',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                )),
          ),
          _searchInput(context, percent)
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight + expandedHeight / 2;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  Widget _searchInput(BuildContext context, double percent) {
    return Positioned(
        right: 20,
        top: 60,
        child: Opacity(
          opacity: percent,
          child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFfffffff),
                borderRadius: BorderRadius.circular(20),
              ),
              width: MediaQuery.of(context).size.width - 50,
              height: 50,
              child: TextField(
                controller: controller.keywordCtrl,
                onEditingComplete: () => controller.search(context),
                autofocus: true,
                cursorColor: Colors.black,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    hintText: 'Ingresa una palabra',
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
                        label: Text(''))),
              )),
        ));
  }
}
