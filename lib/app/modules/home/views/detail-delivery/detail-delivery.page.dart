import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jexpoints/app/modules/cart/cart.module.dart';

import 'detail-delivery.controller.dart';

class DeliveryDetailPage extends GetView<DetailDeliveryController> {
  const DeliveryDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailDeliveryController>(
        builder: (value) => SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white,
                body: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: _googleMaps(),
                    ),
                    Column(
                      children: [
                        const Spacer(),
                        _cardOrderInfo(context),
                      ],
                    ),
                    // _iconMyLocation(),
                  ],
                ),
              ),
            ));
  }

  Widget _cardOrderInfo(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.grey[900], boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 4,
            blurRadius: 6,
            offset: Offset(0, 3))
      ]),
      child: Column(
        children: [
          _listTileAddress(
              'Av. Vicente Suárez # 114', 'Total: \$ 239', ' 30 min'),
          const Divider(color: Colors.white, endIndent: 30, indent: 30),
          _clientInfo(),
          // _buttonAccept(context)
        ],
      ),
    );
  }

  Widget _clientInfo() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
      child: Row(
        children: [
          _imageClient(),
          const SizedBox(width: 10),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CONTACTA A TU REPARTIDOR',
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Juan Luis Guerra Orendain',
                        style: TextStyle(fontSize: 12.sp, color: Colors.white),
                      ),
                      Text(
                        '+52 5689457812',
                        style: TextStyle(fontSize: 12.sp, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 20.sp,
                          ),
                          Text(
                            '4.5',
                            style:
                                TextStyle(fontSize: 12.sp, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: const [
                  Icon(
                    Icons.message,
                    color: Colors.white,
                    size: 20,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _imageClient() {
    return Container(
      height: 80,
      width: 80,
      // padding: EdgeInsets.all(2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: const FadeInImage(
          image: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPlFxRo99ZEh-jQFexnZizgCtNJVC-8MYf_DUtnPziUMxQOxOSIDqhRwe8fJMN3sUisz0&usqp=CAU'),
          fit: BoxFit.cover,
          fadeInDuration: Duration(milliseconds: 50),
          placeholder: NetworkImage(
              'http://www.gifde.com/gif/otros/decoracion/cargando-loading/cargando-loading-041.gif'),
        ),
      ),
    );
  }

  Widget _listTileAddress(String title, String subtitle, String trailing) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontSize: 13, color: Colors.white),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: Colors.white),
        ),
        trailing: Text(
          trailing,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _iconCenterMyLocation() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.centerRight,
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Card(
          shape: CircleBorder(),
          color: Colors.white,
          elevation: 4,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.location_searching,
              color: Colors.grey[600],
              size: 20,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonAccept(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 30, right: 30),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/delivery-progress');
        },
        child: const Text(
          'Iniciar Entrega',
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            padding: EdgeInsets.all(15)),
      ),
    );
  }

  Widget _iconMyLocation() {
    return Container(
      margin: EdgeInsets.only(bottom: 40),
      child: Center(
        child: Image.asset(
          'assets/images/marker.png',
          width: 65,
          height: 65,
        ),
      ),
    );
  }

  Widget _googleMaps() {
    return GoogleMap(
      initialCameraPosition: controller.initialPosition,
      mapType: MapType.normal,
      onMapCreated: controller.onMapCreate,
      myLocationButtonEnabled: false,
      myLocationEnabled: false,
      markers: Set<Marker>.of(controller.markers.values),
      polylines: controller.polylines,
    );
  }
}
