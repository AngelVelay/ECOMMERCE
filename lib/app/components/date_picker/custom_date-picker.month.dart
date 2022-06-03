// import 'package:flutter/material.dart';
// import 'package:flutter_holo_date_picker/date_picker.dart';

// // ignore: must_be_immutable
// class CustomDatePickerMonth extends StatelessWidget {
//   var datePickedValue = DateTime.now();
//   final date = TextEditingController(text: 'Ingresa una Fecha');
//   final String dateValues;
//   final Function(String date) dateValue;
//   final int lastDate;
//   final int initDate;
//   final bool isEnable;

//   CustomDatePickerMonth(this.dateValue,
//       {this.initDate = -30,
//       this.lastDate = 30,
//       this.dateValues = "",
//       this.isEnable = true}) {
//     date.text = dateValues;
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
//               controller: date,
//               readOnly: true,
//               textAlign: TextAlign.center,
//               enabled: false,
//               style: Theme.of(context).primaryTextTheme.subtitle1,
//             ),
//           ),
//         ],
//       ),
//       child: GestureDetector(
//           onTap: ()=>_dialogPicker(context),
//           child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Flexible(
//               child: Icon(
//                 Icons.calendar_today_outlined,
//                 color: Theme.of(context).hoverColor,
//                 size: 40,
//               ),
//             ),
//             Flexible(
//               child: TextField(
//                 controller: date,
//                 readOnly: true,
//                 textAlign: TextAlign.center,
//                 enabled: false,
//                 style: Theme.of(context).textTheme.subtitle1,
//               ),
//             ),
//           ],
//         )
//       ),
//     );
//   }


//   _dialogPicker(BuildContext context)async{
//       try {
//         datePickedValue = (await DatePicker.showSimpleDatePicker(
//         context,
//         titleText: 'Ingresa fecha',
//         initialDate: datePickedValue,
//         firstDate: DateTime.now().add(Duration(days: initDate)),
//     lastDate: DateTime.now().add(Duration(days: lastDate)),
//     dateFormat: "yyyy-MM",
//     locale: DatePicker.localeFromString("es"),
//     backgroundColor:
//     Theme.of(context).scaffoldBackgroundColor,
//     itemTextStyle: Theme.of(context).textTheme.subtitle2,
//     reverse: true,
//     cancelText: 'Cancelar',
//     confirmText: 'Aceptar',
//     textColor: Theme.of(context).highlightColor,
//     ))!;
//     print('DATE PICKER $datePickedValue');
//     // ignore: unnecessary_null_comparison
//     if (datePickedValue != null) {
//     date.text =
//     datePickedValue.toString().split(' ')[0].trim();
//     dateValue(date.text);
//     } else {
//     date.text = 'Ingresa fecha';
//     dateValue("");
//     }
//     } catch (e) {
//     print(e);
//     }
//   }
// }
