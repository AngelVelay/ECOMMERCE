import 'package:flutter/foundation.dart';
import 'package:jexpoints/app/modules/main/entities/product.type.dart';
import 'package:jexpoints/app/modules/main/services/products/products.contract.dart';

class ProductsFakeService implements IProductsService {
  final _products = <Product>[
    Product(
        id: 1,
        url:
            'https://file.adomicil.io/esperanza.tr3sco.net/_files/images/product/oreja-normal-0754907696393741.jpg',
        name: 'OREJA',
        price: 9.00,
        cartValue: 0,
        isFavorite: false,
        topRate: 3,
        points: 50,
        category: Categories.panderia),
    Product(
        id: 2,
        url:
            'https://file.adomicil.io/esperanza.tr3sco.net/_files/images/product/bigote-00719347917809779.jpg',
        name: 'BIGOTE',
        price: 9.00,
        cartValue: 0,
        isFavorite: true,
        topRate: 4,
        points: 65,
        category: Categories.panderia),
    Product(
        id: 3,
        url:
            'https://file.adomicil.io/esperanza.tr3sco.net/_files/images/product/mantecada-0401739096921747.jpg',
        name: 'MANTECADA VAINILLA',
        price: 80.00,
        cartValue: 0,
        isFavorite: false,
        topRate: 5,
        points: 14,
        category: Categories.panderia),
    Product(
        id: 4,
        url:
            'https://file.adomicil.io/esperanza.tr3sco.net/_files/images/product/supremo-chocolate-0145492964491943.jpg',
        name: 'SUPREMO DE CHOCOLATE',
        price: 10,
        cartValue: 0,
        isFavorite: false,
        topRate: 3,
        points: 32,
        category: Categories.panderia),
    Product(
        id: 5,
        url:
            'https://file.adomicil.io/esperanza.tr3sco.net/_files/images/product/mms-00650849812967167.jpg',
        name: 'M&M\'S',
        price: 40,
        cartValue: 0,
        isFavorite: true,
        topRate: 5,
        points: 21,
        category: Categories.panderia),
    Product(
        id: 4,
        url:
            'https://file.adomicil.io/esperanza.tr3sco.net/_files/images/product/supremo-chocolate-0145492964491943.jpg',
        name: 'SUPREMO DE CHOCOLATE',
        price: 10,
        cartValue: 0,
        isFavorite: false,
        topRate: 4,
        points: 32,
        category: Categories.pasteleria),
    Product(
        id: 5,
        url:
            'https://file.adomicil.io/esperanza.tr3sco.net/_files/images/product/mms-00650849812967167.jpg',
        name: 'M&M\'S',
        price: 40,
        cartValue: 0,
        isFavorite: true,
        topRate: 4,
        points: 21,
        category: Categories.pasteleria),
    Product(
        id: 6,
        url:
            'http://esperanzaapps.tr3sco.net/Content/_files/images/productarroz2-0776510898851096.png',
        name: 'Arroz',
        price: 9.00,
        cartValue: 0,
        isFavorite: false,
        topRate: 0,
        points: 50,
        category: Categories.rosticeria),
    Product(
        id: 7,
        url:
            'http://esperanzaapps.tr3sco.net/Content/_files/images/productfusilli2-0199744570162028.png',
        name: 'Fusili',
        price: 9.00,
        cartValue: 0,
        isFavorite: true,
        topRate: 4,
        points: 65,
        category: Categories.rosticeria),
    Product(
        id: 8,
        url:
            'http://esperanzaapps.tr3sco.net/Content/_files/images/productpure2-0527850264929165.png',
        name: 'Pure de papa',
        price: 80.00,
        cartValue: 0,
        isFavorite: false,
        topRate: 40,
        points: 14,
        category: Categories.rosticeria),
    Product(
        id: 9,
        url:
            'http://esperanzaapps.tr3sco.net/Content/_files/images/productfrijoles2-0768104486059446.png',
        name: 'frijoles',
        price: 10,
        cartValue: 0,
        isFavorite: false,
        topRate: 40,
        points: 32,
        category: Categories.rosticeria),
    Product(
        id: 10,
        url:
            'http://esperanzaapps.tr3sco.net/Content/_files/images/productpollo-ranchero-0404352748489172.jpg',
        name: 'Pollo Rostizado',
        price: 40,
        cartValue: 0,
        isFavorite: true,
        topRate: 40,
        points: 21,
        category: Categories.rosticeria),
    Product(
        id: 11,
        url:
            'https://res.cloudinary.com/walmart-labs/image/upload/w_960,dpr_auto,f_auto,q_auto:best/gr/images/product-images/img_large/00750105530474L.jpg',
        name: 'Coca Cola',
        price: 80.00,
        cartValue: 0,
        isFavorite: false,
        topRate: 40,
        points: 14,
        category: Categories.rosticeria),
    Product(
        id: 12,
        url:
            'http://esperanzaapps.tr3sco.net/Content/_files/images/productpapas-adobadas2-0364211921284074.png',
        name: 'Papas Fritas',
        price: 10,
        cartValue: 0,
        isFavorite: false,
        topRate: 40,
        points: 32,
        category: Categories.rosticeria),
    Product(
        id: 13,
        url:
            'http://esperanzaapps.tr3sco.net/Content/_files/images/productverde2-0557879332247134.png',
        name: 'Salsa',
        price: 40,
        cartValue: 0,
        isFavorite: true,
        topRate: 50,
        points: 21,
        category: Categories.rosticeria)
  ];

