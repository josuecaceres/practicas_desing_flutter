import 'package:flutter/material.dart';
import 'package:disenos/src/screens/screens.dart';

class LayaoutModel with ChangeNotifier {
  Widget _currentPage = const SlideShowScreen();

  Widget get currentPage => _currentPage;
  set currentPage(Widget page) {
    _currentPage = page;
    notifyListeners();
  }
}
