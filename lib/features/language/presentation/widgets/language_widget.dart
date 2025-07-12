import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_shopping_app/core/utils/cubits/localization/localization_cubit.dart';
import 'package:mini_shopping_app/core/utils/styels.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({super.key, required this.lang, required this.text});
  final String text;
  final String lang;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<LocalizationCubit>(context).changeLanguage(lang);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text, style: Styles.textStyle28etalic),
          SizedBox(width: 8),
          Icon(Icons.language_rounded),
        ],
      ),
    );
  }
}
