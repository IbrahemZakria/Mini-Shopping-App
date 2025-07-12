import 'package:flutter/material.dart';

abstract class Styles {
  static const Color kprimarycolor = Color.from(
    alpha: 1,
    red: 0.129,
    green: 0.588,
    blue: 0.953,
  );
  static const TextStyle textStyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle textStyle28 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: kprimarycolor,
  );
  static const TextStyle textStyle28etalic = TextStyle(fontSize: 28);
  static const TextStyle textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.grey,
  );
  static const TextStyle textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}
