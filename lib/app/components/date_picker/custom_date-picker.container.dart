// import 'package:esmanagement/app/widgets/container/custom_container.widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';

// // ignore: must_be_immutable
// class CustomDatePickerContainer extends StatelessWidget {
//   DateTime? datePickedValue = DateTime.now();
//   String date = 'Ingresa fecha';
//   final String dateValues;
//   final Function(DateTime date) dateValue;
//   final int lastDate;
//   final int initDate;
//   final bool isEnable;
//   final String dateFormat;
//   final String nameLabel;

//   CustomDatePickerContainer(this.dateValue,
//       {this.nameLabel = "Ingresa Fecha",
//       this.initDate = -30,
//       this.lastDate = 30,
//       this.dateValues = "",
//       this.isEnable = true,
//       this.dateFormat = "yyyy-MM-dd"}) {
//     date = dateValues;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () async {
//         datePickedValue = (await DatePicker.showSimpleDatePicker(
//           context,
//           titleText: 'Ingresa fecha',
//           initialDate: datePickedValue,
//           firstDate: DateTime.now().add(Duration(days: initDate)),
//           lastDate: DateTime.now().add(Duration(days: lastDate)),
//           dateFormat: dateFormat,
//           locale: DatePicker.localeFromString("es"),
//           backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//           itemTextStyle: Theme.of(context).textTheme.subtitle2,
//           reverse: true,
//           cancelText: 'Cancelar',
//           confirmText: 'Aceptar',
//           textColor: Theme.of(context).highlightColor,
//         ));
//         if (datePickedValue != null) {
//           date = datePickedValue.toString().split(' ')[0].trim();
//           dateValue(datePickedValue!);
//         } else {
//           date = 'Ingresa fecha';
//           dateValue(DateTime(0));
//         }
//       },
//       child: CustomContainer(labelText: nameLabel, children: [
//         Column(
//           children: [
//             Text(
//               date,
//               style: Theme.of(context).textTheme.headline4,
//             )
//           ],
//         )
//       ]),
//     );
//   }
// }
