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
      final products =
          (response.data as List).map((e) => Product.fromMap(e)).toList();

      return products;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  //add product
  Future addProduct(String title, double price, String description,
      String image, String category) async {
    try {
      final response = await productApi.addProduct(
          title, price, description, image, category);

      return response.statusCode;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      print(e.message);
      throw errorMessage;
    }
  }

  Future<Product> editProduct(String title, double price, String description,
      String image, String category) async {
    try {
      final response = await productApi.updateProduct(
          title, price, description, image, category);

      print(response);
      return Product.fromMap(response.data);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
      
    }
  }
}
