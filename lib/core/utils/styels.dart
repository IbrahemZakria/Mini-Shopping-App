import 'package:flutter/material.dart';

abstract class Styles {
  static const kprimarycolor = Color(0xff100B20);
  static const kNavigateDuration = Duration(milliseconds: 500);
  static const kwhitecolor = Color(0xfFFFFFFf);
  static const kstarcolor = Color(0xfFFFDD4F);
  static const TextStyle textStyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: kwhitecolor, // kprimarycolor
  );
  static const TextStyle textStyle20 = TextStyle(
    fontSize: 20,
    color: kwhitecolor, // kprimarycolor
  );
  static const TextStyle textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.grey,
  );
  static const TextStyle textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: kwhitecolor, // kprimarycolor
  );
}
