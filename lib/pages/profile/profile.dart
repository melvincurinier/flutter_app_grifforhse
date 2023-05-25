import 'package:flutter/material.dart';
import 'package:flutter_app_grifforhse/pages/profile/about.dart';
import 'package:flutter_app_grifforhse/pages/profile/settings.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final String name = 'John Doe';
  final String pseudo = 'johndoe123';
  final String email = 'johndoe@example.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Name'),
            subtitle: Text(name),
          ),
          ListTile(
            title: Text('Pseudo'),
            subtitle: Text(pseudo),
          ),
          ListTile(
            title: Text('Email'),
            subtitle: Text(email),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('À propos de nous'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}