import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My App')),
        drawer: Drawer(
          child: SafeArea(
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.blue),
                  accountName: Text("Said Ouchrif"),
                  accountEmail: Text("saidouchrif16@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("images/profile.png"),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  onTap: () {
                    // Handle Home tap
                  },
                ),
                ListTile(
                  leading: Icon(Icons.people),
                  title: Text('Users'),
                  onTap: () {
                    // Handle Users tap
                  },
                ),
                ListTile(
                  leading: Icon(Icons.business),
                  title: Text('Projects'),
                  onTap: () {
                    // Handle Projects tap
                  },
                ),
                ListTile(
                  leading: Icon(Icons.article),
                  title: Text('Posts'),
                  onTap: () {
                    // Handle Posts tap
                  },
                ),
                ListTile(
                  leading: Icon(Icons.contact_mail),
                  title: Text('Contact Us'),
                  onTap: () {
                    // Handle Contact Us tap
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () {
                    // Handle Settings tap
                  },
                ),
              ],
            ),
          ),
        ),
        body: Mybody(),
      ),
    );
  }
}

class Mybody extends StatelessWidget {
  const Mybody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Welcome to My First Flutter App!')),
    );
  }
}
