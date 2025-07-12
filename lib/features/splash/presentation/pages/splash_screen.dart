import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mini_shopping_app/core/helper/function/start_splash_flow.dart';
import 'package:mini_shopping_app/features/language/presentation/pages/lang_screen.dart';
import 'package:mini_shopping_app/features/product/presentation/pages/product_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static final String routeName = "SplashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    StartSplashFlow(
      langRouteName: LangScreen.routeName,
      homeRouteName: ProductScreen.routeName,
      mounted: mounted,
      context: context,
    ).startSplashFlow();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Appmatic Infotech',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
