import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mini_shopping_app/bloco_bserver.dart';
import 'package:mini_shopping_app/core/helper/services/shared_preferance.dart';
import 'package:mini_shopping_app/mini_shopping_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await SharedPreferance.init();
  runApp(const MiniShoppingApp());
}
