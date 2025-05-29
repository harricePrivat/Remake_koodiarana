import 'package:flutter/foundation.dart';

class Scroll1Management extends ChangeNotifier {
  bool isScrolable = true;

  void setScrollable(bool s) {
    isScrolable = s;
    notifyListeners();
  }
}
