//will perform action based on triggers from UI
import 'package:fakeshop/data/repository/product_repository.dart';
import 'package:fakeshop/di/service_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import '../data/models/product.dart';

class HomeController {
  //Repository
  final productRepository = getIt.get<ProductRepository>();

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final imageController = TextEditingController();
  final priceController = TextEditingController();
  final categoryController = TextEditingController();

  //textfield controllers

  //local variables
  final List<Product> addedProducts = [];

  //methods

  //list products
  Future<List<Product>> getProducts() async {
    final products = await productRepository.getProducts();

    return products;
  }

  Future<Product> addProduct() async {
    final newProduct = await productRepository.addProduct(
        nameController.text,
        int.parse(priceController.text).toDouble(),
        descriptionController.text,
        imageController.text,
        categoryController.text);

    addedProducts.add(newProduct);
    return newProduct;
  }
}
