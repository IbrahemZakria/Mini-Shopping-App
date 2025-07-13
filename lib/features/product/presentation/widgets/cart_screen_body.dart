import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:mini_shopping_app/constant.dart';
import 'package:mini_shopping_app/features/product/data/entities/product_entity.dart';
import 'package:mini_shopping_app/features/product/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:mini_shopping_app/features/product/presentation/widgets/product_item.dart';

class CartScreenBody extends StatelessWidget {
  const CartScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final box = Hive.box<ProductEntity>(Constant.productBox);
        List<ProductEntity> products = box.values.toList();

        return Column(
          children: [
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: products.length,
                addAutomaticKeepAlives: true,
                addRepaintBoundaries: true,
                itemBuilder: (context, index) {
                  return ProductItem(productEntity: products[index]);
                },
                separatorBuilder: (context, index) => SizedBox(height: 20),
              ),
            ),
          ],
        );
      },
    );
  }
}
