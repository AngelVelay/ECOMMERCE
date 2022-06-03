import 'package:flutter/material.dart';

final List<Map<String, String>> productsList = [
  {
    'url':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1w3DfHY1rczx50CtpyT7WQWM7DzgJO51Rww&usqp=CAU',
    'title': 'Pastel de Chocolate',
    'puntos': '30',
  },
  {
    'url':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaMIgHTCOHYmVBhq3Fu_7LILYd1ONWeT8AmQ&usqp=CAU',
    'title': 'Pan Blanco',
    'puntos': '50'
  },
  {
    'url':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSz-uOqi6OOH-5WdxCfboKBJzsFxGn_7WpH8A&usqp=CAU',
    'title': 'Pan de Muerto',
    'puntos': '80'
  },
  {
    'url':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-XaE3eZ7-TOq0Da7FhHcmmlxU2zwhc6ydbQ&usqp=CAU',
    'title': 'Bollos',
    'puntos': '10'
  },
  {
    'url':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlP42IpEI_A3Z79-YLoqy4x1vskyPeLiTdLQ&usqp=CAU',
    'title': 'Concha de Chocolate',
    'puntos': '40'
  },
];

class PopularProducts extends StatelessWidget {
  const PopularProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text('Premios Populares',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
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
      width: 130,
      height: 190,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: NetworkImage(
                    'https://tenor.com/view/loading-gif-9212724.gif'),
                image: NetworkImage(productsList[index]['url'].toString()),
                width: 130,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
          //const SizedBox(height: 5),
          Text(
            productsList[index]['title'].toString(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          Text(
            '${productsList[index]['puntos'].toString()} Puntos',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
