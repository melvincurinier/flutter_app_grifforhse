import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_app_grifforhse/pages/home/home.dart';
import 'package:flutter_app_grifforhse/pages/resultats/resultats.dart';
import 'package:flutter_app_grifforhse/pages/profile/profile.dart';
import 'package:flutter_app_grifforhse/pages/resultats/user_score.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserScore(),
      child: MyAPP(),
    ),
  );
}

class MyAPP extends StatefulWidget {
  const MyAPP({super.key});

  @override
  State<MyAPP> createState() => _MyAPPState();
}

class _MyAPPState extends State<MyAPP> {
  int _currentIndex = 0;

  setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("GrifforHSE"),
      ),
      body: [HomePage(), ResultPage(), ProfilePage()][_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setCurrentIndex(index),
        selectedItemColor: Color.fromARGB(255, 244, 73, 54),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_chart_outlined), label: 'Resultat'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded), label: 'Profile'),
        ],
      ),
    ));
  }
}
