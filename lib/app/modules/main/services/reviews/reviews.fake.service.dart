import 'package:jexpoints/app/modules/main/services/reviews/reviews.contract.dart';

import '../../entities/reviews.type.dart';

class ReviewsFakeService implements IReviewsService {
  final _reviewList = <Review>[
    Review(
      id: 1,
      name: 'OREJA',
      productURL:
          'https://file.adomicil.io/esperanza.tr3sco.net/_files/images/product/oreja-normal-0754907696393741.jpg',
      userId: 1,
      rating: 5.0,
      comment:
          'Excelente producto,lo recomiendo.Lo volveria a comprar de nuevo.',
    ),
    Review(
      id: 2,
      name: 'BIGOTE',
      productURL:
          'https://file.adomicil.io/esperanza.tr3sco.net/_files/images/product/bigote-00719347917809779.jpg',
      userId: 2,
      rating: 4.0,
      comment: 'Muy buena calidad, lo recomiendo. ',
    ),
    Review(
      id: 3,
      name: 'MANTECADA VAINILLA',
      productURL:
          'https://file.adomicil.io/esperanza.tr3sco.net/_files/images/product/mantecada-0401739096921747.jpg',
      userId: 3,
      rating: 3.0,
      comment: 'Delicioso producto, lo recomiendo.',
    ),
    Review(
      id: 4,
      name: 'SUPREMO DE CHOCOLATE',
      productURL:
          'https://file.adomicil.io/esperanza.tr3sco.net/_files/images/product/supremo-chocolate-0145492964491943.jpg',
      userId: 4,
      rating: 2.5,
      comment: 'Muy buena calidad, lo recomiendo, pero no es lo que esperaba.',
    ),
  ];

  @override
  Future<Review> addReview(Review review) async {
    _reviewList.add(review);
    return review;
  }

  @override
  Future<List<Review>> get() async {
    return Future.value(_reviewList);
  }

  @override
  Future<List<Review>> getFromCurrent() async {
    return Future.value(_reviewList);
  }
}
