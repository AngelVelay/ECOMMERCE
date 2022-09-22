import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonTransparent extends StatelessWidget {
  const ButtonTransparent(
      {Key? key,
      required this.text,
      required this.paddingHorizontal,
      required this.paddingVertical,
      this.onPressed})
      : super(key: key);

  final String text;
  final double paddingHorizontal;
  final double paddingVertical;
  final GestureTapCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: paddingHorizontal, vertical: paddingVertical),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(30))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextButton(
                  onPressed: () => onPressed!(),
                  child: Text(
                    text,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontFamily: 'Montserrat',
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        ),
      ),
    ));
  }
}
