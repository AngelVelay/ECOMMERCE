import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/main/main.module.dart';
import '../variable-products/variable-products.page.dart';
import 'catagolos.controller.dart';

class CatalogosPage extends GetView<CatalogosController> {
  const CatalogosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
            body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: _tabBar(context, controller),
        )),
      ),
    );
  }

  Widget _tabBar(context, controller) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 30,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(25.0)),
            child: TabBar(
              indicator: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(25.0)),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              tabs: const [
                Tab(
                  text: 'Esperanza',
                ),
                Tab(
                  text: 'Santo Gallo',
                ),
              ],
            ),
          ),
        ),
        Expanded(
            child: TabBarView(
          children: [
            Center(
              child: _ListCatalogue(context, controller),
            ),
            Center(child: _ListCatalogue1(context, controller)),
          ],
        ))
      ],
    );
  }

  static Widget _ListCatalogue(
      BuildContext context, CatalogosController controller) {
    return Column(children: [
      SizedBox(
        height: 555,
        child: SingleChildScrollView(
          dragStartBehavior: DragStartBehavior.start,
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Obx((() {
              return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.catalogueList$.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) => _ListItemCatalogue(
                      context, controller.catalogueList$[index]));
            })),
          ),
        ),
      ),
    ]);
  }

  static Widget _ListItemCatalogue(BuildContext context, dynamic product) {
    return GestureDetector(
      onTap:
          // Navigator.pushNamed(context, '/catalogs-list');
          () => _goTo(context, product.name),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: const NetworkImage(
                      'https://tenor.com/view/loading-gif-9212724.gif'),
                  image: NetworkImage(product.image),
                ),
              ),
            ),
          ),
          const SizedBox(height: 3),
          Text(product.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  static Widget _ListCatalogue1(
      BuildContext context, CatalogosController controller) {
    return Column(children: [
      SizedBox(
        height: 555,
        child: SingleChildScrollView(
          dragStartBehavior: DragStartBehavior.start,
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Obx((() {
              return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.catalogueListSantoGallo$.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) => _ListItemCatalogue1(
                      context, controller.catalogueListSantoGallo$[index]));
            })),
          ),
        ),
      ),
      TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => VariableProductsPage()));
          },
          child: Text(
            'Paquetes',
            style: TextStyle(color: Colors.white),
          ))
    ]);
  }

  static Widget _ListItemCatalogue1(BuildContext context, dynamic product) {
    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => _goTo(context, product.name),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(children: [
                  FadeInImage(
                    placeholder: const NetworkImage(
                        'https://tenor.com/view/loading-gif-9212724.gif'),
                    image: NetworkImage(product.image),
                    width: double.nan,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ])),
          ),
          const SizedBox(height: 3),
          Text(product.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  static _goTo(BuildContext context, String category) {
    // Navigator.pop(context);
    Get.toNamed(MainRouting.CATALOGS_LIST_ROUTE,
        arguments: {"category": category});
  }
}
