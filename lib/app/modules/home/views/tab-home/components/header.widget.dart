import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:jexpoints/app/modules/home/views/tab-home/tab-home.controller.dart';

import '../../../../../components/button-qr-generate/button-qr-generate.dart';
import '../../../../../core/utils/sheet.utils.dart';
import 'address-choose.widget.dart';
import 'user-number-card.dart';

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
        //_userCardNumber(percent, appBarSize),
        _minimizedHeader(context, percent, appBarSize),
        _header(context, percent),
        // _qrCode(context, percent),
        // // _searchInput(context, percent),
        // _zipCodeLabelWrapper(context, percent)
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
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFF222222),
          title: Opacity(
              opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
              child: Image.asset(
                'assets/cards/card_title_platino.png',
                width: 200,
              )),
          // leading: Padding(
          //   padding: const EdgeInsets.only(left: 15.0),
          //   child: Opacity(
          //     opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
          //     child: CircularProgressBar(
          //       AvatarSize: 20,
          //       percent: 0.8,
          //       sizeProgressBar: 25,
          //     ),
          //   ),
          // ),
          // title: Opacity(
          //   opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
          //   child: Obx(() {
          //     return Container(
          //       alignment: Alignment.centerLeft,
          //       child: Text(
          //           controller.user$.value.employee != null
          //               ? controller.user$.value.employee!.name
          //               : '',
          //           style: const TextStyle(
          //               fontWeight: FontWeight.bold,
          //               fontSize: 20,
          //               color: Colors.white,
          //               fontFamily: 'Montserrat-Bold')),
          //     );
          //   }),
          // ),
          actions: [
            Opacity(
              opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
              child: _zipCodeLabel(context),
            ),
            Opacity(
              opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
              child: IconButton(
                onPressed: () => controller.toSearch(controller),
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ));
  }

  Widget _header(BuildContext context, double percent) {
    return Positioned(
        top: 10,
        child: Opacity(
            opacity: percent,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: [userCardNumber()])
                ],
              ),
            )));
  }

  Widget _qrCode(BuildContext context, double percent) {
    return Positioned(
        top: 100,
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
              SheetUtils.show(context, HomeAddressSelect(controller),
                  // SheetUtils.show(context, HomeAddressAdd(controller),
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
                ? 'CP. ${controller.selectedAddress$.value.zipCode}'
                : 'Agregar domicilio',
            style: const TextStyle(
                fontSize: 13,
                fontFamily: 'Montserrat-Regular',
                color: Colors.white),
          ),
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
        top: 150,
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