import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:jexpoints/app/modules/main/views/main/main.page.dart';

class BillingLayout extends StatelessWidget {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  BillingLayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Facturación'),
        ),
        body: _gifConfirm());
  }
}

Widget _gifConfirm() {
  return Center(
      child: AnimatedSplashScreen(
          splashIconSize: 500,
          duration: 3000,
          splash: SizedBox(
            height: 600,
            child: Column(
              children: const [
                Expanded(
                  child: FadeInImage(
                      height: 600,
                      width: 600,
                      fit: BoxFit.cover,
                      placeholder: AssetImage('assets/images/billing.gif'),
                      image: AssetImage('assets/images/billing.gif')),
                ),
                Text('Factura enviada a su correo',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          // nextScreen: const HomePage(),
          nextScreen: const MainPage(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: const Color(0xFFffffff)));
}
// Widget _billing(BillingApplyController controller) {
//   final validController = Get.find<BillingController>();
//   return Obx((() {
//     return Column(
//       children: [
//         Center(
//           child: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Container(
//                       width: 120.0,
//                       height: 50.0,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(30.0),
//                         border: Border.all(width: 1.0, color: Colors.green),
//                       ),
//                       child: Center(
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             controller.selectedId$.value.toString(),
//                             style: const TextStyle(color: Colors.green),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Row(
//                       children: <Widget>[
//                         Column(
//                           children: const [
//                             Text(
//                               'Esperanza',
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             // Text(
//                             //   validController.branchList.value,

//                             //   style: const TextStyle(color: Colors.black),
//                             // ),
//                           ],
//                         ),
//                         const Padding(
//                           padding: EdgeInsets.only(left: 8.0),
//                           child: Icon(
//                             Icons.location_on,
//                             color: Colors.pink,
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.only(top: 20.0),
//                   child: Text(
//                     'Factura Electronica',
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 20.0,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 25.0),
//                   child: Column(
//                     children: [
//                       ListTile(
//                         leading: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: const [
//                             Text(
//                               'Folio Fiscal',
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 15.0,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             Text(
//                               '45641357432',
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 15.0,
//                               ),
//                             ),
//                           ],
//                         ),
//                         trailing: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                               'No. de Ticket',
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 15.0,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             Text(
//                               validController.ticket.value.text,
//                               style: const TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 15.0,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       ListTile(
//                         leading: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                               'RFC Receptor',
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 15.0,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             Text(
//                               controller.rfc.value.text,
//                               style: const TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 15.0,
//                               ),
//                             ),
//                           ],
//                         ),
//                         trailing: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                               'Razon Social',
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 15.0,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             Text(
//                               controller.razonSocial.value.text,
//                               style: const TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 15.0,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       ListTile(
//                         leading: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                               'Importe',
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 15.0,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             Text(
//                               '\$ ${validController.monto.value.text}',
//                               style: const TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 15.0,
//                               ),
//                             ),
//                           ],
//                         ),
//                         trailing: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: const [
//                             Text(
//                               'Total a Pagar \n(Iva incluido)',
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 15.0,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             Text(
//                               '230',
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 15.0,
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Center(
//                     child: Expanded(
//                         child: QrImage(
//                       data: 'https://www.google.com',
//                       gapless: true,
//                       size: 120.0,
//                       errorCorrectionLevel: QrErrorCorrectLevel.H,
//                     )),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }));
// }

// Widget _buttonSave(context) {
//   return Padding(
//     padding: const EdgeInsets.all(20.0),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         CustomButton(
//           text: 'Guardar Factura',
//           onPressed: () {},
//           size: 10,
//         ),
//         const SizedBox(
//           width: 20.0,
//         ),
//         CustomButton(
//           text: 'Enviar Factura',
//           onPressed: () {},
//           size: 10,
//         )
//       ],
//     ),
//   );
// }
