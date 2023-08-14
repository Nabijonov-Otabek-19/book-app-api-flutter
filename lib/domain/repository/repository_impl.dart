import 'package:dio/dio.dart';
import '../../../../domain/repository/repository.dart';
import '../../data/models/book_model.dart';

class RepositoryImpl implements Repository {
  final Dio _dio;

  RepositoryImpl(this._dio);

  @override
  Future<List<BookModel>> getList() async {
    final response = await _dio.get("5c9ffd1e-671c-4a53-8fb4-2139d9f77ac2");

    return (response.data["books"] as List)
        .map((bookData) => BookModel.fromJson(bookData))
        .toList();
  }

  @override
  Future<BookModel> getDetails(String id) async {
    final response = await _dio.get(id);
    return BookModel.fromJson(response.data);
  }
}