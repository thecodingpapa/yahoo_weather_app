import 'package:flutter/material.dart';

class Pos extends ChangeNotifier {
  double _pagePos = 0;
  final int _page;

  Pos(this._page);

  void setPosition(double position) {
    _pagePos = position - _page;
    notifyListeners();
  }

  double get curPos => _pagePos;
  int get curPage => _page;
}
