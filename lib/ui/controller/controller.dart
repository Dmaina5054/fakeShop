//will perform action based on triggers from UI
import 'package:fakeshop/data/repository/product_repository.dart';
import 'package:fakeshop/di/service_locator.dart';
import 'package:flutter/cupertino.dart';

import '../../data/models/product.dart';

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
        double.parse(priceController.text).toDouble(),
        descriptionController.text,
        imageController.text,
        categoryController.text);

    addedProducts.add(newProduct);
    return newProduct;
  }

  Future<Product> updateProduct(String title, double price, String description,
      String image, String category) async {
    final updatedUser = await productRepository.editProduct(
      title,
      price,
      description,
      image,
      category,
    );
    addedProducts.add(updatedUser);
    return updatedUser;
  }

  Future productByCategory(String category) async {
    final products = await productRepository.productByCat(category);
    return products;
  }
}
