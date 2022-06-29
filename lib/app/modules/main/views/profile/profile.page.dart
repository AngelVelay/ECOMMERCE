// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:jexpoints/app/modules/main/views/consume/consume.page.dart';
// import 'package:jexpoints/app/modules/main/views/profile/profile.controller.dart';
// import '../../../../components/button-qr-generate/button-qr-generate.dart';
// import '../../../../components/circular-progress-bar/circular-progress-bar.dart';
// import '../../../../components/linear-progress-bar/linear-progress-bar.dart';
// import '../../../../components/profile-card-categories/profile-card-categories.dart';

// class ProfilePage extends GetView<ProfileController> {
//   const ProfilePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: const Color(0xff2222222),
//       child: SafeArea(
//         left: false,
//         right: false,
//         bottom: false,
//         child: Scaffold(
//           body: CustomScrollView(
//             slivers: <Widget>[
//               SliverPersistentHeader(
//                 pinned: true,
//                 floating: true,
//                 delegate: CustomSliverDelegate(
//                   controller,
//                   expandedHeight: 120,
//                 ),
//               ),
//               SliverFillRemaining(
//                 child: SingleChildScrollView(
//                   child: Column(children: [
//                     _levelBar(),
//                     const CardCategoriesProfile(),
//                     const SizedBox(height: 20),
//                     _consumeInfo(context, controller),
//                   ]),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   static Widget _levelBar() {
//     return const Padding(
//       padding: EdgeInsets.only(bottom: 0, left: 10),
//       child: LinearProgressBar(
//         trailing: 'Platino',
//       ),
//     );
//   }

//   Widget _tabBar(context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//           appBar: AppBar(
//             title: Text("Flutter TabBar Example - Customized "),
//           ),
//           body: Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 Container(
//                   height: 45,
//                   decoration: BoxDecoration(
//                       color: Colors.grey[300],
//                       borderRadius: BorderRadius.circular(25.0)),
//                   child: TabBar(
//                     indicator: BoxDecoration(
//                         color: Colors.green[300],
//                         borderRadius: BorderRadius.circular(25.0)),
//                     labelColor: Colors.white,
//                     unselectedLabelColor: Colors.black,
//                     tabs: const [
//                       Tab(
//                         text: 'Consumos',
//                       ),
//                       Tab(
//                         text: 'Cupones',
//                       ),
//                       Tab(
//                         text: 'Descuentos',
//                       ),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                     child: TabBarView(
//                   children: [
//                     Center(
//                       child: _consumeInfo(context, controller),
//                     ),
//                     Center(
//                       child: Text("Status Pages"),
//                     ),
//                     Center(
//                       child: Text('Calls Page'),
//                     ),
//                   ],
//                 ))
//               ],
//             ),
//           )),
//     );
//   }

