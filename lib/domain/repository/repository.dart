import '../../data/models/book_model.dart';

mixin Repository {
  Future<List<BookModel>> getList();

  Future<BookModel> getDetails(String id);
}
