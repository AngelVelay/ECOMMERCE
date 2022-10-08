import 'package:flutter/material.dart';
import 'package:jexpoints/app/shared/values/constants.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final Function onTap;
  const RoundButton({
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: kTitleStyle.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
