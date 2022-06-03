import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jexpoints/app/core/utils/shadow.utils.dart';

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  final double height;
  final String title;
  final List<Widget> widget;
  final GestureTapCallback ontap;

  MainAppBar(
      {this.height = kToolbarHeight,
      required this.title,
      required this.ontap,
      required this.widget});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 2,
      forceElevated: true,
      backgroundColor: Theme.of(context).indicatorColor,
      automaticallyImplyLeading: false,
      systemOverlayStyle:
          SystemUiOverlayStyle(systemNavigationBarContrastEnforced: true),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Builder(
            builder: (context) => GestureDetector(
              child: Container(
                width: 40,
                height: 40,
                decoration: ShadowUtils.hexImageSmall(),
              ),
              onTap: ontap,
            ),
          ),
          Text(
            title,
            style: Theme.of(context).primaryTextTheme.headline2,
          ),
          Row(crossAxisAlignment: CrossAxisAlignment.end, children: widget)
        ],
      ),
      expandedHeight: 150,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: [StretchMode.fadeTitle, StretchMode.zoomBackground],
        background: Container(
          decoration: BoxDecoration(
            borderRadius: new BorderRadius.only(
              bottomLeft: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0),
            ),
            image: DecorationImage(
              image: AssetImage(
                "assets/images/especialidades.jpg",
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
