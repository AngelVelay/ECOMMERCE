// import 'package:esmanagement/data/models/entities/branches/branch.model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';

// // ignore: must_be_immutable
// class CustomTypeAHeadField extends StatelessWidget {
//   final Function(int?) onchange;
//   final String labelText;
//   late int selectedId;
//   final TextEditingController editingController;
//   final Function(String pattern) onFilter;

//   CustomTypeAHeadField(
//       {required this.editingController,
//       this.labelText = "Sucursal",
//       required this.onchange,
//       required this.selectedId,
//       required this.onFilter});

//   @override
//   Widget build(BuildContext context) {
//     return TypeAheadField<Branch>(
//       textFieldConfiguration: TextFieldConfiguration(
//           autofocus: false,
//           style: Theme.of(context).textTheme.subtitle2,
//           controller: editingController,
//           decoration: InputDecoration(
//             suffixIcon: editingController.text.isNotEmpty
//                 ? IconButton(
//                     icon: Icon(
//                       Icons.cancel,
//                       color: Colors.white54,
//                     ),
//                     onPressed: () {
//                       selectedId = 0;
//                       editingController.text = "";
//                     })
//                 : Text(""),
//             labelText: labelText,
//             border: OutlineInputBorder(
//               borderSide: const BorderSide(color: Colors.white, width: 1.0),
//               borderRadius: BorderRadius.circular(16.5),
//             ),
//           )),
//       suggestionsCallback: (pattern) async => await onFilter(pattern),
//       autoFlipDirection: false,
//       itemBuilder: (context, suggestion) {
//         return ListTile(
//           leading: Icon(
//             Icons.storefront,
//             color: Colors.white10,
//           ),
//           title: Text(suggestion.idUnidadOperativa!=0?suggestion.idUnidadOperativa.toString():suggestion.descripcion),
//           subtitle: Text(suggestion.idUnidadOperativa!=0?suggestion.descripcion:""),
//         );
//       },
//       onSuggestionSelected: (suggestion) {
//         onchange(suggestion.idUnidadOperativa);
//         if(suggestion.idUnidadOperativa==0){
//           editingController.text = suggestion.descripcion;
//         }else editingController.text = "${suggestion.idUnidadOperativa} - ${suggestion.descripcion}";
//       },
//     );
//   }
// }
