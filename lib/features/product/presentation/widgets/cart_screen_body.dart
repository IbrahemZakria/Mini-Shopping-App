import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:mini_shopping_app/constant.dart';
import 'package:mini_shopping_app/core/helper/function/get_total_price.dart';
import 'package:mini_shopping_app/core/widgts/custom_button.dart';
import 'package:mini_shopping_app/features/product/data/entities/product_entity.dart';
import 'package:mini_shopping_app/features/product/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:mini_shopping_app/features/product/presentation/widgets/product_item.dart';
import 'package:mini_shopping_app/generated/l10n.dart';

class CartScreenBody extends StatelessWidget {
  const CartScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        double price = getTotalPriceFromBox();
        final box = Hive.box<ProductEntity>(Constant.productBox);
        List<ProductEntity> products = box.values.toList();

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
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
              CustomButton(
                onTap: () {},
                text: "${S.of(context).buy} $price",
                width: MediaQuery.of(context).size.width * .5,
              ),
              SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }
}
