import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/services.dart';
import 'package:jexpoints/app/modules/main/views/catalogos/catalogos.page.dart';
import 'package:jexpoints/app/modules/main/views/consume/consume.page.dart';
import 'package:jexpoints/app/modules/main/views/points/points.page.dart';
import 'package:jexpoints/app/modules/main/views/profile/profile.page.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jexpoints/app/components/points/points.widget.dart';

import '../../../../components/button-qr-generate/button-qr-generate.dart';
import '../../../../components/card-favorites/cars-favorites.dart';
import '../../../../components/cart-shopping/cart-shopping.dart';
import '../../../../components/circular-progress-bar/circular-progress-bar.dart';
import '../../../../components/custom_input/custom_input.dart';
import '../../../../components/custom_navigation_bar/custom_navigation_bar.dart';
import '../../../../components/linear-progress-bar/linear-progress-bar.dart';
import '../../../../components/popular-product-slider/popular-product-slider.dart';
import '../../../main/views/main/widgets/menu/menu.widget.dart';
import 'home.controller.dart';

void main() => runApp(MaterialApp(home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<HomePage> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final screens = [
    HomePage1(),
    CatalogosPage(),
    PointsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 60.0,
          items: [
            Icon(Icons.home, size: 30),
            Icon(Icons.category_rounded, size: 30),
            Icon(Icons.star, size: 30, color: Color(0xffbf930d)),
            Icon(Icons.person_outline_outlined, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: screens[_page]);
  }
}

/* void main() => runApp(MaterialApp(home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageIndex = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final screens = [
    HomePage1(),
    ConsumePage(),
    ProfilePage(),
  ];

  Widget _initialPage = HomePage();

  Widget _choosePage(int screens) {
    switch (screens) {
      case 0:
        return HomePage1();
      case 1:
        return ConsumePage();
      case 2:
        return ProfilePage();
      default:
        return HomePage1();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: _pageIndex,
          height: 60.0,
          items: <Widget>[
            Icon(Icons.add, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.compare_arrows, size: 30),
            Icon(Icons.call_split, size: 30),
            Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.blueAccent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _initialPage = _choosePage(index);
            });
          },
          letIndexChange: (index) => true,
        ),
        body: _choosePage(screens.length));
  }
} */

class HomePage1 extends GetView<HomeController> {
  const HomePage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2222222),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: CustomSliverDelegate(
                controller,
                expandedHeight: 150,
              ),
            ),
            SliverToBoxAdapter(
              child: Column(children: [
                _slider(controller),
                const SizedBox(height: 20),
                PopularProducts(controller),
                const SizedBox(height: 20),
                FavoritesProducts()
              ]),
            )
          ],
        ),
      ),
      /* bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: FloatingActionButtonPointsQR(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, */
    );
  }

  static Widget _slider(HomeController controller) {
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
                            fit: BoxFit.fill,
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

/*   static Widget _topList(BuildContext context, HomeController controller) {
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
        child: Expanded(
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
      ),
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
          Expanded(
            child: Container(
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
          ),
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
} */
}

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;

  CustomSliverDelegate(
    HomeController controller, {
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
            bottomOpacity: 0.0,
            automaticallyImplyLeading: false,
            backgroundColor: const Color(0xFF22222222),
            elevation: 0.0,
            title: Opacity(
                opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
                child: ElevatedButton.icon(
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
                    ModalBottomSheet(context);
                  },
                  label: const Text('Agrega una dirección'),
                )),
          ),
        ),
        Positioned(
          top: 20,
          child: Opacity(
              opacity: percent,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircularProgressBar(
                          AvatarSize: 25,
                          percent: 0.8,
                          sizeProgressBar: 30,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          children: [
                            Text('Angel Velay',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white)),
                            Padding(
                                padding: EdgeInsets.all(5),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    width: 130,
                                    height: 40,
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
                    Padding(
                      padding: const EdgeInsets.all(10.0),
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
                  decoration: BoxDecoration(
                    color: Color(0xFFfffffff),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: MediaQuery.of(context).size.width - 50,
                  child: TextField(
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        hintText: 'Buscar',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.black,
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        suffixIcon: Icon(Icons.food_bank, color: Colors.black)),
                  )),
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      isScrollControlled: true,
      builder: (context) {
        return SafeArea(
          child: Container(
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
                SizedBox(
                  width: 10,
                ),
                Text('Lago Wenner 58 Col. Centro, C.P. 04510'),
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
                      label: const Text('Guardad dirección',
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
