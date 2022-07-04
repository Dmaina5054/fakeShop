import 'package:dio/dio.dart';
import 'package:fakeshop/data/network/api/constant/endpoints.dart';
import 'package:fakeshop/data/network/dio_client.dart';

class ProductApi {
  final DioClient dioClient;

  ProductApi({required this.dioClient});

  //add product endpoint
  Future<Response> addProduct(String title, double price, String description,
      String image, String category) async {
    try {
      final Response response =
          await dioClient.post(Endpoints.addproducts, data: {
        title: title,
        price: price,
        description: description,
        image: image,
        category: category
      });

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
