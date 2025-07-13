import 'package:flutter/material.dart';
import 'package:mini_shopping_app/features/product/presentation/widgets/cart_screen_body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  static String routeName = "CartScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("cart")),
      body: CartScreenBody(),
    );
  }
}
