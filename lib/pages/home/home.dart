import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_grifforhse/pages/resultats/user_score.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _cardIndex = 0;
  int _scoreUser = 0;
  bool _isLastCard = false;

  final List<Color> _cardColors = [
    Colors.blue,
    Colors.orange,
    Colors.green,
    Colors.grey,
  ];

  final List<String> _cardTexts = [
    'Sur votre lieux de travail: Les zones sales sont elles séparé des zones propres ?',
    'L\'accès au local poubelle passe-t-il par les cuisines ?',
    'Les sanitaires des clients sont-ils différents de ceux du personel ?',
    'It\'s Over\nWell Done !',
  ];

  final List<int> _cardValue = [
    1,
    1,
    1,
    0,
  ];

  void _showNextCard() {
      setState(() {
        if(_cardIndex <= _cardColors.length - 2)
        _cardIndex = (_cardIndex + 1);
      });
    _isLastCard = _cardIndex >= _cardColors.length - 1;
  }

  void _showNextCardLike() {
    _scoreUser = _scoreUser + _cardValue[_cardIndex];
    Provider.of<UserScore>(context, listen: false).updateScore(_scoreUser);
      setState(() {
        if(_cardIndex <= _cardColors.length - 2)
        _cardIndex = (_cardIndex + 1);
      });
    _isLastCard = _cardIndex == _cardColors.length - 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_isLastCard)
            Text(
              'Score: $_scoreUser',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          Container(
            height: 500,
            width: 400,
            margin: EdgeInsets.only(top: 30),
            color: _cardColors[_cardIndex],
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  _cardTexts[_cardIndex],
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
                onPressed: _showNextCard,
                // Action à effectuer lorsque le bouton avec la croix est pressé
              ),
              SizedBox(
                  width:
                      30), // Ajoute un espace horizontal de 10 pixels entre les boutons
              ElevatedButton(
                onPressed: _showNextCard,
                // Action à effectuer lorsque le bouton "Je ne sais pas" est pressé
                child: Text("Je ne sais pas"),
              ),
              SizedBox(
                  width:
                      30), // Ajoute un espace horizontal de 10 pixels entre les boutons
              IconButton(
                icon: Icon(Icons.favorite),
                onPressed: _showNextCardLike,
                // Action à effectuer lorsque le bouton avec le cœur est pressé
              ),
            ],
          ),
        ],
      ),
    );
  }
}
