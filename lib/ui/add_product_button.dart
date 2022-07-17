import 'package:fakeshop/di/service_locator.dart';
import 'package:fakeshop/ui/add_product_form.dart';
import 'package:fakeshop/ui/controller/controller.dart';
import 'package:flutter/material.dart';

import 'new_product_page.dart';

class AddProductButton extends StatelessWidget {
  AddProductButton({Key? key}) : super(key: key);

  final homeController = getIt<HomeController>();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return ProductForm(
                  homeController: homeController,
                  onSubmit: () async {
                    await homeController.addProduct();
                    Navigator.pop(context);
                    homeController.nameController.clear();
                    homeController.priceController.clear();
                    homeController.categoryController.clear();
                    homeController.descriptionController.clear();
                    homeController.imageController.clear();

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => NewProductPage())));
                  });
            });
      },
    );
  }
}
