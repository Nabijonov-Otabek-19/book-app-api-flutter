import 'package:book_app_api/domain/repository/repository.dart';
import 'package:book_app_api/domain/repository/repository_impl.dart';
import 'package:get_it/get_it.dart';

import '../data/source/local/book_pref.dart';
import '../data/source/remote/api/base_api.dart';

GetIt di = GetIt.instance;

void diSetup() {
  // BaseApi
  di.registerLazySingleton<BaseApi>(() => BaseApi());

  // RepositoryImpl
  di.registerLazySingleton<RepositoryImpl>(
      () => RepositoryImpl(di.get<BaseApi>().dio));

  // Interface to Impl
  di.registerSingleton<Repository>(RepositoryImpl(di.get<BaseApi>().dio));

  // SharedPref
  di.registerLazySingleton<BookPRef>(() => BookPRef());
}
