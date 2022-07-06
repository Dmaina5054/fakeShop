import 'package:fakeshop/data/models/product.dart';
import 'package:fakeshop/data/repository/product_repository.dart';
import 'package:fakeshop/di/service_locator.dart';
import 'package:fakeshop/ui/controller.dart';
import 'package:flutter/material.dart';

import 'add_product_button.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = getIt<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AddProductButton(),
      appBar: AppBar(
        title: const Text('Fake Shop'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          width: double.infinity,
          child: FutureBuilder(
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
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final product = snapshot.data![index];
                        return ProductCardTile(product: product);
                      });
                }
                return Container();
              }),
        ),
      ),
    );
  }

  _buildAddButton() {}
}

class ProductCardTile extends StatelessWidget {
  const ProductCardTile({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ExpansionTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(product.image),
          ),
          title: Text(product.title),
          subtitle: Text(product.category),
          trailing: Text('\$${product.price.toString()}'),
          children: [
            Text(
              product.description,
              style: const TextStyle(
                  letterSpacing: 1.0,
                  fontSize: 17,
                  textBaseline: TextBaseline.alphabetic),
            )
          ]),
    );
  }
}
