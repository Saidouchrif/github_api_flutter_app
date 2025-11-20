import 'package:flutter/material.dart';

class MyProject extends StatelessWidget {
  const MyProject({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Projects Page'),
      ),
      body: Center(
        child: Text('projects page content'),
      ),
    );
  }
}