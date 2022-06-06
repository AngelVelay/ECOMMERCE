import 'package:flutter/material.dart';

import '../../modules/main/views/cart-shopping/shopipng-cart.page.dart';
import '../points/points.widget.dart';

class CartShopping extends StatelessWidget {
  const CartShopping({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ModalBottomSheetCart(context);
      },
      child: Stack(children: [
        // Image(
        //     width: 50,
        //     height: 50,
        //     image: AssetImage('assets/images/cart-shop.png')),
        Icon(
          Icons.shopping_cart,
          color: Colors.white,
          size: 40,
        ),
        PointsViewer(size: 20, value: '1', fontSize: 15),
      ]),
    );
  }
}

Future<dynamic> ModalBottomSheetCart(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      isScrollControlled: true,
      builder: (context) {
        return Container(
            height: MediaQuery.of(context).size.height * 0.80,
            child: ShoppingCart());
      });
}