//   static Widget _consumeInfo(
//       BuildContext context, ProfileController controller) {
//     return Column(children: [
//       // List Header
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           const Text('Mis Compras', style: TextStyle(fontSize: 22)),
//           GestureDetector(
//             onTap: () {
//               Get.toNamed("/consume");
//             },
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: const [
//                 Text('Ver Todos', style: TextStyle(fontSize: 14)),
//                 Icon(Icons.arrow_forward_ios),
//               ],
//             ),
//           )
//         ],
//       ).paddingSymmetric(horizontal: 10),
//       const Divider(thickness: 2),
//       consumeInfo()
//     ]);
//   }
// }

// // List
// //   static Widget _consumeList(
// //       BuildContext context, ProfileController controller) {
// //     return SingleChildScrollView(
// //         child: ListView.separated(
// //             separatorBuilder: (context, index) => const Divider(thickness: 2),
// //             physics: const NeverScrollableScrollPhysics(),
// //             shrinkWrap: true,
// //             scrollDirection: Axis.vertical,
// //             itemCount: controller.compras.length,
// //             itemBuilder: (context, index) {
// //               return GestureDetector(
// //                   onTap: () {
// //                     controller.consumeTap(context);
// //                   },
// //                   child: _consumeListItem(context, controller.compras[index]));
// //             }));
// //   }

// //   static Widget _consumeListItem(BuildContext context, dynamic item) {
// //     return ListTile(
// //       // shape: RoundedRectangleBorder(
// //       //     borderRadius: BorderRadius.circular(10)),
// //       // color: Colors.white,
// //       title: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         children: [
// //           Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
// //             SizedBox(
// //               width: MediaQuery.of(context).size.width - 145,
// //               child: Text('${item['name']}', overflow: TextOverflow.ellipsis),
// //             ),
// //             Text('${item['fecha']}'),
// //           ]),
// //           Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
// //             Text('\$${item['costo']}.00'),
// //             Text(
// //               '${item['puntos']} pts',
// //               style: const TextStyle(fontWeight: FontWeight.bold),
// //             ),
// //           ]),
// //         ],
// //       ),
// //       trailing: const Icon(Icons.arrow_forward_ios_sharp, size: 20),
// //     );
// //   }

// class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
//   final double expandedHeight;
//   final bool hideTitleWhenExpanded;
//   final ProfileController controller;

//   CustomSliverDelegate(
//     this.controller, {
//     required this.expandedHeight,
//     this.hideTitleWhenExpanded = true,
//   });

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     final appBarSize = expandedHeight - shrinkOffset;
//     final cardTopPosition = expandedHeight / 2 - shrinkOffset;
//     final proportion = 2 - (expandedHeight / appBarSize);
//     final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
//     return SizedBox(
//       height: expandedHeight + expandedHeight / 2,
//       child: Stack(
//         children: [
//           SizedBox(
//             height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
//             child: AppBar(
//               actions: [
//                 IconButton(
//                   icon: const Icon(Icons.logout),
//                   onPressed: () {
//                     Get.toNamed('/login');
//                   },
//                 ),
//               ],
//               automaticallyImplyLeading: false,
//               backgroundColor: const Color(0xff2222222),
//               elevation: 0.0,
//               title: Opacity(
//                 opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
//                 child: const Text("Mi perfil",
//                     style: TextStyle(color: Colors.white)),
//               ),
//             ),
//           ),
//           Positioned(
//             left: 130.0,
//             right: 0.0,
//             top: 18,
//             bottom: 0.0,
//             child: Opacity(
//               opacity: percent,
//               child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 35 * percent),
//                   child: const Text('Angel Velay',
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                           color: Colors.white))),
//             ),
//           ),
//           Positioned(
//             left: 130.0,
//             top: 50,
//             child: Opacity(
//               opacity: percent,
//               child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 30 * percent),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(20),
//                     child: Container(
//                       width: 130,
//                       height: 40,
//                       color: const Color(0xFF43578d),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           const FadeInImage(
//                               placeholder:
//                                   AssetImage('assets/images/estrella.png'),
//                               image: AssetImage('assets/images/estrella.png')),
//                           Container(width: 10),
//                           const Text('35 pts',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20,
//                                   color: Colors.white)),
//                         ],
//                       ),
//                     ),
//                   )),
//             ),
//           ),
//           Positioned(
//             left: 0.0,
//             top: cardTopPosition > 0 ? cardTopPosition : 0,
//             child: Opacity(
//               opacity: percent,
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 30 * percent),
//                 child: const CircularProgressBar(
//                   sizeProgressBar: 60.0,
//                   AvatarSize: 55,
//                   percent: 0.8,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   double get maxExtent => expandedHeight + expandedHeight / 2;

//   @override
//   double get minExtent => kToolbarHeight;

//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
//     return true;
//   }
// }

// class ButtonsQr extends StatelessWidget {
//   const ButtonsQr({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: const [
//         ButtonQRScanner(
//           title: 'Generar QR',
//           width: 70,
//           height: 80,
//           color: Color(0xff2222222),
//         ),
//       ],
//     );
//   }
// }

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:jexpoints/app/modules/main/views/profile/profile.controller.dart';
import 'package:jexpoints/app/shared/theme/app_theme.dart';

