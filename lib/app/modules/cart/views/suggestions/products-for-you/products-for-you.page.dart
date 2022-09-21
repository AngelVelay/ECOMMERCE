import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jexpoints/app/components/circle_icon_button/circle_icon_button.dart';
import 'package:jexpoints/app/modules/home/views/tab-home/components/cart-controls.widget.dart';
import 'package:jexpoints/app/modules/home/views/tab-home/tab-home.controller.dart';
import 'package:jexpoints/app/modules/main/entities/product.type.dart';

class ProductsForYou extends GetView<HomeController> {
  const ProductsForYou({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 230,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _header(),
          const SizedBox(height: 10),
          _flyerList(),
        ],
      ),
    );
  }

  Widget _header() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image.asset(
              //   'assets/images/top_semanal.png',
              //   height: 35,
              //   fit: BoxFit.cover,
              // ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('PRODUCTOS ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Montserrat')),
                Text(' PARA TI',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.italic,
                        fontSize: 12.sp,
                        color: Colors.white)),
              ]),
              const SizedBox(height: 10),
            ],
          )),
    );
  }

  Widget _flyerList() {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Obx(() {
          return CarouselSlider.builder(
            itemCount: controller.flyerList$.length,
            itemBuilder: (context, index, realIndex) {
              return controller.flyerList$.isNotEmpty
                  ? _flyerItem(controller.flyerList$[index])
                  : Container();
            },
            options: CarouselOptions(
              height: 150,
              autoPlay: true,
              scrollDirection: Axis.horizontal,
            ),
          );
        })
      ],
    );
  }

  Widget _flyerItem(item) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 11),
        child: SizedBox(
            width: 600,
            height: 600,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: GestureDetector(
                onTap: () => controller.toFlyer(item),
                child: FadeInImage(
                    width: 600,
                    fit: BoxFit.fill,
                    placeholder: const NetworkImage(
                        'https://acegif.com/wp-content/uploads/loading-11.gif'),
                    image: NetworkImage(item['fileLink'] ??
                        'https://w7.pngwing.com/pngs/819/548/png-transparent-photo-image-landscape-icon-images-thumbnail.png')),
              ),
            )));
  }

//   Widget _list(BuildContext context) {
//     return Obx(() {
//       return Expanded(
//           child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: controller.favoriteProducts$.length,
//               itemBuilder: (_, int index) {
//                 return _item(context, controller.favoriteProducts$[index]);
//               }));
//     });
//   }

//   Widget _item(BuildContext context, Product item) {
//     return Container(
//       width: 130,
//       height: 190,
//       margin: const EdgeInsets.symmetric(horizontal: 5),
//       child: Column(
//         children: [
//           GestureDetector(
//             onTap: () => controller.toProductDetail(item),
//             child: ClipRRect(
//                 borderRadius: BorderRadius.circular(0),
//                 child: Stack(children: [
//                   FadeInImage(
//                     placeholder: const NetworkImage(
//                         'https://acegif.com/wp-content/uploads/loading-11.gif'),
//                     image: NetworkImage(item.imageLink),
//                     width: double.infinity,
//                     height: 130,
//                     fit: BoxFit.cover,
//                   ),
//                   // const Align(
//                   //     alignment: Alignment.bottomRight,
//                   //     child: Icon(Icons.add_circle_rounded,
//                   //         color: Colors.white, size: 50)),
//                 ])),
//           ),
//           Text(item.name,
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 15,
//                   fontFamily: 'Montserrat-Bold')),
//           Text(
//             '\$ ${item.price}',
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//                 fontSize: 15,
//                 fontFamily: 'Montserrat-Bold',
//                 color: Colors.white),
//           ),
//           HomeCartControls(item)
//         ],
//       ),
//     );
//   }
// }
}
