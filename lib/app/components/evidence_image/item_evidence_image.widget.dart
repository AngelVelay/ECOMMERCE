import 'package:flutter/material.dart';

class EvidenceItemImage extends StatelessWidget {
  EvidenceItemImage({required this.item, this.date = '', required this.onPressed});

  final GestureTapCallback onPressed;
  final String item;
  final String date;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Card(elevation: 2, child: Visibility(
          visible: date.isNotEmpty,
          child: imageDate(context),
          replacement: image(),
        ))
    );
  }

  Widget imageDate(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.1,
            child: Hero(
              tag: "image$item",
              child: FadeInImage.assetNetwork(
                placeholder: "assets/images/loading.gif",
                image: item,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Flexible(
              child: Padding(
                padding: const EdgeInsets.only(top: 3, bottom: 3),
                child: Text(
                  date,
                  style: TextStyle(fontSize: 7),
                  textAlign: TextAlign.center,
                ),
              ))
        ]));
  }

  Widget image() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Hero(
        tag: "image$item",
        child: FadeInImage.assetNetwork(
          placeholder: "assets/images/loading.gif",
          image: item,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
