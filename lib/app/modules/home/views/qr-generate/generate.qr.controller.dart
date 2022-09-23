import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/button/custom_button.widget.dart';

class QrGenerateController extends GetxController {  
  final String data = "Pastel de Chocolate comprado en la Esperanza Sucursal Valle";


  scanOk(BuildContext context){
      
    var type = Get.arguments['type'];
    if (type == 'accumulate'){
      Get.defaultDialog(
        title: "¡¡¡FELICIDADES!!!",        
        titleStyle: const TextStyle(color: Colors.white, fontSize: 25),
        backgroundColor: const Color(0xFF222222),
        // middleTextStyle: const TextStyle(color: Colors.black54),
        content: Center(
          child: Column(
            children: [
              const FadeInImage(
                fit: BoxFit.cover,                
                placeholder: AssetImage('assets/images/moneda.gif'),
                image: AssetImage('assets/images/moneda.gif')
              ),
              const Text('Ganaste',
                style: TextStyle(
                fontSize: 25,
                color: Colors.white70)
              ),
              const Text('30 pts',
                style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white)
              ),
              const SizedBox(height: 20,),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 60),    
                child: CustomButton(
                    text: 'Aceptar'.toUpperCase(),
                    onPressed: (){          
                      close(context);
                    }
                ),
              )
              // Center(
              //   child: CustomButton(text: 'Aceptar', onPressed: () => close(context), size: 20,)
              // )              
            ],
          )
        )
      );
    }    
  }

  close(BuildContext context){
    Navigator.pop(context);
    Get.back();
  }
}

