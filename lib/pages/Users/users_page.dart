import 'package:flutter/material.dart';

class Myusers extends StatelessWidget {
  const Myusers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users Page'),
      ),
      body: Center(
        child: Text('Users Page Content'),
      ),
    );
  }
}