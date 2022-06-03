// import 'package:esmanagement/app/widgets/container/custom_container.widget.dart';
// import 'package:flutter/material.dart';

// // ignore: must_be_immutable
// class CustomHourPickerContainer extends StatelessWidget {
//   TimeOfDay? time = TimeOfDay.now();
//   TimeOfDay? picked = TimeOfDay.now();
//   final Function(TimeOfDay time) dateValue;
//   final String nameLabel;
//   var resultHour;

//   CustomHourPickerContainer(
//     this.dateValue, {
//     this.resultHour,
//     this.nameLabel = "Ingresa Fecha",
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () async {
//         picked = await showTimePicker(
//           context: context,
//           initialTime: time!,
//           cancelText: "Cancelar",
//           confirmText: "Aceptar",
//           helpText: "Ingresa una hora",
//         );
//         if (picked != null) {
//           resultHour = "${picked!.hour} ${picked!.minute}";
//           dateValue(picked!);
//         } else {
//           resultHour = "Ingresa Hora";
//         }
//       },
//       child: CustomContainer(labelText: nameLabel, children: [
//         Column(
//           children: [
//             Text(
//               resultHour,
//               style: Theme.of(context).textTheme.headline4,
//             )
//           ],
//         )
//       ]),
//     );
//   }
// }
