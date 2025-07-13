import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_shopping_app/features/product/presentation/cubit/product_cubit/product_cubit.dart';
import 'package:mini_shopping_app/features/product/presentation/widgets/loading/product_loading_body.dart';
import 'package:mini_shopping_app/features/product/presentation/widgets/product_success_body.dart';

class ProductScreenBody extends StatelessWidget {
  const ProductScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ProductLoadingState) {
          return ProductLoadingBody();
        } else if (state is ProductFailesState) {
          log(state.errorMessage);
          return Center(child: CircularProgressIndicator());
        } else if (state is ProductSuccesState) {
          return ProductSuccessBody(products: state.products);
        } else {
          return Column();
        }
      },
    );
  }
}
