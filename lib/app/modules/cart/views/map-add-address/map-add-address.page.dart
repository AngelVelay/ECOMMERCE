import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../components/form-controls/custom-rounded-button.widget.dart';
import '../../services/address/address.contract.dart';
import 'map-add-adress.controller.dart';

class AddAdressPage extends StatelessWidget {
  AddAdressController con = Get.put(AddAdressController());

  AddAdressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            title: const Text(
              'Ubica tu direccion en el mapa',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Stack(
            children: [
              _googleMaps(),
              _iconMyLocation(),
              _cardAddress(),
              _buttonAccept(context)
            ],
          ),
        ));
  }

  Widget _buttonAccept(BuildContext context) {
    return Container(
        alignment: Alignment.bottomCenter,
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 30),
        child: SizedBox(
          height: 60,
          child: CustomRoundedButton(
            text: 'Agregar nueva dirección',
            onPressed: () => con.selectRefPoint(context),
          ),
        ));
  }

  Widget _cardAddress() {
    return Container(
      width: double.infinity,
      alignment: Alignment.topCenter,
      margin: EdgeInsets.symmetric(vertical: 30),
      child: Card(
        color: Colors.grey[800],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            con.addressName.value,
            style: const TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
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
      initialCameraPosition: con.initialPosition,
      mapType: MapType.normal,
      onMapCreated: con.onMapCreate,
      myLocationButtonEnabled: false,
      myLocationEnabled: false,
      onCameraMove: (position) {
        con.initialPosition = position;
      },
      onCameraIdle: () async {
        await con
            .setLocationDraggableInfo(); // EMPEZAR A OBTNER LA LAT Y LNG DE LA POSICION CENTRAL DEL MAPA
      },
    );
  }
}
