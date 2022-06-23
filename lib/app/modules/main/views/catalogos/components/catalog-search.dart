import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/main/views/tab-home/components/cart-controls.widget.dart';

import '../../../entities/product.type.dart';
import '../catagolos.controller.dart';

class CatalogSearchPage extends GetView<CatalogosController> {
  @override
  final CatalogosController controller;

  const CatalogSearchPage(this.controller);

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
  Widget _productList(BuildContext context, CatalogosController controller) {
    return SingleChildScrollView(
      child: Obx(() {
        return GridView.builder(
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
                _productItem(context, controller.findedProducts$[index]));
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
                        'https://tenor.com/view/loading-gif-9212724.gif'),
                    image: NetworkImage(item.url),
                    width: double.infinity,
                    height: 115,
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
              style: Theme.of(context).textTheme.headline5),
          Text(
            '\$ ${item.price}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6,
          ),
          HomeCartControls(
            item,
            labelColor: Colors.black,
            altColor: Colors.white,
          )
        ],
      ),
    );
  }
}

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;
  final CatalogosController controller;

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
                backgroundColor: Color(0xFF222222),
                elevation: 0.0,
                title: const Text('Buscar Producto')),
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
      top: 50,
      child: Opacity(
        opacity: percent,
        child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFfffffff),
              borderRadius: BorderRadius.circular(20),
            ),
            width: MediaQuery.of(context).size.width - 50,
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
                  suffixIcon: const Icon(Icons.food_bank, color: Colors.black)),
            )),
      ),
    );
  }
}
