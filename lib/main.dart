import 'package:flutter/material.dart';
import 'package:github_api_flutter_app/pages/Contact/contact_add.dart';
import 'package:github_api_flutter_app/pages/Home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(), 
      initialRoute: '/',
      routes: {
        "/addContact": (context) => AddContact(),
      },
    );
  }
}




