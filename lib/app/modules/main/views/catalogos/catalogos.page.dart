import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'catagolos.controller.dart';

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
            backgroundColor: Color(0XFF2222222),
            title: const Text('Catalogos'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFfffffff),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: MediaQuery.of(context).size.width - 50,
                        child: TextField(
                          cursorColor: Colors.black,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              hintText: 'Busca un producto',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.black,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.black,
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                              suffixIcon:
                                  Icon(Icons.food_bank, color: Colors.black)),
                        )),
                  ),
                ),
                _ListCatalogue(context, controller),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget _ListCatalogue(
      BuildContext context, CatalogosController controller) {
    return Column(children: [
      const SizedBox(height: 10),
      SingleChildScrollView(
        dragStartBehavior: DragStartBehavior.start,
        scrollDirection: Axis.vertical,
        child: Expanded(
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
      onTap: () {

Navigator.pushNamed(context, '/catalogs-list');

      },
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
                  placeholder: NetworkImage(product.image),
                  image: NetworkImage(product.image),
                ),
              ),
            ),
          ),
          Center(
              child: Text(
            '${product.name}',
            style: const TextStyle(
                color: Colors.black87,
                fontSize: 13,
                fontWeight: FontWeight.bold),
          )),
        ],
      ),
    );
  }
}
