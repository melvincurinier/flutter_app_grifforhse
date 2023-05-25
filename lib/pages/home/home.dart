import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_grifforhse/pages/resultats/user_score.dart';
import 'package:flutter_app_grifforhse/pages/home/carte_model.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Ajout du CardController
  final CardController cardController = CardController();

  @override
  Widget build(BuildContext context) {
   var cardModel = Provider.of<CardModel>(context);
    var userScore = Provider.of<UserScore>(context, listen: false);

    return Center(
      child: Stack(
        children: [
          //Background text
          Center(
            child: Text(
              "On vous a dit d'arretez de swiper !",
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 400.0,
                child: TinderSwapCard(
                  orientation: AmassOrientation.BOTTOM,
                  totalNum: cardModel.currentCards.length,
                  stackNum: 3,
                  swipeEdge: 4.0,
                  maxWidth: MediaQuery.of(context).size.width * 0.9,
                  maxHeight: MediaQuery.of(context).size.width * 0.9,
                  minWidth: MediaQuery.of(context).size.width * 0.8,
                  minHeight: MediaQuery.of(context).size.width * 0.8,
                  cardBuilder: (context, index) => Card(
                    color: cardModel.currentCards[index].category.color,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          cardModel.currentCards[index].content,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  cardController: cardController,
                  swipeUpdateCallback:
                      (DragUpdateDetails details, Alignment align) {
                    /// Get swiping card's alignment
                  },
                  swipeCompleteCallback:
                      (CardSwipeOrientation orientation, int index) {
                    /// Get orientation & index of swiped card!
                    if (orientation == CardSwipeOrientation.RIGHT) {
                       userScore.updateScore(
                           cardModel.currentCards[index].category.name,
                           cardModel.currentCards[index].value);
                      cardModel.nextCard();
                    }
                    if (orientation == CardSwipeOrientation.LEFT) {
                      cardModel.nextCard();
                    }
                  },
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      cardController.triggerLeft();
                      cardModel.nextCard();
                    },
                  ),
                  SizedBox(width: 30),
                  ElevatedButton(
                    onPressed: () {
                      cardController.triggerLeft();
                      cardModel.nextCard();
                    },
                    child: Text("Je ne sais pas"),
                  ),
                  SizedBox(width: 30),
                  IconButton(
                      icon: Icon(Icons.favorite),
                      onPressed: () {
                         userScore.updateScore(
                             cardModel
                                 .currentCards[cardModel.currentIndex].category.name,
                             cardModel.currentCards[cardModel.currentIndex].value);
                        cardController.triggerRight();
                        cardModel.nextCard();
                      }),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
