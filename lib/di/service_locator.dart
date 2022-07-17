import 'package:dio/dio.dart';
import 'package:fakeshop/data/network/api/product_api.dart';
import 'package:fakeshop/data/network/dio_client.dart';
import 'package:fakeshop/data/repository/product_repository.dart';
import 'package:get_it/get_it.dart';

import '../ui/controller/controller.dart';

//ensure singletons
final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerSingleton(ProductApi(dioClient: getIt.get<DioClient>()));
  getIt.registerSingleton(ProductRepository(getIt.get<ProductApi>()));
  getIt.registerSingleton(HomeController());
}
