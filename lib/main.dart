import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mini_shopping_app/bloco_bserver.dart';
import 'package:mini_shopping_app/constant.dart';
import 'package:mini_shopping_app/core/helper/services/shared_preferance.dart';
import 'package:mini_shopping_app/features/product/data/entities/product_entity.dart';
import 'package:mini_shopping_app/mini_shopping_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(ProductEntityAdapter());
  await Hive.openBox<ProductEntity>(Constant.productBox);
  Bloc.observer = MyBlocObserver();
  await SharedPreferance.init();
  runApp(const MiniShoppingApp());
}
