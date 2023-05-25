import 'package:flutter/material.dart';
import 'package:flutter_app_grifforhse/pages/home/carte_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_grifforhse/pages/resultats/user_score.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  void resetScoreAndCards() {
    Provider.of<UserScore>(context, listen: false).reset();
    Provider.of<CardModel>(context, listen: false).reset();

  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Les cartes et les scores ont été réinitialisés.'),
        duration: Duration(seconds: 2),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          sectionTitle('Comment ça marche ?'),
          contentContainer('1. Choissie les propositions que ton employeur/entreprise respecte : clique sur le bouton a gauche si ce n\'est pas respecté, clique sur le coeur si c\'a l\'est !\n2. Accède à tes résultats dans le deuxième onglet, et découvre dans quel domaine ton entreprise n\'est pas aux normes\n'),
          SizedBox(height: 20),
          sectionTitle('Confidentialité'),
          contentContainer('GrifforHSE ne collecte aucune donnée, même anonymisée. Tes réponses sont enregistrées uniquement sur ton téléphone et tu peux les réinitialisé a tout moment.\nLes résultats ne constitue en rien un moyen juridique envers votre entreprise, ils sont là pour t\'avertir et te conseiller.'),
          SizedBox(height: 20),
          sectionTitle('Résultats'),
          contentContainerWithButton(
            'Tes résultats enregistrés sur cet appareil peuvent être réinitialisés en appuyant sur le bouton ci-dessous.',
            'Réinitialiser vos resultats',
            context
          ),
        ],
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.grey[600],
          shadows: <Shadow>[
            Shadow(
                offset: Offset(2.0, 2.0),
                color: Color.fromARGB(255, 0, 0, 0)),
          ]),
    );
  }

  Widget contentContainer(String text) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6.0,
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(text),
    );
  }

  Widget contentContainerWithButton(String text, String buttonText, BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6.0,
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: <Widget>[
          Text(text),
          SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
            child: Text(buttonText),
            onPressed: () => resetScoreAndCards(),
          ),
        ],
      ),
    );
  }
}