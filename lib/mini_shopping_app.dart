import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mini_shopping_app/constant.dart';
import 'package:mini_shopping_app/core/helper/services/shared_preferance.dart';
import 'package:mini_shopping_app/core/utils/cubits/localization/localization_cubit.dart';
import 'package:mini_shopping_app/core/utils/styels.dart';
import 'package:mini_shopping_app/features/language/presentation/pages/lang_screen.dart';
import 'package:mini_shopping_app/features/product/data/datasources/local_data_source.dart/cart_service_repo.dart';
import 'package:mini_shopping_app/features/product/data/datasources/local_data_source.dart/cartservices_impel.dart';
import 'package:mini_shopping_app/features/product/data/repositories/cart_repo/cart_repo_impel.dart';
import 'package:mini_shopping_app/features/product/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:mini_shopping_app/features/product/presentation/pages/cart_screen.dart';
import 'package:mini_shopping_app/features/product/presentation/pages/product_item_view.dart';
import 'package:mini_shopping_app/features/product/presentation/pages/product_screen.dart';
import 'package:mini_shopping_app/features/splash/presentation/pages/splash_screen.dart';
import 'generated/l10n.dart';

class MiniShoppingApp extends StatelessWidget {
  const MiniShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LocalizationCubit()),
        BlocProvider(
          create: (context) =>
              CartCubit(CartRepoImpel(cartServiceRepo: CartservicesImpel())),
        ),
      ],
      child: BlocBuilder<LocalizationCubit, LocalizationState>(
        builder: (context, state) {
          String langCode =
              SharedPreferance.getData<String>(Constant.languageCode) ??
              'en'; // Default language code

          return MaterialApp(
            locale: Locale(langCode),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              iconTheme: IconThemeData(color: Styles.kprimarycolor),
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(color: Colors.white),
                titleTextStyle: Styles.textStyle20,
                centerTitle: true,
                backgroundColor: Styles.kprimarycolor,
              ),
            ),
            routes: {
              SplashScreen.routeName: (context) => SplashScreen(),
              CartScreen.routeName: (context) => CartScreen(),
              LangScreen.routeName: (context) => LangScreen(),
              ProductScreen.routeName: (context) => ProductScreen(),
              ProductItemView.routeName: (context) => ProductItemView(),
            },
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            title: 'Mini Shopping App - Product Listing with Cart',
            initialRoute: SplashScreen.routeName,
          );
        },
      ),
    );
  }
}
