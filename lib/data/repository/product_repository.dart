//define our product repository
import 'package:dio/dio.dart';
import 'package:fakeshop/data/models/product.dart';
import 'package:fakeshop/data/network/api/product_api.dart';

import '../network/dio_exception.dart';

class ProductRepository {
  final ProductApi productApi;
  ProductRepository(this.productApi);

  //get products
  Future<List<Product>> getProducts() async {
    try {
      final response = await productApi.getProducts();
      print(response.data);
      final products =
          (response.data as List).map((e) => Product.fromMap(e)).toList();

      return products;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  //add product
  Future<Product> addProduct(String title, double price, String description,
      String image, String category) async {
    try {
      final response = await productApi.addProduct(
          title, price, description, image, category);
      return Product.fromMap(response.data);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
