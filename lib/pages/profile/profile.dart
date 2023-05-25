import 'package:flutter/material.dart';
import 'package:flutter_app_grifforhse/pages/profile/about.dart';
import 'package:flutter_app_grifforhse/pages/profile/settings.dart';
import 'package:flutter_app_grifforhse/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../../services/auth_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

    void signOutUser(BuildContext context) {
    AuthService().signOut(context);
  }
  
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Name'),
            subtitle: Text(user.name),
          ),
          ListTile(
            title: Text('Email'),
            subtitle: Text(user.email),
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
            ElevatedButton(
            onPressed: () => signOutUser(context),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              textStyle: MaterialStateProperty.all(
                const TextStyle(color: Colors.white),
              ),
              minimumSize: MaterialStateProperty.all(
                Size(MediaQuery.of(context).size.width / 2.5, 50),
              ),
            ),
            child: const Text(
              "Sign Out",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          ],
        ),
      ),
      
    );
  }
}