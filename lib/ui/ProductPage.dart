import 'package:fakeshop/data/models/product.dart';
import 'package:fakeshop/data/repository/product_repository.dart';
import 'package:fakeshop/di/service_locator.dart';
import 'package:fakeshop/ui/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

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
        child: SizedBox(
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
                  return RefreshIndicator(
                      onRefresh: () {
                        setState(() {});
                        return Future.value();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: GridView.builder(
                            itemCount: snapshot.data!.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              Product product = snapshot.data![index];
                              return InkWell(
                                onTap: () {
                                  showBottomSheet(
                                      constraints: BoxConstraints.expand(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .3),
                                      context: context,
                                      builder: (context) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          child: Text(product.description)));
                                },
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 8.0),
                                    child: Align(
                                        alignment: Alignment.topCenter,
                                        child: SizedBox(
                                          child: PhotoViewGallery.builder(
                                            enableRotation: true,
                                            builder: (BuildContext context,
                                                int index) {
                                              return PhotoViewGalleryPageOptions(
                                                imageProvider:
                                                    NetworkImage(product.image),
                                                initialScale:
                                                    PhotoViewComputedScale
                                                            .contained *
                                                        0.8,
                                              );
                                            },
                                            itemCount: 1,
                                          ),
                                        )),
                                  ),
                                ),
                              );
                            }),
                      ));
                }
                return Container();
              }),
        ),
      ),
    );
  }
}

class ProductCardTile extends StatelessWidget {
  const ProductCardTile({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: MediaQuery.of(context).size.height * 0.4,
      width: double.infinity,
      child: Card(
        shadowColor: Colors.green,
        elevation: 5,
        child: ExpansionTile(
            initiallyExpanded: true,
            leading: CircleAvatar(
              backgroundImage: NetworkImage(product.image),
            ),
            title: Text(product.title),
            subtitle: Column(
              children: [
                Text(product.category),
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating: product.rating.rate,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.green,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    Text(
                      product.rating.rate.toString(),
                      style: const TextStyle(
                          fontSize: 17, textBaseline: TextBaseline.alphabetic),
                    ),
                  ],
                ),
              ],
            ),
            trailing: Text('\$${product.price.toString()}'),
            children: [
              SingleChildScrollView(
                child: SizedBox(
                  height: 80,
                  child: ClipRect(
                    child: Text(
                      product.description,
                      style: const TextStyle(
                          letterSpacing: 1.0,
                          fontSize: 17,
                          textBaseline: TextBaseline.alphabetic),
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
