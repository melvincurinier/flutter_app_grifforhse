import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'package:flutter_app_grifforhse/pages/home/home.dart';
import 'package:flutter_app_grifforhse/providers/user_provider.dart';
import 'package:flutter_app_grifforhse/screens/signup_screen.dart';
import 'package:flutter_app_grifforhse/services/auth_service.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
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
          ? const HomePage()
          : const SignupScreen(),
    );
  }
}
