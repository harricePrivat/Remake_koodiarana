import 'package:flutter/foundation.dart';

class BottomManagement extends ChangeNotifier {
  int currentIndex = 0;

  void changeIndex(int currentIndex) {
    this.currentIndex = currentIndex;
    notifyListeners();
  }
  
}
