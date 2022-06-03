import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CircularProgressBar extends StatelessWidget {
  final double sizeProgressBar;
  final double AvatarSize;
  final double percent;
  const CircularProgressBar({
    Key? key,
    required this.sizeProgressBar,
    required this.AvatarSize,
    required this.percent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: sizeProgressBar,
      lineWidth: 8.0,
      percent: 0.8,
      animation: true,
      animationDuration: 1000,
      center: Avatar(AvatarSize: AvatarSize),
      // progressColor: Color(0xFF475cb5),
      progressColor: Color(0xFFc59400),
    );
  }
}

class Avatar extends StatelessWidget {
  final double AvatarSize;

  const Avatar({
    Key? key,
    required this.AvatarSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'profile');
      },
      child: CircleAvatar(
        radius: AvatarSize, // Image radius
        backgroundImage: AssetImage('assets/images/female-07.jpg'), // Image URL
      ),
    ));
  }
}
