// import 'package:flutter/material.dart';
// import 'package:flutter_holo_date_picker/date_picker.dart';
// import 'package:intl/intl.dart';
// // ignore: must_be_immutable
// class CustomDatePicker extends StatelessWidget {
//   var datePickedValue = DateTime.now();
//   final dateController = TextEditingController(text: 'Ingresa una Fecha');
//   final String dateValues;
//   final Function(String date) setDateValue;
//   final int lastDate;
//   final int initDate;
//   final bool isEnable;
//   final String dateFormat;
//   final DateFormat formatterDate =DateFormat('yyyy/MM/dd');

//   CustomDatePicker(this.setDateValue,
//       {this.initDate = -30,
//       this.lastDate = 30,
//       this.dateValues = "",
//       this.isEnable = true,
//       this.dateFormat="yyyy-MM-dd"}) {
//     dateController.text = dateValues;
//     dateController.text = formatterDate.format(DateTime.parse(dateController.text));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Visibility(
//       visible: isEnable,
//       replacement: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Flexible(
//             child: TextButton(
//                 child: Icon(
//                   Icons.calendar_today_outlined,
//                   color: Theme.of(context)
//                       .floatingActionButtonTheme
//                       .backgroundColor,
//                   size: 40,
//                 ),
//                 onPressed: null),
//           ),
//           Flexible(
//             child: TextField(
//               controller: dateController,
//               readOnly: true,
//               textAlign: TextAlign.center,
//               enabled: false,
//               style: Theme.of(context).primaryTextTheme.subtitle1,
//             ),
//           ),
//         ],
//       ),
//       child: GestureDetector(
//           onTap: () => _dialogPicker(context),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Flexible(
//                 child: Icon(
//                   Icons.calendar_today_outlined,
//                   color: Theme.of(context).hoverColor,
//                   size: 40,
//                 ),
//               ),
//               Flexible(
//                 child: TextField(
//                   controller: dateController,
//                   readOnly: true,
//                   textAlign: TextAlign.center,
//                   enabled: false,
//                   style: Theme.of(context).textTheme.subtitle1,
//                 ),
//               ),
//             ],
//           )),
//     );
//   }

//   _dialogPicker(BuildContext context) async {
//     try {
//       datePickedValue = (await DatePicker.showSimpleDatePicker(
//         context,
//         titleText: 'Ingresa fecha',
//         initialDate: datePickedValue,
//         firstDate: DateTime.now().add(Duration(days: initDate)),
//         lastDate: DateTime.now().add(Duration(days: lastDate)),
//         dateFormat: dateFormat,
//         locale: DatePicker.localeFromString("es"),
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         itemTextStyle: Theme.of(context).textTheme.subtitle2,
//         reverse: true,
//         cancelText: 'Cancelar',
//         confirmText: 'Aceptar',
//         textColor: Theme.of(context).highlightColor,
//       ))!;
//       //print('DATE PICKER $datePickedValue');
//       // ignore: unnecessary_null_comparison
//       if (datePickedValue != null) {
//         dateController.text = datePickedValue.toString().split(' ')[0].trim();
//         setDateValue(dateController.text);
//       } else {
//         dateController.text = 'Ingresa fecha';
//         setDateValue("");
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
// }
