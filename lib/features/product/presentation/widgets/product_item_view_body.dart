import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_shopping_app/core/helper/function/item_count.dart';
import 'package:mini_shopping_app/core/utils/styels.dart';
import 'package:mini_shopping_app/core/widgts/custom_button.dart';
import 'package:mini_shopping_app/features/product/data/entities/product_entity.dart';
import 'package:mini_shopping_app/features/product/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:mini_shopping_app/features/product/presentation/pages/cart_screen.dart';
import 'package:mini_shopping_app/features/product/presentation/widgets/iteme_image.dart';

class ProductItemViewBody extends StatelessWidget {
  const ProductItemViewBody({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(product.title!.substring(0, 10)),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, CartScreen.routeName);
                  },
                  icon: Icon(Icons.shopping_cart_outlined),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: ItemeImage(
                      image: product.image!,
                      aspectRatio: 2.8 / 5,
                    ),
                  ),
                  SizedBox(height: 45),
                  Text(
                    product.description!,
                    style: Styles.textStyle18,
                    maxLines: 7,
                  ),
                  SizedBox(height: 7),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 6.3),
                      Text(
                        "price: ${product.price!.toString()}",
                        style: Styles.textStyle16,
                      ),
                      Spacer(),
                      Text(
                        "rate: ${product.ratingCount!.toString()}",
                        style: Styles.textStyle16,
                      ),
                      Spacer(),
                      Text(
                        "cart: ${getItemCountByProduct(product)}",
                        style: Styles.textStyle16,
                      ),
                    ],
                  ),
                  SizedBox(height: 37),
                  Row(
                    children: [
                      CustomButton(
                        onTap: () async {
                          await BlocProvider.of<CartCubit>(
                            context,
                          ).addproductToCart(product);
                        },
                        text: 'Add to cart',
                        width: MediaQuery.of(context).size.width * .4,
                      ),
                      SizedBox(width: 8),

                      CustomButton(
                        onTap: () async {
                          await BlocProvider.of<CartCubit>(
                            context,
                          ).deleteproductFromCart(product);
                        },
                        text: 'Delete from cart',
                        width: MediaQuery.of(context).size.width * .4,
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
