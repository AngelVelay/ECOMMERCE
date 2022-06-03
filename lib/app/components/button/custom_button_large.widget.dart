import 'package:flutter/material.dart';
import 'package:jexpoints/app/core/utils/colors.utils.dart';

class CustomButtonIconLarge extends StatelessWidget {
  CustomButtonIconLarge(
      {required this.text,
      required this.onPressed,
      this.color = Colors.transparent,
      this.iconData});

  final GestureTapCallback onPressed;
  final String text;
  final Color color;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.solid,
          color: Colors.white,
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.clamp,
          colors: [
            ColorsUtils.hexToColor('#939292'),
            ColorsUtils.hexToColor('#9B9B9C')
          ],
        ),
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      child: ElevatedButton(
          onPressed: () => onPressed(),
          child: Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                        fontSize: 15, color: Theme.of(context).hoverColor),
                    textAlign: TextAlign.center,
                  ),
                  Icon(iconData, color: Colors.white, size: 23)
                ],
              )),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(defineColor(context)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0))))),
    );
  }

  Color defineColor(BuildContext context) {
    if (color == Colors.blue) {
      return Theme.of(context).highlightColor;
    } else {
      return color;
    }
  }
}

class CustomButtonLarge extends StatelessWidget {
  CustomButtonLarge(
      {required this.text,
      required this.onPressed,
      this.color = Colors.transparent});

  final GestureTapCallback onPressed;
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.solid,
          color: Colors.white,
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.clamp,
          colors: [
            ColorsUtils.hexToColor('#939292'),
            ColorsUtils.hexToColor('#9B9B9C')
          ],
        ),
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      child: ElevatedButton(
          onPressed: () => onPressed(),
          child: Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 15, color: Theme.of(context).hoverColor),
                textAlign: TextAlign.center,
              )),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(defineColor(context)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0))))),
    );
  }

  Color defineColor(BuildContext context) {
    if (color == Colors.blue) {
      return Theme.of(context).highlightColor;
    } else {
      return color;
    }
  }
}
