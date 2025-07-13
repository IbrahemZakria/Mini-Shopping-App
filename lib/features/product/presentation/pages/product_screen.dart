import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_shopping_app/core/helper/services/api_servises.dart';
import 'package:mini_shopping_app/features/language/presentation/pages/lang_screen.dart';
import 'package:mini_shopping_app/features/product/data/datasources/remote_data_source.dart/remote_data_sourse_impel.dart';
import 'package:mini_shopping_app/features/product/data/repositories/product_repo/product_repo_impel.dart';
import 'package:mini_shopping_app/features/product/presentation/cubit/product_cubit/product_cubit.dart';
import 'package:mini_shopping_app/features/product/presentation/pages/cart_screen.dart';
import 'package:mini_shopping_app/features/product/presentation/widgets/product_screen_body.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});
  static final String routeName = 'ProductScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(
        ProductRepoImpel(
          remoteDataSources: RemoteDataSourseImpel(ApiServises()),
        ),
      )..getAllProduct(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Mini Shopping"),
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, LangScreen.routeName);
            },
            icon: Icon(Icons.abc),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, CartScreen.routeName);
              },
              icon: Icon(Icons.shopping_cart_outlined),
            ),
          ],
        ),
        body: ProductScreenBody(),
      ),
    );
  }
}
