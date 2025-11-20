import 'package:flutter/material.dart';

class Myposts extends StatelessWidget {
  const Myposts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts Page'),
      ),
      body: Center(
        child: Text('Posts Page Content'),
      ),
    );
  }
}