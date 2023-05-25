import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserScore with ChangeNotifier {
  Map<String, int> scores = {};

  void updateScore(String category, int value) {
    if (!scores.containsKey(category)) {
      scores[category] = 0;
    }
    scores[category] = scores[category]! + value;
    notifyListeners();
  }

  int getScore(String category) {
    return scores.containsKey(category) ? scores[category]! : 0;
  }

  void reset() {
    scores.clear();
    notifyListeners();
  }
}
