import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_grifforhse/pages/resultats/user_score.dart';
import 'package:flutter_app_grifforhse/pages/home/carte_model.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var cardModel = Provider.of<CardModel>(context);
    var card = cardModel.getCurrentCard();
    var userScore = Provider.of<UserScore>(context, listen: false);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 400,
            width: 300,
            margin: EdgeInsets.only(top: 30),
            color: card.category.color,
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  card.content,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  cardModel.nextCard();
                },
                // Action à effectuer lorsque le bouton avec la croix est pressé
              ),
              SizedBox(
                  width:
                      30), // Ajoute un espace horizontal de 10 pixels entre les boutons
              ElevatedButton(
                onPressed: () {
                  cardModel.nextCard();
                },
                // Action à effectuer lorsque le bouton "Je ne sais pas" est pressé
                child: Text("Je ne sais pas"),
              ),
              SizedBox(
                  width:
                      30), // Ajoute un espace horizontal de 10 pixels entre les boutons
              IconButton(
                  icon: Icon(Icons.favorite),
                  onPressed: () {
                    userScore.updateScore(card.category.name, card.value);
                    cardModel.nextCard();
                  }
                  // Action à effectuer lorsque le bouton avec le cœur est pressé
                  ),
            ],
          ),
        ],
      ),
    );
  }
}
