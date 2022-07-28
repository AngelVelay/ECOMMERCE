import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/main/entities/business-line.type.dart';
import 'package:jexpoints/app/modules/main/main.module.dart';
import '../../../../core/utils/sheet.utils.dart';
import '../../entities/category.type.dart';
import '../tab-home/components/address-add.widget.dart';
import '../tab-home/components/address-choose.widget.dart';
import '../tab-home/tab-home.controller.dart';
import 'store.controller.dart';

class StorePage extends GetView<StoreController> {
  const StorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        child: Obx(() {
          return DefaultTabController(
            length: controller.businessLines$.length,
            child: Scaffold(
                body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: _header(context),
            )),
          );
        }));
  }

  Widget _header(context) {
    return controller.businessLines$.length == 0
        ? Container()
        : Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [_zipCodeLabel(context)],
                ),
              ),
              _tabs(context),
              _tabViews(context)
            ],
          );
  }

  Widget _tabs(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 30,
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(25.0)),
        child: TabBar(
            indicator: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(25.0)),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            tabs: controller.businessLines$.map<Widget>((BusinessLine x) {
              return Tab(
                text: x.name,
              );
            }).toList()),
      ),
    );
  }

  Widget _tabViews(BuildContext context) {
    return Expanded(
        child: TabBarView(
            children: controller.businessLines$.map<Widget>((BusinessLine bl) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: _grid(context, bl.categories!),
        ),
      );
    }).toList()));
  }

  Widget _grid(BuildContext context, List<Category> categories) {
    return Column(children: [
      SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
            dragStartBehavior: DragStartBehavior.start,
            scrollDirection: Axis.vertical,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: categories.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 30.0,
                      crossAxisSpacing: 30.0,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (context, index) =>
                        _gridItem(context, categories[index])))),
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

  Widget _gridItem(BuildContext context, Category category) {
    return GestureDetector(
      onTap:
          // Navigator.pushNamed(context, '/catalogs-list');
          () => _goTo(context, category.name),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage(
                fit: BoxFit.fill,
                placeholder: const NetworkImage(
                    'https://acegif.com/wp-content/uploads/loading-11.gif'),
                image: NetworkImage(category.image),
              ),
            ),
          )),
          const SizedBox(height: 5),
          Text(category.name,
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