import '../../../../components/circular-progress-bar/circular-progress-bar.dart';
import '../../../../components/linear-progress-bar/linear-progress-bar.dart';
import '../../entities/coupon.type.dart';
import '../consume/consume.page.dart';
import '../coupons/coupons.page.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff222222),
      child: SafeArea(
        bottom: false,
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
              appBar: AppBar(
                  toolbarHeight: 150,
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.logout),
                      onPressed: () {
                        Get.toNamed('/login');
                      },
                    ),
                  ],
                  flexibleSpace: Container(
                    color: Color(0XFF222222),
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CircularProgressBar(
                          sizeProgressBar: 60.0,
                          AvatarSize: 55,
                          percent: 8,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _userName(),
                          _pointsIndicator(),
                        ],
                      ),
                    ]),
                  )),
              body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: _tabBar(context),
              )),
        ),
      ),
    );
  }

  Widget _pointsIndicator() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 130,
            height: 40,
            color: const Color(0xFF43578d),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const FadeInImage(
                    placeholder: AssetImage('assets/images/estrella.png'),
                    image: AssetImage('assets/images/estrella.png')),
                Container(width: 10),
                const Text('35 pts',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white)),
              ],
            ),
          ),
        ));
  }

  Widget _userName() {
    return Padding(
        padding: EdgeInsets.all(10),
        child: const Text('Angel Velay',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white)));
  }

  static Widget _levelBar() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 0, left: 10),
      child: LinearProgressBar(
        trailing: 'Platino',
      ),
    );
  }

  Widget _tabBar(context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(25.0)),
            child: TabBar(
              indicator: BoxDecoration(
                  color: Color(0xff2222222),
                  borderRadius: BorderRadius.circular(25.0)),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              tabs: const [
                Tab(
                  text: 'Consumos',
                ),
                Tab(
                  text: 'Cupones',
                ),
                Tab(
                  text: 'Descuentos',
                ),
              ],
            ),
          ),
        ),
        Expanded(
            child: TabBarView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: _consumeInfo(context),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: _couponList(context),
            ),
            Center(
              child: Text('Descuentos'),
            ),
          ],
        ))
      ],
    );
  }

  static Widget _consumeInfo(BuildContext context) {
    return Column(children: [
      // List Header
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Mis Compras',
              style: TextStyle(fontSize: 22, color: Colors.white)),
          GestureDetector(
            onTap: () {
              Get.toNamed("/consume");
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Ver Todos', style: Theme.of(context).textTheme.headline4),
                Icon(Icons.arrow_forward_ios, color: Colors.white),
              ],
            ),
          )
        ],
      ).paddingSymmetric(horizontal: 10),
      const Divider(thickness: 2),
      consumeInfo()
    ]);
  }

  // List
  Widget _couponList(BuildContext context) {
    return Obx(() {
      return SingleChildScrollView(
          child: ListView.builder(
              // separatorBuilder: (context, index) => const Divider(thickness: 2),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: controller.coupons$.length,
              itemBuilder: (context, index) {
                return _couponListItem(context, controller.coupons$[index]);
              }));
    });
  }

  Widget _couponListItem(BuildContext context, Coupon item) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: DottedBorder(
          color: Colors.white,
          strokeWidth: 1,
          dashPattern: const [15, 10],
          radius: const Radius.circular(10),
          borderType: BorderType.RRect,
          child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          item.title,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(width: 50),
                        TextButton.icon(
                            icon: Icon(Icons.share, color: Colors.white),
                            style: ButtonStyle(
                                side: MaterialStateProperty.all(
                                    const BorderSide(
                                        width: 2, color: Colors.white)),
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10)),
                                textStyle: MaterialStateProperty.all(
                                    TextStyle(fontSize: 15))),
                            onPressed: () {
                              controller.shareData(item);
                            },
                            label: Text(
                              item.code,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image(
                        image: NetworkImage(item.url),
                        width: 100,
                        height: 100,
                      )),
                  const SizedBox(
                    width: 15,
                  ),
                  Flexible(
                      child: Text(
                    item.description,
                    style: const TextStyle(color: Colors.white70),
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                  ))
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(children: [
                      const Text(
                        'Valido hasta',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                      Text(
                        item.formattedValidTo!,
                        style: const TextStyle(color: Colors.white),
                      )
                    ]),
                    TextButton(
                        onPressed: () => controller.toDetail(item),
                        child: const Text(
                          'Ver más',
                          style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline),
                        ))
                  ],
                )
              ]))),
    );
  }
}
