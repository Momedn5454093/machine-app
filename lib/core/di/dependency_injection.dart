import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/login/data/login_repo.dart';
import '../../features/login/logic/login_cubit.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
}
