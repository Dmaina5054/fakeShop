import 'package:fakeshop/data/models/product.dart';

class ProductState {}

class LoadingProductState extends ProductState {}

class LoadedProductState extends ProductState {
  List<Product> productList;
  LoadedProductState(this.productList);
}
