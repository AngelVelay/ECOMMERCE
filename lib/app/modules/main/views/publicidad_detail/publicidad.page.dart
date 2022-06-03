import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:jexpoints/app/modules/main/views/publicidad_detail/publicidad.controller.dart';

class PublicidadPage extends GetView<PublicidadController> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Publicidad'),
        backgroundColor: const Color(0xFF222222),
      ),
      body: Column(        
        children: [
          _header(controller),          
          _center(),          
          _bottomButton(context)
        ],
      ),
    );

  }

  static Widget _header(PublicidadController controller){
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: FadeInImage(
          fit: BoxFit.contain,
          placeholder: const AssetImage('assets/images/loading.gif'),
          image: NetworkImage(controller.image.toString()),
        )
      ),
    );
  }

  static Widget _center(){
    return Column(
      children: const [
        Text('Lorem Ipsum',
          style: TextStyle(
              fontSize: 25
          )
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, ',
              style: TextStyle(fontSize: 16)),
        ),
      ],
    );
  }

  static Widget _bottomButton(BuildContext context){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 205,
      child: Row(
        children: [                  
          Expanded(
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xFF222222),
                borderRadius: BorderRadius.circular(20)
              ),
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.share_sharp,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Compartir Publicidad',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    )
                  ]
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}
