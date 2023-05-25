import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_grifforhse/pages/resultats/user_score.dart';

class CardCategory {
  final String name;
  final Color color;

  CardCategory(this.name, this.color);
}

class CardData {
  String content;
  int value;
  CardCategory category;

  CardData(this.content, this.value, this.category);
}

class CardModel with ChangeNotifier {
  int currentIndex = 0;


  List<CardData> cards = [
    CardData(
        'Sur votre lieux de travail: Les zones sales sont elles séparé des zones propres ?',
        1,
        CardCategory('Hygiène', Colors.blue)
      ),
    CardData(
        'L\'accès au local poubelle passe-t-il par les cuisines ?',
        1,
        CardCategory('Hygiène', Colors.blue)
      ),
    CardData(
        'Les sanitaires des clients sont-ils différents de ceux du personel ?',
        1,
        CardCategory('Hygiène', Colors.blue)
      ),
      CardData(
        'Y-a-t\'il a votre disposition des bacs de trie ?',
        1,
        CardCategory('Environnement', Colors.green)
      ),
      CardData(
        'Portez vous des équipements de protection obligatoire types bouchons d\'oreils, casque ou gants ?',
        1,
        CardCategory('Sécurité', Colors.red)
      ),
    CardData(
        'Vous êtes arrivez a la fin des propositions.',
        0,
      CardCategory('Fin', Colors.grey)
      ),
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
