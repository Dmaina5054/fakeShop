import 'package:dio/dio.dart';
import 'package:fakeshop/data/network/api/constant/endpoints.dart';
import 'package:fakeshop/data/network/dio_client.dart';

import '../../../utils/logger.dart';

//this class contains
//a dio class client
//behaviors to perform CRUD ops to
//product object through dioClient defined methods
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

  Future<Response> getProducts() async {
    try {
      //use our Dio class to perform Get
      final Response response = await dioClient.get(Endpoints.products);

      return response;
    } catch (e) {
      Logger.data(e);
      rethrow;
    }
  }

  Future<Response> updateProduct(String title, double price, String description,
      String image, String category) async {
    final Response response = await dioClient.put(Endpoints.products, data: {
      title: title,
      price: price,
      description: description,
      image: image,
      category: category
    });
    return response;
  }

  Future getByCategory(String category) async {
    final Response response =
        await dioClient.get(Endpoints.getbycategory + category);
    Logger.data(response);
    response.statusCode == 200 ? response : null;
  }
}
