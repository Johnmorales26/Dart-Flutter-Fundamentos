import 'package:flutter/material.dart';

Color getColorByIndexTab(BuildContext context, int index) {
  Color? color;
  switch (index) {
    case 0:
      color = const Color(0xff618DE5);
      break;
    case 1:
      color = const Color(0xffFFAF47);
      break;
    case 2:
      color = const Color(0xffF27154);
      break;
  }
  return color ?? Colors.white;
}
