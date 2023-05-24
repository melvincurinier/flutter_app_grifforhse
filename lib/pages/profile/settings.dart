import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  void resetScoreAndCards() {
    // Implémentez cette fonction pour réinitialiser le score et les cartes à 0.
    print('Score and cards have been reset');
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
          Text(
            'Comment ça marche ?',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color : Colors.grey[350], shadows: <Shadow>[Shadow(offset: Offset(1.0,1.0),blurRadius: 2.0, color: Color.fromARGB(255,0,0,0)),]),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6.0,
                  offset: Offset(0,2),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '1. Choissie les propositions que ton employeur/entreprise respecte : clique sur le bouton a gauche si ce n\'est pas respecté, clique sur le coeur si c\'a l\'est !\n2. Accède à tes résultats dans le deuxième onglet, et découvre dans quel domaine ton entreprise n\'est pas aux normes\n',
            ),
          ),
          Text(
            'Confidentialité',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color : Colors.grey[350], shadows: <Shadow>[Shadow(offset: Offset(1.0,1.0),blurRadius: 2.0, color: Color.fromARGB(255,0,0,0)),]),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6.0,
                  offset: Offset(0,2),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'GrifforHSE ne collecte aucune donnée, même anonymisée. Tes réponses sont enregistrées uniquement sur ton téléphone et tu peux les réinitialisé a tout moment.\nLes résultats ne constitue en rien un moyen juridique envers votre entreprise, ils sont là pour t\avertir et te conseiller.',
            ),
          ),
          Text(
            'Résultats',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color : Colors.grey[350], shadows: <Shadow>[Shadow(offset: Offset(1.0,1.0),blurRadius: 2.0, color: Color.fromARGB(255,0,0,0)),]),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6.0,
                  offset: Offset(0,2),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                Text(
                  'Tes résultats enregistrés sur cet appareil peuvent être réinitialisés en appuyant sur le bouton ci-dessous.',
                ),
                ElevatedButton(
                  child: Text('Réinitialiser score et cartes'),
                  onPressed: resetScoreAndCards,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
