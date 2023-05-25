import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_grifforhse/pages/resultats/user_score.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userScore = Provider.of<UserScore>(context);
    final maxScorePerCategory = 3;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildScoreBar('Hygiène', Colors.blue,
                userScore.getScore('Hygiène'), maxScorePerCategory),
            _buildScoreBar('Sécurité', Colors.red,
                userScore.getScore('Sécurité'), maxScorePerCategory),
            _buildScoreBar('Environnement', Colors.green,
                userScore.getScore('Environnement'), maxScorePerCategory),
          ],
        ),
      ),
    );
  }
}

Widget _buildScoreBar(String category, Color color, int score, int maxScore) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
            height:
                5), // Optionnel, pour ajouter un espace entre le titre et la barre
        FAProgressBar(
          currentValue: score.toDouble() / maxScore.toDouble() * 100.0,
          maxValue: 100,
          size: 50,
          direction: Axis.horizontal,
          backgroundColor: color.withOpacity(0.70),
          progressColor: color,
          displayText: '%',
        ),
      ],
    ),
  );
}
