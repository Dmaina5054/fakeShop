import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fakeshop/bloc/product/product_event.dart';
import 'package:fakeshop/bloc/product/product_state.dart';

import '../../data/models/product.dart';
import '../../ui/controller/controller.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  HomeController homeController = HomeController();
  ProductBloc() : super(ProductState()) {
    on<LoadProductEvent>(_fetchProduct);
    on<LoadProductByCategoryEvent>(_productByCat);
  }

  FutureOr<void> _fetchProduct(event, Emitter<ProductState> emit) async {
    //our service to get the products
    emit(LoadingProductState());
    List<Product> products = await homeController.getProducts();
    emit(LoadedProductState(products));
  }

  FutureOr<void> _productByCat(
      LoadProductByCategoryEvent event, Emitter<ProductState> emit) async {
    emit(LoadingProductState());
    try {
      List<Product> products =
          await homeController.productByCategory(event.category);
      emit(LoadedProductState(products));
    } catch (e) {
      rethrow;
    }
  }
}
