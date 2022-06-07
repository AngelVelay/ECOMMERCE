import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/circle_icon_button/circle_icon_button.dart';
import '../../entities/product.type.dart';
import '../../../../components/map_ubication/map_ubication.dart';
import '../tab-home/tab-home.controller.dart';

class SearchPage extends GetView<HomeController> {
  @override
  final HomeController controller;

  const SearchPage(this.controller);

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
                  _contentWidget(context, controller),
                ]),
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _contentWidget(BuildContext context, HomeController controller) {
    return Column(children: [
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: const [
      //     Text('Buscar', style: TextStyle(fontSize: 22)),
      //   ],
      // ).paddingSymmetric(horizontal: 10),
      // const Divider(thickness: 2),
      _productList(context, controller)
    ]);
  }

  // List
  Widget _productList(BuildContext context, HomeController controller) {
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
            onTap: () {
              Navigator.pushNamed(context, '/detail', arguments: {
                'url': item.url,
                'name': item.name,
                'price': item.price,
              });
            },
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
              style: const TextStyle(color: Colors.black)),
          Text(
            '\$ ${item.price}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Row(children: [
            (item.cartValue > 0)
                ? CircleIconButton(
                    iconData: Icons.remove,
                    onPressed: () => controller.deleteCart(item),
                    size: 25,
                    foregroundColor: Colors.white,
                  )
                : Container(),
            const Spacer(),
            (item.cartValue > 0) ? Text('${item.cartValue}') : Container(),
            const Spacer(),
            CircleIconButton(
              iconData: Icons.add,
              onPressed: () => controller.addCart(item),
              size: 25,
              foregroundColor: Colors.white,
            ),
          ])
        ],
      ),
    );
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
    final cardTopPosition = expandedHeight / 2 - shrinkOffset;
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
                title: Opacity(
                  opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
                  child: const Text("Buscar",
                      style: TextStyle(color: Colors.white)),
                )),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: Opacity(
              opacity: percent,
              child: Form(
                child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFfffffff),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: MediaQuery.of(context).size.width - 50,
                    child: TextField(
                      controller: controller.keywordCtrl,
                      onEditingComplete: () {
                        controller.search(context);
                      },
                      autofocus: true,
                      cursorColor: Colors.black,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          hintText: 'Buscar',
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
                          suffixIcon:
                              const Icon(Icons.food_bank, color: Colors.black)),
                    )),
              ),
            ),
          ),
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
}

Future<dynamic> ModalBottomSheet(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      isScrollControlled: true,
      builder: (context) {
        return Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: MapFlutter());
      });
}
