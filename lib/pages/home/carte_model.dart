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
  List<CardCategory> categories = [];
  List<CardData> cards = [];

  CardModel() {
    _initCategories();
    _initCards();
  }

  void _initCategories() {
    categories = [
      CardCategory('Hygiène', Colors.blue),
      CardCategory('Sécurité', Colors.red),
      CardCategory('Environnement', Colors.green),
    ];
  }

  void _initCards() {
    cards = [
      CardData('Sur votre lieux de travail: Les zones sales sont elles séparé des zones propres ?', 1, categories[0]),
      CardData('L\'accès au local poubelle passe-t-il par les cuisines ?', 1, categories[0]),
      CardData('Les sanitaires des clients sont-ils différents de ceux du personnel ?', 1, categories[0]),
      CardData('Y-a-t\'il à votre disposition des bacs de trie ?', 1, categories[2]),
      CardData('Portez-vous des équipements de protection obligatoire types bouchons d\'oreilles, casque ou gants ?', 1, categories[1]),
      CardData('Vous êtes arrivé à la fin des propositions.\n(Vous pouvez arrettez de swiper)', 0, CardCategory('Fin', Colors.grey)),
    ];
  }

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