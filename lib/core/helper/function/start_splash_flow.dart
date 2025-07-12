import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mini_shopping_app/constant.dart';
import 'package:mini_shopping_app/core/helper/services/shared_preferance.dart';

class StartSplashFlow {
  final String langRouteName;
  final String homeRouteName;
  final bool mounted;
  BuildContext context;

  StartSplashFlow({
    required this.langRouteName,
    required this.homeRouteName,
    required this.mounted,
    required this.context,
  });
  Future<void> startSplashFlow() async {
    await Future.delayed(const Duration(seconds: 3));
    final hasLanguage = SharedPreferance.getData<String>(Constant.languageCode);

    if (!mounted) return;

    if (hasLanguage != null) {
      log('home screen');
      Navigator.pushReplacementNamed(context, homeRouteName);
    } else {
      log('language');
      Navigator.pushReplacementNamed(context, langRouteName);
    }
  }
}
