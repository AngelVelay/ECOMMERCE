import '../../entities/reviews.type.dart';

abstract class IReviewsService {
  Future<List<Review>> get();
  Future<List<Review>> getFromCurrent();
  Future<Review> addReview(Review review);
}
