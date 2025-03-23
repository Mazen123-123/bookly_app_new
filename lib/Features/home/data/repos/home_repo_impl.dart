import 'package:bookly_app_new/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app_new/Features/home/data/repos/home_repo.dart';
import 'package:bookly_app_new/core/errors/failures.dart';
import 'package:bookly_app_new/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(endPoint: 'volumes?q=subject:programming&Filtering=free-ebooks&Sorting=newest');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } on Exception catch (e) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }
}
