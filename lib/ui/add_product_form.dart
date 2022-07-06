import 'package:fakeshop/ui/controller.dart';
import 'package:flutter/material.dart';

class ProductForm extends StatelessWidget {
  const ProductForm({
    Key? key,
    required this.homeController,
    this.isUpdate,
    required this.onSubmit,
  }) : super(key: key);
  final HomeController homeController;
  final bool? isUpdate;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: homeController.nameController,
            decoration: const InputDecoration(
              labelText: 'Title',
            ),
          ),
          TextField(
            controller: homeController.priceController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Price',
            ),
          ),
          TextField(
            controller: homeController.descriptionController,
            decoration: const InputDecoration(
              labelText: 'Description',
            ),
          ),
          TextField(
            controller: homeController.imageController,
            decoration: const InputDecoration(
              labelText: 'Image',
            ),
          ),
          TextField(
            controller: homeController.categoryController,
            decoration: const InputDecoration(
              labelText: 'category',
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onSubmit,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(isUpdate! ? 'Update' : 'Add'),
            ),
          ),
        ],
      ),
    );
  }
}
