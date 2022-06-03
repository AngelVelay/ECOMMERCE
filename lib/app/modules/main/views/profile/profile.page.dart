import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jexpoints/app/modules/main/views/profile/profile.controller.dart';

import '../../../../components/button-qr-generate/button-qr-generate.dart';
import '../../../../components/circular-progress-bar/circular-progress-bar.dart';
import '../../../../components/linear-progress-bar/linear-progress-bar.dart';
import '../../../../components/map_ubication/map_ubication.dart';
import '../main/widgets/menu/menu.widget.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(        
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: CustomSliverDelegate(
                controller,
                expandedHeight: 120,
              ),
            ),
            SliverFillRemaining(
              child: SingleChildScrollView(
                child: Column(children: [
                  _levelBar(),
                  const ButtonsQr(),
                  const SizedBox(height: 20),
                  _consumeInfo(context, controller),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  static Widget _levelBar(){
    return const Padding(
      padding: EdgeInsets.only(bottom: 10, left: 10),
      child: LinearProgressBar(
        trailing: 'Platino',
      ),
    );
  }

  static Widget _consumeInfo(BuildContext context, ProfileController controller) {    
    return Column(children: [
      // List Header
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Mis Consumos',
            style: TextStyle(fontSize: 22)
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed("/consume");
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('Ver Todos', style: TextStyle(fontSize: 14)),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          )
        ],
      ).paddingSymmetric(horizontal: 10),
      const Divider(thickness: 2),
      _consumeList(context, controller)
    ]); 
  }

  // List
  static Widget _consumeList(BuildContext context, ProfileController controller){
    return SingleChildScrollView(
      child: ListView.separated(
        separatorBuilder: (context, index) => const Divider(thickness: 2),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: controller.compras.length,
        itemBuilder: (context, index) {          
          return GestureDetector(
              onTap: () {
                controller.consumeTap(context);
              },                        
              child: _consumeListItem(context, controller.compras[index])
          );
        }
      )
    );
  }

  static Widget _consumeListItem(BuildContext context, dynamic item){
    return ListTile(
    // shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(10)),
    // color: Colors.white,
    title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,                              
        children: [                                  
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 145,
                child: Text(
                  '${item['name']}', 
                  overflow: TextOverflow.ellipsis
                ),
              ),              
              Text('${item['fecha']}'),
            ]
          ),                                                                  
          Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                    '\$${item['costo']}.00'),
                Text(
                  '${item['puntos']} pts',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ]
          ),
        ],
      ),
      trailing: const Icon(Icons.arrow_forward_ios_sharp, size: 20),
    );
  }
}

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;
  final ProfileController controller;

  CustomSliverDelegate(this.controller, {
    required this.expandedHeight,
    this.hideTitleWhenExpanded = true,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarSize = expandedHeight - shrinkOffset;
    final cardTopPosition = expandedHeight / 2 - shrinkOffset;
    final proportion = 2 - (expandedHeight / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
    return SizedBox(
      height: expandedHeight + expandedHeight / 2,
      child: Stack(
        children: [
          SizedBox(
            height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
            child: AppBar(
                backgroundColor: const Color(0xff2222222),
                elevation: 0.0,
                title: Opacity(
                  opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
                  child: const Text("Mi perfil", style: TextStyle(color: Colors.white)),
                )),
          ),
          Positioned(
            left: 130.0,
            right: 0.0,
            top: 18,
            bottom: 0.0,
            child: Opacity(
              opacity: percent,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35 * percent),
                  child: const Text('Angel Velay',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white))),
            ),
          ),          
          Positioned(
            left: 130.0,
            top: 50,
            child: Opacity(
              opacity: percent,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30 * percent),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 180,
                      height: 40,
                      color: const Color(0xFF43578d),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const FadeInImage(
                            placeholder: AssetImage('assets/images/estrella.png'),
                            image: AssetImage('assets/images/estrella.png')
                          ),
                          Container(width: 10),
                          const Text('35 pts',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white
                            )
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          ),
          Positioned(
            left: 0.0,
            top: cardTopPosition > 0 ? cardTopPosition : 0,
            child: Opacity(
              opacity: percent,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30 * percent),
                child: const CircularProgressBar(
                  sizeProgressBar: 60.0, 
                  AvatarSize: 55, 
                  percent: 0.8,
                  
                ),
              ),
            ),
          ),
        ],
      ),
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

class ButtonsQr extends StatelessWidget {
  const ButtonsQr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        ButtonQRScanner(
          title: 'Generar QR',
          width: 70,
          height: 80,
          color: Color(0xff2222222),
        ),        
      ],
    );
  }
}