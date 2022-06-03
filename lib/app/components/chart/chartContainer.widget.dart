import 'package:flutter/material.dart';

class ChartContainer extends StatelessWidget {
  final Color color;
  final String title;
  final List<Container> defineColor;
  final Widget chart;

  const ChartContainer(
      {required this.title,
      required this.color,
      required this.chart,
      required this.defineColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.width * 0.95 * 0.65,
        padding: EdgeInsets.fromLTRB(0, 10, 20, 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(title,
                style: Theme.of(context)
                    .primaryTextTheme
                    .subtitle1!
                    .apply(fontWeightDelta: FontWeight.bold.index)),
            Expanded(
                flex: 4,
                child: Container(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: chart,
                )),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: defineColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
