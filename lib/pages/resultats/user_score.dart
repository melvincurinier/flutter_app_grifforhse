import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserScore extends ChangeNotifier {
  int _score = 0;
  int get score => _score;

  void updateScore(int score) {
    _score += score;
    notifyListeners();
  }

  void reset() {
    _score = 0;
    notifyListeners();
  }
}
