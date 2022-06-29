import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jexpoints/app/modules/main/views/points/points.controller.dart';

import '../../../../components/button-qr-generate/button-qr-generate.dart';
import '../../../../components/linear-progress-bar/linear-progress-bar.dart';
import '../../../../components/points/points.widget.dart';

class PointsPage extends GetView<PointsController> {
  const PointsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff222222),
      child: SafeArea(
          left: false,
          right: false,
          bottom: false,
          child: Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  floating: true,
                  delegate: CustomSliverDelegate(
                    expandedHeight: 280,
                  ),
                ),
                SliverToBoxAdapter(
                  child: SingleChildScrollView(
                    child: Column(children: [
                      const SizedBox(height: 20),
                      _topList(context, controller),
                    ]),
                  ),
                )
              ],
            ),
          )),
    );
  }

  static Widget _slider(PointsController controller) {
    return SizedBox(
        child: ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        CarouselSlider.builder(
          itemCount: controller.sliderImagesList.length,
          itemBuilder: (context, index, realIndex) {
            final carouselImage = controller.sliderImagesList[index];
            return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                    width: 600,
                    height: 600,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/publicidad',
                                arguments: carouselImage);
                          },
                          child: FadeInImage(
                            width: 600,
                            height: 3000,
                            fit: BoxFit.cover,
                            placeholder: const NetworkImage(
                                'https://tenor.com/view/loading-gif-9212724.gif'),
                            image: NetworkImage(carouselImage),
                          ),
                        ))));
          },
          options: CarouselOptions(
            height: 150,
            autoPlay: true,
            scrollDirection: Axis.horizontal,
          ),
        )
      ],
    ));
  }

  static Widget _sliderImage(String carouselImage, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
          width: 400,
          height: 150,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: FadeInImage(
                fit: BoxFit.cover,
                placeholder: const NetworkImage(
                    'https://tenor.com/view/loading-gif-9212724.gif'),
                image: NetworkImage(carouselImage),
              ))),
    );
  }

  static Widget _topList(BuildContext context, PointsController controller) {
    return Column(children: [
      const Text(
        'Recompensas',
        style: TextStyle(
          fontSize: 25,
          color: Colors.black87,
        ),
      ),
      const SizedBox(height: 10),
      SingleChildScrollView(
        dragStartBehavior: DragStartBehavior.start,
        scrollDirection: Axis.vertical,
        // child: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.topProductList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 5.0,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) =>
                    _topListItem(context, controller.topProductList[index])),
          ),
        ),
      // ),
    ]);
  }

  static Widget _topListItem(BuildContext context, dynamic product) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/detail', arguments: product);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Expanded(
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: NetworkImage(product['url']),
                  image: NetworkImage(product['url']),
                ),
              ),
            ),
          // ),
          // const Text(
          //   // products is out demo list
          //   'Nombre de producto',
          //   style: TextStyle(color: Colors.black, fontSize: 12),
          // ),

          Center(
              child: Text(
            // products is out demo list
            '${product['points']} pts',
            style: const TextStyle(
                color: Colors.black87,
                fontSize: 13,
                fontWeight: FontWeight.bold),
          )),
          // Text(
          //   "${product['puntos']} pts",
          //   style: TextStyle(fontWeight: FontWeight.bold),
          // )
        ],
      ),
    );
  }
}

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;

  CustomSliverDelegate({
    required this.expandedHeight,
    this.hideTitleWhenExpanded = true,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarSize = expandedHeight - shrinkOffset;
    // final cardTopPosition = expandedHeight / 2 - shrinkOffset;
    final proportion = 2 - (expandedHeight / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
    return SizedBox(
      height: expandedHeight + expandedHeight / 2,
      child: Stack(fit: StackFit.expand, children: [
        SizedBox(
          height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color(0xFF222222),
            elevation: 0.0,
            title: Opacity(
                opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Angel Velay",
                      style: TextStyle(color: Colors.white),
                    ),
                    PointsViewer(
                      size: 43,
                      fontSize: 14,
                      value: '35',
                    )
                  ],
                )),
          ),
        ),
        Positioned(
          child: Opacity(
              opacity: percent,
              child: Column(children: [
                // Expanded(
                  // child: const SizedBox(
                    // height: 30,
                  // ),
                // ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30 * percent),
                  child: PointsViewer(
                    size: 90,
                    fontSize: 23,
                    value: '35',
                  ),
                ),
                const SizedBox(height: 10),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Column(
                    children: const [
                      Text('Hola,',
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                      Text('Angel Velay',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white)),
                    ],
                  )
                ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      LinearProgressBar(trailing: ''),
                    ]),
                const ButtonQRScanner(
                  height: 100,
                  width: 100,
                  title: '',
                  color: Colors.white,
                ),
                // Expanded(
                   SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 31,
                      child: const FadeInImage(
                          fit: BoxFit.cover,
                          placeholder:
                              AssetImage('assets/images/esperanza_banner.png'),
                          image: AssetImage(
                              'assets/images/esperanza_banner.png'))),
                // )
              ])),
        )
      ]),
    );
  }

  @override
  double get maxExtent => expandedHeight + expandedHeight / 2;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
