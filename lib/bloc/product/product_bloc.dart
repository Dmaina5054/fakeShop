import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fakeshop/bloc/product/product_event.dart';
import 'package:fakeshop/bloc/product/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductState()) {
    on<LoadProductEvent>(_fetchProduct);
  }

  FutureOr<void> _fetchProduct(event, Emitter<ProductState> emit) {
  }
}
