import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/main/views/details/detail.controller.dart';

class DetailPage extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del Premio'),
        backgroundColor: const Color(0xFF222222),
      ),
      body: Column(
        children: [          
          _image(controller),
          const SizedBox(height: 10),
          _center(context, controller),          
          const SizedBox(height: 40),
          _bottomButton(context, controller)
        ]
      ),
    );
  }

  static Widget _image(DetailController controller){
    return SizedBox(
      width: double.infinity,
      child: FadeInImage(
        fit: BoxFit.contain,
        placeholder: const AssetImage('assets/images/loading.gif'),
        image: NetworkImage(controller.imageUrl),
      )
    );
  }

  static Widget _center(BuildContext context, DetailController controller){
    return Column(
      children: [
        Text(controller.name.toString(),
            style: const TextStyle(
              fontSize: 25
            )
        ),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, ',
              style: TextStyle(fontSize: 16)),
        ),
      ],
    );
  }

  static Widget _bottomButton(BuildContext context, DetailController controller){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15),      
      child: GestureDetector(
        onTap: () {
          Get.toNamed('generate-qr', arguments: { "type" : "change" });
        },
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xFF222222),
            borderRadius: BorderRadius.circular(20)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [              
              const Icon(
                Icons.qr_code_2,
                color: Colors.white,
              ),
              const SizedBox(width: 10),
              Text(
                'Canjear ${controller.points} pts',
                style: const TextStyle(color: Colors.white, fontSize: 24),
              )
            ]
          ),
        ),
      ),
    );        
  } 
}
