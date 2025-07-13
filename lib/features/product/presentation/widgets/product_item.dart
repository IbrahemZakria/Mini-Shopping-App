import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_shopping_app/core/helper/function/item_count.dart';
import 'package:mini_shopping_app/core/utils/styels.dart';
import 'package:mini_shopping_app/core/widgts/custome_text.dart';
import 'package:mini_shopping_app/features/product/data/entities/product_entity.dart';
import 'package:mini_shopping_app/features/product/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:mini_shopping_app/features/product/presentation/pages/product_item_view.dart';
import 'package:mini_shopping_app/features/product/presentation/widgets/iteme_image.dart';
import 'package:mini_shopping_app/generated/l10n.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    int itemCount = getItemCountByProduct(productEntity);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductItemView.routeName,
          arguments: productEntity,
        );
      },
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.17,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            ItemeImage(image: productEntity.image!, aspectRatio: 2.5 / 4),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        CustomeText(
                          text: productEntity.title!,
                          textStyle: Styles.textStyle20.copyWith(),
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                BlocProvider.of<CartCubit>(
                                  context,
                                ).addproductToCart(productEntity);
                              },
                              icon: Icon(Icons.add),
                            ),
                            IconButton(
                              onPressed: () {
                                BlocProvider.of<CartCubit>(
                                  context,
                                ).deleteproductFromCart(productEntity);
                              },
                              icon: Icon(Icons.remove),
                            ),
                          ],
                        ),

                        Text("$itemCount"),
                      ],
                    );
                  },
                ),
                SizedBox(height: 3),

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.52,
                  child: Row(
                    children: [
                      Text(
                        productEntity.price.toString(),
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),

                      SizedBox(width: 6.3),
                      Text(S.of(context).rate, style: Styles.textStyle16),
                      SizedBox(width: 8),
                      Text(
                        productEntity.ratingCount.toString(),
                        style: Styles.textStyle14,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
