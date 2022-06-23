import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/circle_icon_button/circle_icon_button.dart';
import '../../entities/product.type.dart';
import '../tab-home/tab-home.controller.dart';

class CatalogsListPage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    controller.catalogList(context);
    return Container(
      color: const Color(0xff2222222),
      child: SafeArea(
        left: false,
        right: false,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0XFF2222222),
            title: const Text('Catalogo de productos'),
          ),
          body: CustomScrollView(
            slivers: <Widget>[
              SliverFillRemaining(
                child: Container(
                    // color: Color(0xff2222222),
                    padding: const EdgeInsets.only(top: 20),
                    child: SingleChildScrollView(
                      child: Column(children: [
                        _productList(context, controller),
                      ]),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  // List
  Widget _productList(BuildContext context, HomeController controller) {
    return SingleChildScrollView(
      child: Obx(() {
        return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.catalogsList$.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) =>
                _productItem(context, controller.catalogsList$[index]));
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
