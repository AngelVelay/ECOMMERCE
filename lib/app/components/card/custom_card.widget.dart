import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget{
  final String labelText;
  final IconData icon;
  final List<Widget> widgets;

  CustomCard({this.labelText="",required this.icon, required this.widgets});

  @override
  Widget build(BuildContext context) {
   return Padding(
     padding: EdgeInsets.all(15),
     child: Card(
         color: Theme.of(context).disabledColor,
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(10.0),
         ),
         child: Container(
             margin: EdgeInsets.all(15),
             child:
             Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
               Row(
                 children: [
                   Padding(
                       padding: EdgeInsets.only(right: 10),
                       child: Icon(icon)),
                   Flexible(
                     child: Text(
                       labelText,
                       overflow: TextOverflow.fade,
                       maxLines: 2,
                       style: Theme.of(context).textTheme.subtitle2,
                     ),
                   )
                 ]
               ),
               ListView(
                 physics: NeverScrollableScrollPhysics(),
                   shrinkWrap: true,
                   children: widgets
               ),
             ])),
       ),
   );
  }

}