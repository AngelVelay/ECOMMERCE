import 'package:jexpoints/app/modules/main/entities/product.type.dart';
import 'package:jexpoints/app/modules/main/services/products/products.contract.dart';

class ProductsFakeService implements IProductsService {
  final _products = <Product>[
    Product(
        id: 1,
        url:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1w3DfHY1rczx50CtpyT7WQWM7DzgJO51Rww&usqp=CAU',
        name: 'Pastel de Chocolate',
        price: 30.00,
        cartValue: 0),
    Product(
        id: 2,
        url:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaMIgHTCOHYmVBhq3Fu_7LILYd1ONWeT8AmQ&usqp=CAU',
        name: 'Pan Blanco',
        price: 50.00,
        cartValue: 0),
    Product(
        id: 3,
        url:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSz-uOqi6OOH-5WdxCfboKBJzsFxGn_7WpH8A&usqp=CAU',
        name: 'Pan de Muerto',
        price: 80.00,
        cartValue: 0),
    Product(
        id: 3,
        url:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-XaE3eZ7-TOq0Da7FhHcmmlxU2zwhc6ydbQ&usqp=CAU',
        name: 'Bollos',
        price: 10,
        cartValue: 0),
    Product(
        id: 3,
        url:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlP42IpEI_A3Z79-YLoqy4x1vskyPeLiTdLQ&usqp=CAU',
        name: 'Concha de Chocolate',
        price: 40,
        cartValue: 0)
  ];

  @override
  Future<List<Product>> getTop() async {
    return _products;
  }

  @override
  Future<List<Product>> search(String keyword) async {
    return _products;
  }
}