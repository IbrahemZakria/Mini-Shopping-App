import 'package:flutter/material.dart';
import 'package:mini_shopping_app/features/product/data/models/product_model/product_model.dart';
import 'package:mini_shopping_app/features/product/presentation/widgets/product_item_view_body.dart';

class ProductItemView extends StatelessWidget {
  const ProductItemView({super.key});
  static String routeName = "BookDetailsView";

  @override
  Widget build(BuildContext context) {
    final ProductModel args =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ProductItemViewBody(product: args);
  }
}
