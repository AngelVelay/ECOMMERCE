import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'catagolos.controller.dart';

List<dynamic> catalogtList = [
  {
    'name': 'Rosticeria',
    'image':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoqEb3n62wXBiS8y7jVrDbm9Ey7zLK7xe6n_xy_ilCcO6VU1PghRsuDMFBzLBZtzffnuo&usqp=CAU'
  },
  {
    'name': 'Pasteleria',
    'image':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjaWMDtfgGZv01R3B7tUsrM4IKqN8-8PB6mA&usqp=CAU'
  },
  {
    'name': 'Postres',
    'image':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGvh0a67siAg1pftfvNXpPpA3VdgX3CQj8bA&usqp=CAU'
  },
  {
    'name': 'Pan Artesanal',
    'image':
        'https://phantom-elmundo.unidadeditorial.es/a01aaaa7dd38471dbdcd5607bdcc631d/resize/414/f/jpg/assets/multimedia/imagenes/2020/07/08/15942185940528.jpg'
  },
  {
    'name': 'Muffins',
    'image':
        'https://t2.rg.ltmcdn.com/es/posts/0/4/4/muffins_de_pasas_13440_orig.jpg'
  },
  {
    'name': 'Gelatinas',
    'image':
        'https://www.gastrolabweb.com/u/fotografias/m/2021/8/25/f608x342-18089_47812_15.jpg'
  },
  {
    'name': 'Bocaadillos',
    'image':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7a5y1HMqLkTedifHRqOoK4jBnfrs1PfWdEw&usqp=CAU'
  },
];

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
                _topList(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _topList(BuildContext context) {
  return Column(children: [
    const SizedBox(height: 10),
    SingleChildScrollView(
      dragStartBehavior: DragStartBehavior.start,
      scrollDirection: Axis.vertical,
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: catalogtList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) =>
                  _topListItem(context, catalogtList[index])),
        ),
      ),
    ),
  ]);
}

Widget _topListItem(BuildContext context, dynamic product) {
  return GestureDetector(
    onTap: () {},
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
                placeholder: NetworkImage(product['image']),
                image: NetworkImage(product['image']),
              ),
            ),
          ),
        ),
        // const Text(
        //   // products is out demo list
        //   'Nombre de producto',
        //   style: TextStyle(color: Colors.black, fontSize: 12),
        // ),

        Center(
            child: Text(
          // products is out demo list
          '${product['name']}',
          style: const TextStyle(
              color: Colors.black87, fontSize: 13, fontWeight: FontWeight.bold),
        )),
        // Text(
        //   "${product['puntos']} pts",
        //   style: TextStyle(fontWeight: FontWeight.bold),
        // )
      ],
    ),
  );
}
