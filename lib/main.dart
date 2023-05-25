import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_app_grifforhse/pages/home/global.dart';
import 'package:flutter_app_grifforhse/providers/user_provider.dart';
import 'package:flutter_app_grifforhse/screens/signup_screen.dart';
import 'package:flutter_app_grifforhse/services/auth_service.dart';
import 'package:flutter_app_grifforhse/pages/home/carte_model.dart';
import 'package:flutter_app_grifforhse/pages/resultats/user_score.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(
            create: (_) => UserScore()), // Ajout du Provider UserScore
        ChangeNotifierProvider(
            create: (_) => CardModel()), // Ajout du Provider CardModel
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Node Auth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Provider.of<UserProvider>(context).user.token.isEmpty
          ? const SignupScreen()
          : const GlobalApp(),
    );
  }
}
