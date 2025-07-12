import 'package:flutter/material.dart';
import 'package:mini_shopping_app/core/widgts/custom_button.dart';
import 'package:mini_shopping_app/features/language/presentation/widgets/language_widget.dart';
import 'package:mini_shopping_app/features/product/presentation/pages/product_screen.dart';
import 'package:mini_shopping_app/generated/l10n.dart';

class LangScreenBody extends StatelessWidget {
  const LangScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LanguageWidget(text: 'English', lang: "en"),
          LanguageWidget(text: 'العربيه', lang: 'ar'),
          LanguageWidget(text: 'भारतीय', lang: 'hi'),
          SizedBox(height: 32),
          CustomButton(
            onTap: () {
              Navigator.pushReplacementNamed(context, ProductScreen.routeName);
            },
            text: S.of(context).continu,
          ),
        ],
      ),
    );
  }
}
