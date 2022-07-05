import 'package:fakeshop/data/models/producr.dart';
import 'package:fakeshop/di/service_locator.dart';
import 'package:flutter/material.dart';

import 'controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final homeController = getIt<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _buildAddButton(),
      appBar: AppBar(
        title: const Text('Fake Shop'),
      ),
      body: FutureBuilder(
          future: homeController.getProducts(),
          builder: (context, AsyncSnapshot<List<Product>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              final error = snapshot.error;
              return Center(
                child: Text("Error: " + error.toString()),
              );
            } else if (snapshot.hasData) {
              if (snapshot.data == null) {
                return const Center(
                  child: Text('No Data'),
                );
              }
              return ListView.builder(itemBuilder: (context, index) {
                final product = snapshot.data![index];
                return ListTile(
                  leading: Text(product.title),
                );
              });
            }
            return Container();
          }),
    );
  }

  _buildAddButton() {}
}
