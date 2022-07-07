import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/circle_icon_button/circle_icon_button.dart';
import '../../entities/product.type.dart';
import 'catagolos_list.controller.dart';

class CatalogsListPage extends GetView<CatalogosListController> {
  var category = Get.arguments['category'];

  @override
  Widget build(BuildContext context) {
    controller.category = category;
    controller.catalogList(context);
    return SafeArea(
      left: false,
      right: false,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Catalogo de productos'),
          ),
          body: SingleChildScrollView(
            child: Column(children: <Widget>[
              const SizedBox(height: 20),
              _searchInput(context),
              const SizedBox(height: 20),
              _productList(context, category),
            ]),
          )),
    );
  }

  Widget _searchInput(BuildContext context) {
    return Positioned(
      right: 20,
      top: 50,
      // child: Opacity(
        // opacity: 0.5,
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            width: MediaQuery.of(context).size.width - 50,
            child: TextField(
              controller: controller.keywordCtrl,
              onEditingComplete: () => controller.search(context),
              // autofocus: true,
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
      // ),
    );
  }

  // List
  Widget _productList(BuildContext context, category) {
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
            (item.cartValue > 0)
                ? Text(
                    '${item.cartValue}',
                    style: Theme.of(context).textTheme.subtitle1,
                  )
                : Container(),
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
