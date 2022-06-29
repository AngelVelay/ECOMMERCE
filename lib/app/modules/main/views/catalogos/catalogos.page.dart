import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../tab-home-search/tab-home-search.page.dart';
import '../tab-home/components/cart-controls.widget.dart';
import '../tab-home/tab-home.controller.dart';
import 'catagolos.controller.dart';
import 'components/catalog-search.dart';

class CatalogosPage extends GetView<CatalogosController> {
  const CatalogosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff2222222),
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Color(0XFF2222222),
            title: const Text('Catalogos'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: _searchInput(context, controller),
                    ),
                    // Form(
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(20.0),
                    //     child: Container(
                    //         decoration: BoxDecoration(
                    //           color: Color(0xFFfffffff),
                    //           borderRadius: BorderRadius.circular(20),
                    //         ),
                    //         width: MediaQuery.of(context).size.width - 50,
                    //         child: TextField(
                    //           cursorColor: Colors.black,
                    //           style: TextStyle(color: Colors.black),
                    //           decoration: InputDecoration(
                    //               hintText: 'Busca un producto',
                    //               floatingLabelBehavior:
                    //                   FloatingLabelBehavior.always,
                    //               border: OutlineInputBorder(
                    //                 borderRadius: BorderRadius.circular(20),
                    //                 borderSide: BorderSide(
                    //                   width: 2,
                    //                   color: Colors.black,
                    //                 ),
                    //               ),
                    //               focusedBorder: OutlineInputBorder(
                    //                 borderRadius: BorderRadius.circular(20),
                    //                 borderSide: BorderSide(
                    //                   width: 2,
                    //                   color: Colors.black,
                    //                 ),
                    //               ),
                    //               prefixIcon: Icon(
                    //                 Icons.search,
                    //                 color: Colors.black,
                    //               ),
                    //               suffixIcon:
                    //                   Icon(Icons.food_bank, color: Colors.black)),
                    //         )),
                    //   ),
                    // ),
                  ],
                ),
                    _ListCatalogue(context, controller),
              ],
            ),
            
          ),
        ),
      ),
    );
  }

  Widget _searchInput(BuildContext context, CatalogosController controller) {
    return Form(
      child: SizedBox(
          width: MediaQuery.of(context).size.width - 50,
          height: 50,
          child: GestureDetector(
              onTap: () => controller.toSearch(controller),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xfffffffff),
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Row(children: const [
                  SizedBox(width: 10),
                  Icon(
                    Icons.search,
                    color: Colors.black54,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Buscar',
                    style: TextStyle(color: Colors.black54),
                    // Theme.of(context).textTheme.headline2
                  ),
                  Spacer(),
                  Icon(
                    Icons.food_bank,
                    color: Colors.black54,
                  ),
                  SizedBox(width: 10),
                ]),
              ))),
    );
  }

  static Widget _ListCatalogue(
      BuildContext context, CatalogosController controller) {
    return Column(children: [
      // const SizedBox(height: 10),
      SingleChildScrollView(
        dragStartBehavior: DragStartBehavior.start,
        scrollDirection: Axis.vertical,
        // child: Expanded(
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
        // ),
      ),
    ]);
  }

  static Widget _ListItemCatalogue(BuildContext context, dynamic product) {
    // return GestureDetector(
    //   onTap: () {
    //     Navigator.pushNamed(context, '/catalogs-list');
    //   },
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: <Widget>[
    //       Expanded(
    //         child: Container(
    //           decoration: BoxDecoration(
    //             color: Colors.white,
    //             borderRadius: BorderRadius.circular(10),
    //           ),
    //           child: ClipRRect(
    //             borderRadius: BorderRadius.circular(10),
    //             child: FadeInImage(
    //               fit: BoxFit.cover,
    //               placeholder: NetworkImage(product.image),
    //               image: NetworkImage(product.image),
    //             ),
    //           ), 
    //         ),
    //       ),
    //       Center(
    //           child: Text(
    //         '${product.name}',
    //         style: Theme.of(context).textTheme.headline4,
    //       )),
    //     ],
    //   ),
    // );

    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/catalogs-list');
      },
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
          // Text(
          //   '\$ ${product.id}',
          //   maxLines: 2,
          //   overflow: TextOverflow.ellipsis,
          //   textAlign: TextAlign.center,
          //   style: const TextStyle(
          //       fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
          // ),
          // HomeCartControls(product)
        ],
      ),
    );

  }
}
