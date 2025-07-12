import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mini_shopping_app/constant.dart';
import 'package:mini_shopping_app/core/helper/services/shared_preferance.dart';
import 'package:mini_shopping_app/core/utils/cubits/localization/localization_cubit.dart';
import 'package:mini_shopping_app/core/utils/styels.dart';
import 'package:mini_shopping_app/features/language/presentation/pages/lang_screen.dart';
import 'package:mini_shopping_app/features/product/presentation/pages/product_screen.dart';
import 'package:mini_shopping_app/features/splash/presentation/pages/splash_screen.dart';
import 'generated/l10n.dart';

class MiniShoppingApp extends StatelessWidget {
  const MiniShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocalizationCubit(),
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
                titleTextStyle: Styles.textStyle20,
                centerTitle: true,
                backgroundColor: Styles.kprimarycolor,
              ),
            ),
            routes: {
              SplashScreen.routeName: (context) => SplashScreen(),
              LangScreen.routeName: (context) => LangScreen(),
              ProductScreen.routeName: (context) => ProductScreen(),
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
