import 'package:flutter/cupertino.dart';

class Sigma extends ChangeNotifier {
  double _sigma = 0;

  void setSigma(double newSigma) {
    _sigma = newSigma;
    notifyListeners();
  }

  double get value => _sigma;
}
