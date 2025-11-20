import 'package:flutter/material.dart';
import 'package:github_api_flutter_app/models/contact_model.dart';

class AddContact extends StatelessWidget {
  AddContact({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Contact")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(labelText: "Phone"),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                final newContact = Contact(
                  name: nameController.text,
                  email: emailController.text,
                  phone: phoneController.text,
                );

                Navigator.pop(context, newContact); 
              },
              child: Text("Add Contact"),
            )
          ],
        ),
      ),
    );
  }
}