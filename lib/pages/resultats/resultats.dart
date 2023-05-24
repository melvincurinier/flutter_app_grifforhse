import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_grifforhse/pages/resultats/user_score.dart';



class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userScore = Provider.of<UserScore>(context);
    return Center(
      child: Text("Result Page. Score: ${userScore.score}"),
    );
  }
}
