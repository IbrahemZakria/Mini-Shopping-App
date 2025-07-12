import 'package:flutter/material.dart';
import 'package:mini_shopping_app/features/language/presentation/widgets/lang_screen_body.dart';
import 'package:mini_shopping_app/generated/l10n.dart';

class LangScreen extends StatelessWidget {
  const LangScreen({super.key});
  static final String routeName = 'LangScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).Chose_your_language)),
      body: LangScreenBody(),
    );
  }
}
