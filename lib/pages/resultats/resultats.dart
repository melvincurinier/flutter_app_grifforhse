import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_grifforhse/pages/resultats/user_score.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userScore = Provider.of<UserScore>(context);
    final maxScorePerCategory = 10; // replace with your max score per category

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildScoreBar('Hygiène', Colors.blue, userScore.getScore('Hygiène') / maxScorePerCategory),
            _buildScoreBar('Sécurité', Colors.red, userScore.getScore('Sécurité') / maxScorePerCategory),
            _buildScoreBar('Environnement', Colors.green, userScore.getScore('Environnement') / maxScorePerCategory),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreBar(String category, Color color, double percent) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LinearPercentIndicator(
        lineHeight: 20.0,
        percent: percent,
        backgroundColor: Colors.grey,
        progressColor: color,
        center: Text(
          '$category: ${(percent * 100).toStringAsFixed(1)}%',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
