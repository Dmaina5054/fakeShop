import 'package:fakeshop/bloc/product/product_bloc.dart';
import 'package:fakeshop/di/service_locator.dart';
import 'package:fakeshop/ui/ProductPage.dart';
import 'package:fakeshop/utils/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future main() async {
  setup();
  BlocOverrides.runZoned(() {
    runApp(const MyApp());
  }, blocObserver: AllBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>(
      create: (context) => ProductBloc(),
      child: MaterialApp(
        title: 'Fake Shop',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
