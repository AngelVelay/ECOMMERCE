import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/modules/cart/views/checkout/checkout.controller.dart';
import 'package:jexpoints/app/shared/values/mock-data.dart';

import '../../main/entities/branch.type.dart';
import 'qr_pickup.page.dart';

class PickUpPage extends GetView<CheckOutController> {
  @override
  const PickUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_list(context)],
    );
  }

  Widget _list(BuildContext context) {
    return Column(
      children: MockData.branchList.map((a) {
        return _listItem(a, context);
      }).toList(),
    );
  }

  Widget _listItem(Branch item, BuildContext context) {
    return Row(children: [
      Radio<Branch>(
        value: item,
        groupValue: MockData.branchList.isNotEmpty
            ? MockData.branchList[0]
            : Branch.fromVoid(),
        onChanged: (value) {
          MockData.branchList[0] = value as Branch;
          Navigator.of(context, rootNavigator: true).push(
            MaterialPageRoute(
              builder: (context) => QrPickUp(),
            ),
          );
        },
      ),
      Flexible(child: ExpansionTilehoUR(item, context))
    ]);
  }

  Widget ExpansionTilehoUR(Branch item, BuildContext context) {
    return ExpansionTile(
      title: Text(item.name,
          style: const TextStyle(fontSize: 12, color: Colors.black)),
      children: [
        DropdownButtonFormField<String>(
          hint: Padding(
            padding: const EdgeInsets.only(left: 80.0),
            child: const Text('Recolección',
                style: TextStyle(color: Colors.black)),
          ),
          focusColor: Colors.white,
          isExpanded: true,
          items: MockData.branchList.map<DropdownMenuItem<String>>((value) {
            return DropdownMenuItem<String>(
              value: '${value.id}',
              child: Text(
                value.working_hours.entries.first.value
                    .toString()
                    .toUpperCase(),
                style: const TextStyle(color: Colors.black),
              ),
            );
          }).toList(),
          onChanged: (value) =>
              MockData.branchList.length = value!.toString().length,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 2.0,
              ),
            ),
            labelText: '',
            labelStyle: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _branchHourSelect() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonFormField<String>(
        hint: const Text('Horario', style: TextStyle(color: Colors.white)),
        focusColor: Colors.white,
        isExpanded: true,
        items: MockData.branchList.map<DropdownMenuItem<String>>((value) {
          return DropdownMenuItem<String>(
            value: '${value.id}',
            child: Text(
              value.working_hours.entries.first.value.toString().toUpperCase(),
              style: const TextStyle(color: Colors.black),
            ),
          );
        }).toList(),
        onChanged: (value) =>
            MockData.branchList.length = value!.toString().length,
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 2.0,
            ),
          ),
          labelText: '',
          labelStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

  // Widget _button(BuildContext context) {
  //   return Container(
  //       height: 60,
  //       child: CustomRoundedButton(
  //         text: 'Agrega una nueva dirección',
  //         onPressed: () {
  //           Navigator.push(context, MaterialPageRoute(builder: (context) {
  //             return AddAdressPage();
  //           }));
  //         },
  //       ));
  // }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:jexpoints/app/modules/cart/views/checkout/checkout.controller.dart';
// import 'package:jexpoints/app/modules/cart/views/map-add-address/map-add-address.page.dart';

// class HomeAddressSelect extends GetView<CheckOutController> {
//   @override
//   const HomeAddressSelect({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [_list(context), _button(context)],
//       ),
//     );
//   }

//   Widget _list(BuildContext context) {
//     return Column(
//       children: controller.addressList$.map((a) {
//         return _listItem(a, context);
//       }).toList(),
//     );
//   }

//   Widget _listItem(Address item, BuildContext context) {
//     return Row(children: [
//       Radio<Address>(
//         value: item,
//         groupValue: controller.selectedAddress$.value,
//         onChanged: (value) {
//           controller.addressSelect(value as Address, context);
//           Navigator.of(context, rootNavigator: true).pop();
//         },
//       ),
//       const SizedBox(width: 10),
//       Text('${item.street} No.${item.outsideNumber}, CP. ${item.zipCode}',
//           style: const TextStyle(fontSize: 12, color: Colors.black)),
//     ]);
//   }

//   Widget _button(BuildContext context) {
//     return Container(
//         height: 60,
//         child: CustomRoundedButton(
//           text: 'Agrega una nueva dirección',
//           onPressed: () {
//             Navigator.push(context, MaterialPageRoute(builder: (context) {
//               return AddAdressPage();
//             }));
//           },
//         ));
//   }
// }
