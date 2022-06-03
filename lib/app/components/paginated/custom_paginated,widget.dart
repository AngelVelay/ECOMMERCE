// import 'package:esmanagement/data/models/enums/paginate_direction.enum.dart';
// import 'package:flutter/material.dart';

// class CustomPaginated extends StatelessWidget {
//   final int offset;
//   final bool nextVisible;
//   final Function(PaginateDirection direction) onPress;
//   CustomPaginated(
//       {required this.offset, required this.nextVisible, required this.onPress});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.black87,
//       height: MediaQuery.of(context).size.height * .06,
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Spacer(),
//           offset > 0
//               ? Container(
//                   width: 80,
//                   child: GestureDetector(
//                       child: Icon(
//                         Icons.chevron_left,
//                         color: Colors.white,
//                         size: 40,
//                       ),
//                       onTap: () => onPress(PaginateDirection.previous)))
//               : Container(width: 80),
//           nextVisible
//               ? Container(
//                   width: 80,
//                   child: GestureDetector(
//                       child: Icon(
//                         Icons.chevron_right,
//                         color: Colors.white,
//                         size: 40,
//                       ),
//                       onTap: () => onPress(PaginateDirection.next)))
//               : Container(width: 80),
//           Spacer()
//         ],
//       ),
//     );
//   }
// }
