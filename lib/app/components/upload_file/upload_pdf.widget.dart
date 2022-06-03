// import 'dart:async';
// import 'package:esmanagement/app/widgets/app_bar/simple_app_bar/simple_app_bar.widget.dart';
// import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
// import 'package:flutter/material.dart';


// class UploadPDF extends StatelessWidget {

//   final String nameScreen;
//   final String url;
//   UploadPDF(this.nameScreen,this.url);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: SimpleAppBar(title: '$nameScreen'),
//       body: PDF(
//           fitEachPage: true,
//           enableSwipe: true,
//           swipeHorizontal: true,
//           autoSpacing: false,
//           onViewCreated: (PDFViewController pdfController) async {
//             Completer().complete(pdfController);
//           },
//           preventLinkNavigation: false)
//           .cachedFromUrl(url,
//         placeholder: (progress) => Center(
//             child: Text(
//               '$progress %',
//               style: TextStyle(fontSize: 16),
//             )),
//         errorWidget: (error) => Center(
//             child: Text(
//               'Archivo no disponible',
//               style: TextStyle(fontSize: 16),
//             )),
//       ),
//     );
//   }
// }