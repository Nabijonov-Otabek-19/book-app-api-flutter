import 'package:book_app_api/domain/repository/repository.dart';
import 'package:book_app_api/domain/repository/repository_impl.dart';
import 'package:get_it/get_it.dart';

import '../data/source/local/book_pref.dart';
import '../data/source/remote/api/base_api.dart';

GetIt di = GetIt.instance;

void diSetup() {
  di.registerLazySingleton<BaseApi>(() => BaseApi());

  di.registerLazySingleton<RepositoryImpl>(() => RepositoryImpl(di.get<BaseApi>().dio));

  di.registerSingleton<Repository>(RepositoryImpl(di.get<BaseApi>().dio));

  di.registerLazySingleton<BookPRef>(() => BookPRef());
}
