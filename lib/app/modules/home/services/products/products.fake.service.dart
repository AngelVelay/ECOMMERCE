// import 'package:flutter/foundation.dart';
// import 'package:jexpoints/app/modules/main/entities/product.type.dart';
// import 'package:jexpoints/app/modules/main/services/products/products.contract.dart';

// class ProductsFakeService implements IProductsService {
//   final _products = <Product>[
//     Product(
//       id: "1",
//       imageLink:
//           'https://file.adomicil.io/esperanza.tr3sco.net/_files/images/product/oreja-normal-0754907696393741.jpg',
//       name: 'OREJA',
//       price: 9.00,
//       cartValue: 0.obs,
//       isFavorite: false,
//       topRate: 3,
//       points: 50,
//       categoryId: "3",
//       isActive: true,
//       imageFileId: '',
//       description: '',
//     ),
//   ];

//   final _productsVariables = <Product>[
//     Product(
//       id: "10",
//       imageLink: 'assets/images_products/pollo2.png',
//       name: 'Pollo Rostizado',
//       price: 40,
//       cartValue: 0,
//       isFavorite: true,
//       topRate: 2,
//       points: 21,
//       categoryId: "7",
//       isActive: true,
//       imageFileId: '',
//       description: '',
//     ),
//   ];

//   List<Product> productsPack = [];

//   @override
//   Future<List<Product>> getProductsVariable() async {
//     return _productsVariables.toList();
//   }

//   @override
//   Future<List<Product>> getTop() async {
//     return _products.where((element) => element.topRate > 0).take(10).toList();
//   }

//   @override
//   Future<List<Product>> search(String keyword) async {
//     keyword = keyword.toLowerCase();
//     var result =
//         _products.where((e) => e.name.toLowerCase().contains(keyword)).toList();
//     print(result);
//     return result;
//   }

//   @override
//   Future<List<Product>> getFavorites() async {
//     return _products.where((element) => element.isFavorite!).toList();
//   }

//   @override
//   Future<List<Product>> getByCategory(String categoryId) async {
//     return _products
//         .where((element) => element.categoryId == categoryId)
//         .toList();
//   }
// }
