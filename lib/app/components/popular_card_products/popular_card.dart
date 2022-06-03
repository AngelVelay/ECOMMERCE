import 'package:flutter/material.dart';

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
            child: Text('Populares',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (_, int index) {
                  return const _ProductPopularCard();
                }),
          ),
        ],
      ),
    );
  }
}

class _ProductPopularCard extends StatelessWidget {
  const _ProductPopularCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(
                    'https://images.pexels.com/photos/291528/pexels-photo-291528.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260'),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),
          //const SizedBox(height: 5),
          const Text(
            'Pastel de Fresa',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}