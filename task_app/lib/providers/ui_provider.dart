import 'package:flutter/material.dart';
import 'package:task_app/utils/utils.dart';

class UiProvider extends ChangeNotifier {
  Color color = const Color(0xff618de5);

  void updateColorByIndex(BuildContext context, int index) {
    color = getColorByIndexTab(context, index);
    notifyListeners();
  }
}