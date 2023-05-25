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
          _buildDeveloperCard('BRISSET', 'Hugo','hugo.jpg'),
          _buildDeveloperCard('CURINIER', 'Melvin','melvin.jpg'),
          _buildDeveloperCard('DHUME', 'Tillian','tillian.jpg'),
        ],
      ),
    );
  }

  Widget _buildDeveloperCard(String nom, String prenom, String imagePath) {
    return Card(
      color: Colors.blue,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/$imagePath'),
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