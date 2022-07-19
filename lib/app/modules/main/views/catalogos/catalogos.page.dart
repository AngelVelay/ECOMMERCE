import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/main/main.module.dart';
import '../../../../core/utils/sheet.utils.dart';
import '../tab-home/components/address-add.widget.dart';
import '../tab-home/components/address-choose.widget.dart';
import '../tab-home/tab-home.controller.dart';
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
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: _zipCodeLabel(context),
        ),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: _ListCatalogue(context, controller),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                  child: _ListCatalogue1(context, controller)),
            ),
          ],
        ))
      ],
    );
  }

  static Widget _ListCatalogue(
      BuildContext context, CatalogosController controller) {
    return Column(children: [
      SizedBox(
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
                    mainAxisSpacing: 30.0,
                    crossAxisSpacing: 30.0,
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
                      'https://acegif.com/wp-content/uploads/loading-11.gif'),
                  image: NetworkImage(product.image),
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
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
        height: MediaQuery.of(context).size.height * 0.7,
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
                    mainAxisSpacing: 30.0,
                    crossAxisSpacing: 30.0,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) => _ListItemCatalogue1(
                      context, controller.catalogueListSantoGallo$[index]));
            })),
          ),
        ),
      ),
      // TextButton(
      //     onPressed: () {
      //       Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //               builder: (context) => VariableProductsPage()));
      //     },
      //     child: Text(
      //       'Paquetes',
      //       style: TextStyle(color: Colors.white),
      //     ))
    ]);
  }

  static Widget _ListItemCatalogue1(BuildContext context, dynamic product) {
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
                      'https://acegif.com/wp-content/uploads/loading-11.gif'),
                  image: NetworkImage(product.image),
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
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

  Widget _zipCodeLabel(BuildContext context) {
    final controllerHome = Get.find<HomeController>();
    return Obx(() {
      return GestureDetector(
        onTap: () => {
          if (controllerHome.selectedAddress$.value.id != 0)
            {
              SheetUtils.show(context, HomeAddressSelect(controllerHome),
                  title: 'Selecciona un domicilio')
            }
          else
            {
              SheetUtils.show(context, HomeAddressAdd(controllerHome),
                  title: 'Agrega un domicilio')
            }
        },
        child: Row(children: [
          // Icon(
          //   Icons.location_on,
          //   size: 20,
          // ),
          const SizedBox(width: 10),
          Text(
            controllerHome.selectedAddress$.value.id != 0
                ? 'CP. ${controllerHome.selectedAddress$.value.zipCode}'
                : 'Agregar domicilio',
            style: const TextStyle(fontSize: 15, color: Colors.white),
          ),
          const Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
          )
        ]),
      );
    });
  }

  Widget _zipCodeLabelWrapper(BuildContext context, double percent) {
    return Positioned(
        top: 150,
        child: Opacity(
            opacity: percent,
            child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [_zipCodeLabel(context)]))));
  }
}
