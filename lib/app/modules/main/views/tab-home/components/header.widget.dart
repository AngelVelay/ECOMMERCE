import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/button-qr-generate/button-qr-generate.dart';
import 'package:jexpoints/app/components/circular-progress-bar/circular-progress-bar.dart';
import 'package:jexpoints/app/core/utils/sheet.utils.dart';
import 'package:jexpoints/app/modules/main/views/tab-home/components/shopipng-cart.widget.dart';

import '../tab-home.controller.dart';
import 'address-add.widget.dart';
import 'address-choose.widget.dart';

class HomeHeader extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;
  final HomeController controller;

  HomeHeader(
    this.controller, {
    required this.expandedHeight,
    this.hideTitleWhenExpanded = true,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarSize = expandedHeight - shrinkOffset;
    //final cardTopPosition = expandedHeight / 2 - shrinkOffset;
    final proportion = 2 - (expandedHeight / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
    return SizedBox(
      height: expandedHeight + expandedHeight / 2,
      child: Stack(children: [
        _minimizedHeader(context, percent, appBarSize),
        _header(context, percent),
        _qrCode(context, percent),
        _searchInput(context, percent),
        _zipCodeLabelWrapper(context, percent)
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

  Widget _minimizedHeader(
      BuildContext context, double percent, double appBarSize) {
    return SizedBox(
        height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
        child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color(0xFF222222),
            elevation: 0.0,
            title: Opacity(
              opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  _zipCodeLabel(context),
                  const Spacer(),
                  HomeShoppingCart()
                ],
              ),
            )));
  }

  Widget _header(BuildContext context, double percent) {
    return Positioned(
      top: 20,
      child: Opacity(
          opacity: percent,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircularProgressBar(
                      AvatarSize: 20,
                      percent: 0.8,
                      sizeProgressBar: 25,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        Obx(() {
                          return Text(
                              controller.user$.value.employee != null
                                  ? controller.user$.value.employee!.name
                                  : '',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white));
                        }),
                        Padding(
                            padding: const EdgeInsets.all(5),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                width: 130,
                                height: 35,
                                color: const Color(0xFF43578d),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const FadeInImage(
                                        placeholder: AssetImage(
                                            'assets/images/estrella.png'),
                                        image: AssetImage(
                                            'assets/images/estrella.png')),
                                    Container(width: 10),
                                    const Text('35 pts',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white)),
                                  ],
                                ),
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: HomeShoppingCart(),
                )
              ],
            ),
          )),
    );
  }

  Widget _searchInput(BuildContext context, double percent) {
    return Positioned(
      left: 25,
      top: 145,
      child: Opacity(
        opacity: percent,
        child: Form(
          child: SizedBox(
              width: MediaQuery.of(context).size.width - 50,
              height: 50,
              child: GestureDetector(
                  onTap: () => controller.toSearch(controller),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xfffffffff),
                      border: Border.all(color: Colors.grey),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Row(children: const [
                      SizedBox(width: 10),
                      Icon(
                        Icons.search,
                        color: Colors.black54,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Buscar',
                        style: TextStyle(color: Colors.black54),
                        // Theme.of(context).textTheme.headline2
                      ),
                      Spacer(),
                      Icon(
                        Icons.food_bank,
                        color: Colors.black54,
                      ),
                      SizedBox(width: 10),
                    ]),
                  ))),
        ),
      ),
    );
  }

  Widget _qrCode(BuildContext context, double percent) {
    return Positioned(
        top: 90,
        child: Opacity(
            opacity: percent,
            child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      ButtonQRScanner(
                        height: 50,
                        width: 50,
                        title: '',
                        color: Colors.white,
                      )
                    ]))));
  }

  Widget _zipCodeLabel(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: () => {
          if (controller.selectedAddress$.value.id != 0)
            {
              SheetUtils.show(context, HomeAddressSelect(controller),
                  title: 'Selecciona un domicilio')
            }
          else
            {
              SheetUtils.show(context, HomeAddressAdd(controller),
                  title: 'Agrega un domicilio')
            }
        },
        child: Row(children: [
          // Icon(
          //   Icons.location_on,
          //   size: 20,
          // ),
          const SizedBox(width: 10),
          Text(
            controller.selectedAddress$.value.id != 0
                ? 'CP. ${controller.selectedAddress$.value.zipcode}'
                : 'Agregar domicilio',
            style: const TextStyle(fontSize: 15, color: Colors.white),
          ),
          const SizedBox(width: 3),
          const Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
          )
        ]),
      );
    });
  }

  Widget _zipCodeLabelWrapper(BuildContext context, double percent) {
    return Positioned(
        top: 197,
        child: Opacity(
            opacity: percent,
            child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [_zipCodeLabel(context)]))));
  }
}
