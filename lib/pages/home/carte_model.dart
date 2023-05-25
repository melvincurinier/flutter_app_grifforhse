import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_grifforhse/pages/resultats/user_score.dart';

class CardData {
  String content;
  int value;
  Color color;

  CardData(this.content, this.value, this.color);
}

class CardModel with ChangeNotifier {
  int currentIndex = 0;

  List<CardData> cards = [
    CardData(
        'Sur votre lieux de travail: Les zones sales sont elles séparé des zones propres ?',
        1,
        Colors.red),
    CardData('L\'accès au local poubelle passe-t-il par les cuisines ?', 1,
        Colors.blue),
    CardData(
        'Les sanitaires des clients sont-ils différents de ceux du personel ?',
        1,
        Colors.green),
    CardData('Vous êtes arrivez a la fin des propositions.', 0, Colors.grey),
  ];

  CardData getCurrentCard() {
    return cards[currentIndex];
  }

  void nextCard() {
    if (currentIndex < cards.length - 1) {
      currentIndex++;
    }
    notifyListeners();
  }

  void reset() {
    currentIndex = 0;
    notifyListeners();
  }
}
