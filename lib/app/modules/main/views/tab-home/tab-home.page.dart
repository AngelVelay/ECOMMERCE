import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/main/entities/flyer.type.dart';
import 'package:jexpoints/app/modules/main/views/tab-home/components/header.widget.dart';
import 'components/favorite-products.widget.dart';
import 'components/top-products.widget.dart';
import 'tab-home.controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff222222),
      child: SafeArea(
        left: false,
        right: false,
        child: Scaffold(
          backgroundColor: const Color(0xff222222),
          body: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: HomeHeader(
                  controller,
                  expandedHeight: 150,
                ),
              ),
              SliverToBoxAdapter(
                child: Column(children: [
                  _flyerList(controller),
                  const SizedBox(height: 15),
                  const HomeTopProducts(),
                  const SizedBox(height: 15),
                  const HomeFavoriteProducts(),
                  const SizedBox(height: 20),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _flyerList(HomeController controller) {
    return SizedBox(
        child: ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Obx(() {
          return CarouselSlider.builder(
            itemCount: controller.flyerList$.length,
            itemBuilder: (context, index, realIndex) {
              return controller.flyerList$.isNotEmpty
                  ? _flyerItem(controller.flyerList$[index])
                  : Container();
            },
            options: CarouselOptions(
              height: 150,
              autoPlay: true,
              scrollDirection: Axis.horizontal,
            ),
          );
        })
      ],
    ));
  }

  Widget _flyerItem(Flyer item) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
            width: 600,
            height: 600,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: GestureDetector(
                  onTap: () => controller.toFlyer(item),
                  child: FadeInImage(
                    width: 600,
                    height: 3000,
                    fit: BoxFit.fill,
                    placeholder: const NetworkImage(
                        'https://tenor.com/view/loading-gif-9212724.gif'),
                    image: NetworkImage(item.url),
                  ),
                ))));
  }
}
<<<<<<< HEAD
=======

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;
  final HomeController controller;

  CustomSliverDelegate(
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
        SizedBox(
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
                    ElevatedButton.icon(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xFF43578d),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.black)))),
                      icon: const Icon(Icons.location_on),
                      onPressed: () {
                        ModalBottomSheet(context);
                      },
                      label: const Text('Agrega una dirección'),
                    ),
                  ],
                ),
              )),
        ),
        Positioned(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: CartShopping(),
                    )
                  ],
                ),
              )),
        ),
        Positioned(
          left: 25,
          top: 120,
          child: Opacity(
            opacity: percent,
            child: Form(
              child: Container(
                  width: MediaQuery.of(context).size.width - 50,
                  height: 50,
                  child: GestureDetector(
                      onTap: () => controller.toSearch(controller),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFfffffff),
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
                            'Buscar producto...', 
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
        ),
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

Future<dynamic> ModalBottomSheet(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      isScrollControlled: true,
      builder: (context) {
        return SafeArea(
          child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.30,
              child: chooseAddress()),
        );
      });
}

class chooseAddress extends StatefulWidget {
  const chooseAddress({Key? key}) : super(key: key);

  @override
  State<chooseAddress> createState() => _chooseAddressState();
}

class _chooseAddressState extends State<chooseAddress> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Elige una direccion',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black)),
        Column(
          children: [
            Row(
              children: [
                Radio(
                  value: 1,
                  groupValue: 1,
                  onChanged: (value) {
                    setState(() {
                      print(value);
                    });
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text('Lago Wenner 58 Col. Centro, C.P. 04510'),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 2,
                  groupValue: 2,
                  onChanged: (value) {
                    setState(() {
                      print(value);
                    });
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Feliz Cuevas 97 Col Del Valle'),
              ],
            ),
          ],
        ),
        ElevatedButton.icon(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Color(0xFF43578d),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black)))),
          icon: const Icon(Icons.location_on),
          onPressed: () {
            ModalBottomSheetAddAddress(context);
          },
          label: const Text('Agrega una nueva dirección'),
        )
      ],
    );
  }
}

class addAdress extends StatelessWidget {
  const addAdress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: Text('Agrega una dirección',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black)),
                ),
                Container(
                  child: Column(
                    children: [
                      CustomInputField(
                        keyboardType: TextInputType.text,
                        labelText: 'Calle y Numero',
                        prefixIcon: Icons.place_rounded,
                      ),
                      SizedBox(height: 10),
                      CustomInputField(
                        keyboardType: TextInputType.text,
                        labelText: 'Alcaldia',
                        prefixIcon: Icons.business,
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: CustomInputField(
                              keyboardType: TextInputType.datetime,
                              labelText: 'CP',
                              prefixIcon: Icons.numbers,
                            ),
                          ),
                          Expanded(
                            child: CustomInputField(
                              keyboardType: TextInputType.number,
                              labelText: 'Referencias',
                              prefixIcon: Icons.account_balance_outlined,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton.icon(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xFF43578d),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.black)))),
                      icon: const Icon(
                        Icons.location_on,
                        size: 20,
                      ),
                      onPressed: () {},
                      label: const Text('Guardar dirección',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white)),
                    ),
                  ),
                )
              ],
            )));
  }
}

Future<dynamic> ModalBottomSheetAddAddress(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      isScrollControlled: true,
      builder: (context) {
        return SafeArea(
          child: Container(
              height: MediaQuery.of(context).size.height * 0.50,
              child: addAdress()),
        );
      });
}
>>>>>>> 3e2c28ce94654f73bc05afe3ab689dae9af80584
