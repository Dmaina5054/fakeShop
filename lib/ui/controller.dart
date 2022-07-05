//will perform action based on triggers from UI
import 'package:fakeshop/data/repository/product_repository.dart';
import 'package:fakeshop/di/service_locator.dart';
import 'package:get_it/get_it.dart';

import '../data/models/product.dart';

class HomeController {
  //Repository
  final productRepository = getIt.get<ProductRepository>();

  //textfield controllers

  //local variables

  //methods
  Future<List<Product>> getProducts() async {
    final products = await productRepository.getProducts();
    print(products);
    return products;
  }
}
