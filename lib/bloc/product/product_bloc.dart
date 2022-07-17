import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fakeshop/bloc/product/product_event.dart';
import 'package:fakeshop/bloc/product/product_state.dart';

import '../../data/models/product.dart';
import '../../ui/controller.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  HomeController homeController = HomeController();
  ProductBloc() : super(ProductState()) {
    on<LoadProductEvent>(_fetchProduct);
  }

  FutureOr<void> _fetchProduct(event, Emitter<ProductState> emit) async {
    //our service to get the products
    emit(LoadingProductState());
    List<Product> products = await homeController.getProducts();
    emit(LoadedProductState(products));
  }
}
