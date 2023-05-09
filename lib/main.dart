import 'package:flutter/material.dart';
import 'package:flutter_app_grifforhse/pages/home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("GrifforHSE"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color.fromARGB(255, 244, 73, 54),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(
              icon: Icon(Icons.adf_scanner), label: 'Resultat'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Options'),
        ],
      ),
    ));
  }
}
