import 'package:flutter/material.dart';

final List<Map<String, String>> productsList = [
  {
    'url': 'https://cf.shopee.com.mx/file/1d50e76a61ce7af4b022cf30997c401c',
    'title': 'Mis Cupones',
    'subtitle': 'Revisa tus cupones',
  },
  {
    'url': 'https://cdn-icons-png.flaticon.com/512/5499/5499587.png',
    'title': ' Mis Puntos',
    'subtitle': 'Canjea tus puntos'
  },
  {
    'url':
        'https://cazaofertas.com.mx/wp-content/uploads/2018/06/Descuentos-escalonados-Promoda-Hasta-30-de-descuento-directo-esta-semana-dependiendo-las-prendas-que-compres.jpg',
    'title': 'Promociónes y Descuentos',
    'subtitle': ''
  },
];

class CardCategoriesProfile extends StatelessWidget {
  const CardCategoriesProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text('Favoritos',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: productsList.length,
                itemBuilder: (_, int index) {
                  return _ProductPopularPoster(index: index);
                }),
          ),
        ],
      ),
    );
  }
}

class _ProductPopularPoster extends StatelessWidget {
  final index;
  const _ProductPopularPoster({Key? key, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey,
        width: MediaQuery.of(context).size.width / 2,
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/detail', arguments: {
                    'url': productsList[index]['url'],
                    'title': productsList[index]['title'],
                    'subtitle': productsList[index]['subtitle'],
                  });
                },
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(children: [
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            image: DecorationImage(
                              image: NetworkImage(
                                  productsList[index]['url'].toString()),
                            )),
                      ),
                    ]))),
          ],
        ));
  }
}
