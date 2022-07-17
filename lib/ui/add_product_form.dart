import 'dart:io';
import 'package:fakeshop/ui/controller.dart';
import 'package:flutter/material.dart';

class ProductForm extends StatefulWidget {
  ProductForm({
    Key? key,
    required this.homeController,
    this.isUpdate,
    required this.onSubmit,
  }) : super(key: key);
  final HomeController homeController;
  final bool? isUpdate;
  final VoidCallback onSubmit;

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                controller: widget.homeController.nameController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
              ),
              TextFormField(
                controller: widget.homeController.priceController,
                keyboardType: Platform.isLinux
                    ? TextInputType.number
                    : TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Price',
                ),
              ),
              TextFormField(
                controller: widget.homeController.descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
              ),
              TextFormField(
                controller: widget.homeController.imageController,
                decoration: const InputDecoration(
                  labelText: 'Image',
                ),
              ),
              TextFormField(
                controller: widget.homeController.categoryController,
                decoration: const InputDecoration(
                  labelText: 'category',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    widget.homeController.addProduct();
                  }
                },
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        widget.isUpdate != null ? Text('Update') : Text('Add')),
              ),
            ],
          ),
        ));
  }
}