  final _productsVariables = <Product>[
    Product(
        id: 10,
        url: 'assets/images_products/pollo2.png',
        name: 'Pollo Rostizado',
        price: 40,
        cartValue: 0,
        isFavorite: true,
        topRate: 2,
        points: 21,
        category: Categories.rosticeria),
    Product(
        id: 11,
        url: 'assets/images_products/Coca-Cola.png',
        name: 'Coca Cola',
        price: 80.00,
        cartValue: 0,
        isFavorite: false,
        topRate: 1,
        points: 14,
        category: Categories.refrescos,
        quantity: {
          Quantity.chica: 600,
          Quantity.media: 2,
          Quantity.grande: 3,
        }),
    Product(
        id: 6,
        url: 'assets/images_products/arroz.png',
        name: 'Arroz',
        price: 9.00,
        cartValue: 0,
        isFavorite: false,
        topRate: 0,
        points: 50,
        category: Categories.complemento),
    Product(
        id: 7,
        url: 'assets/images_products/fusili.png',
        name: 'Fusili',
        price: 9.00,
        cartValue: 0,
        isFavorite: true,
        topRate: 4,
        points: 65,
        category: Categories.complemento),
    // Product(
    //     id: 8,
    //     url: 'assets/images_products/pure.png',
    //     name: 'Pure de papa',
    //     price: 80.00,
    //     cartValue: 0,
    //     isFavorite: false,
    //     topRate: 1,
    //     points: 14,
    //     category: Categories.complemento),
    Product(
        id: 9,
        url: 'assets/images_products/frijoles.png',
        name: 'frijoles',
        price: 10,
        cartValue: 0,
        isFavorite: false,
        topRate: 3,
        points: 32,
        category: Categories.complemento),

    Product(
        id: 12,
        url: 'assets/images_products/papas.png',
        name: 'Papas Fritas',
        price: 10,
        cartValue: 0,
        isFavorite: false,
        topRate: 3,
        points: 32,
        category: Categories.papas,
        quantity: {
          Quantity.chica: 125,
          Quantity.media: 250,
          Quantity.grande: 500,
        }),
    Product(
        id: 13,
        url: 'assets/images_products/salsa.png',
        name: 'Salsa',
        price: 40,
        cartValue: 0,
        isFavorite: true,
        topRate: 2,
        points: 21,
        category: Categories.antojoExtra),
  ];

  List<Product> productsPack = [];

  @override
  Future<List<Product>> getProductsVariable() async {
    return _productsVariables.toList();
  }

  @override
  Future<List<Product>> getTop() async {
    return _products.where((element) => element.topRate > 0).take(10).toList();
  }

  @override
  Future<List<Product>> search(String keyword) async {
    keyword = keyword.toLowerCase();
    var result =
        _products.where((e) => e.name.toLowerCase().contains(keyword)).toList();
    print(result);
    return result;
  }

  @override
  Future<List<Product>> getFavorites() async {
    return _products.where((element) => element.isFavorite).toList();
  }

  @override
  Future<List<Product>> catalogsList() async {
    // keyword = keyword.toLowerCase();
    // var result =
    //     _products.where((e) => e.name.toLowerCase().contains(keyword)).toList();
    // print(result);
    // return result;

    var result = _products.toList();
    print(result);
    return result;
  }

  // @override
  // Future<List<Product>> addVariableProducts(Product product) {
  //   productsPack.add(product);
  //   return Future.value(productsPack);
  // }
}
