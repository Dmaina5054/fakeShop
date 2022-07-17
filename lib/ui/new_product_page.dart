import 'package:fakeshop/di/service_locator.dart';
import 'package:fakeshop/ui/controller/controller.dart';
import 'package:flutter/material.dart';

import '../data/models/product.dart';
import '../utils/logger.dart';

class NewProductPage extends StatefulWidget {
  const NewProductPage({Key? key}) : super(key: key);

  @override
  State<NewProductPage> createState() => _NewProductPageState();
}

class _NewProductPageState extends State<NewProductPage> {
  final homeController = getIt.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    Logger.data(context.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Added Product'),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        final Product product = homeController.addedProducts[index];

        return ListTile(
          onLongPress: () async {},
        );
      }),
    );
  }
}
