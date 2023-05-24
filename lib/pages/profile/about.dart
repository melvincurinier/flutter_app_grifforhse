import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('À propos de nous'),
      ),
      body: ListView(
        children: [
          _buildDeveloperCard('BRISSET', 'Hugo'),
          _buildDeveloperCard('CURINIER', 'Melvin'),
          _buildDeveloperCard('DHUME', 'Tilian'),
        ],
      ),
    );
  }

  Widget _buildDeveloperCard(String nom, String prenom, /*String imagePath*/) {
    return Card(
      color: Colors.blue,
      child: ListTile(
        leading: CircleAvatar(
          //backgroundImage: AssetImage(imagePath),
          radius: 30,
        ),
        title: Text(
          '$nom $prenom',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'Co-développeur',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
