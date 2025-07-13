import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_shopping_app/core/utils/styels.dart';
import 'package:mini_shopping_app/features/product/data/models/product_model/product_model.dart';
import 'package:mini_shopping_app/features/product/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:mini_shopping_app/features/product/presentation/widgets/carouseslider_image_widget.dart';
import 'package:mini_shopping_app/features/product/presentation/widgets/product_item.dart';

class ProductSuccessBody extends StatelessWidget {
  const ProductSuccessBody({super.key, required this.products});
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: CarousesliderImageWidget(product: products)),
        SliverToBoxAdapter(
          child: Divider(
            thickness: 8,
            color: Styles.kprimarycolor.withAlpha(100),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  return ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: products.length,
                    addAutomaticKeepAlives: true,
                    addRepaintBoundaries: true,
                    itemBuilder: (context, index) {
                      return ProductItem(productEntity: products[index]);
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 20),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
