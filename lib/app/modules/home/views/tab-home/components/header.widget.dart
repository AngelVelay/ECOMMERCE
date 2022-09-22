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
        child: Obx((() {
          return Stack(children: [
            //_userCardNumber(percent, appBarSize),
            _minimizedHeader(context, percent, appBarSize),
            _header(context, percent),
            // _qrCode(context, percent),
            // // _searchInput(context, percent),
            // _zipCodeLabelWrapper(context, percent)
          ]);
        })));
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
              child: controller.pointsLevel$.isEmpty
                  ? const CircularProgressIndicator(
                      color: Colors.transparent,
                    )
                  : controller.pointsLevel$.first.initialPoints! <= 100
                      ? FadeInImage(
                          placeholder: const AssetImage(
                              'assets/cards/card_title_platino.png'),
                          image: NetworkImage(
                              '${controller.pointsLevel$[0].cardHeaderFile}'),
                          fit: BoxFit.cover,
                        )
                      : controller.pointsLevel$[1].initialPoints! <= 500
                          ? FadeInImage(
                              placeholder: const AssetImage(
                                  'assets/cards/card_title_gold.png'),
                              image: NetworkImage(
                                  '${controller.pointsLevel$[1].cardHeaderFile}'),
                              fit: BoxFit.cover,
                            )
                          : FadeInImage(
                              placeholder: const AssetImage(
                                  'assets/cards/card_title_black.png'),
                              image: NetworkImage(
                                  '${controller.pointsLevel$[2].cardHeaderFile}'),
                              fit: BoxFit.cover,
                            )),
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
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
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
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            builder: (context) => Container(
              color: Color(0xff222222),
              height: MediaQuery.of(context).copyWith().size.height * 0.60,
              child: Column(
                children: [
                  Container(
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: HomeAddressSelect(controller),
                    ),
                  ),
                ],
              ),
            ),
          )
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
