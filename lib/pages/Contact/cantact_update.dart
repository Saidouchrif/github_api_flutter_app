import 'package:flutter/material.dart';
import 'package:github_api_flutter_app/models/contact_model.dart';

class UpdateContact extends StatelessWidget {
  final Contact contact;

  UpdateContact({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: contact.name);
    final emailController = TextEditingController(text: contact.email);
    final phoneController = TextEditingController(text: contact.phone);
    return Scaffold(
      appBar: AppBar(title: Text('Update Contact')),
      body: Padding(padding: 
        const EdgeInsets.all(16.0),
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
                final updatedContact = Contact(
                  name: nameController.text,
                  email: emailController.text,
                  phone: phoneController.text,
                );

                Navigator.pop(context, updatedContact);
              },
              child: Text("Update Contact"),
            )
          ],
        ),
      ),
    );
  }
}
