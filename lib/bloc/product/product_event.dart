import 'package:fakeshop/bloc/product/product_state.dart';

import '../../data/models/product.dart';

class ProductEvent {}

class LoadingProductEvent extends ProductEvent {}

class LoadProductEvent extends ProductEvent {}

class LoadedProductEvent extends ProductEvent {
  List<Product> productList;
  LoadedProductEvent(this.productList);
}
