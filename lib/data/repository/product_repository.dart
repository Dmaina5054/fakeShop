//define our product repository
import 'package:dio/dio.dart';
import 'package:fakeshop/data/models/producr.dart';
import 'package:fakeshop/data/network/api/product_api.dart';

class UserRepository {
  final ProductApi productApi;
  UserRepository(this.productApi);

  //get products
  Future<List<Product>> getProducts() async {
    try {
      final response = await productApi.getProducts();
      final products = (response.data['data'] as List)
          .map((e) => Product.fromMap(e))
          .toList();

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
