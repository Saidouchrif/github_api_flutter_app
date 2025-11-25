import 'package:flutter/material.dart'; // Importe la bibliothèque Material
import 'package:github_api_flutter_app/models/contact_model.dart'; // Modèle Contact

class UpdateContact extends StatelessWidget { // Écran de mise à jour d'un contact
  final Contact contact; // Contact à modifier

  UpdateContact({super.key, required this.contact}); // Constructeur avec contact requis

  @override // Surcharge de build
  Widget build(BuildContext context) { // Construit l'interface
    final nameController = TextEditingController(text: contact.name); // Pré-remplit le champ nom
    final emailController = TextEditingController(text: contact.email); // Pré-remplit le champ email
    final phoneController = TextEditingController(text: contact.phone); // Pré-remplit le champ téléphone
    return Scaffold( // Structure de page
      appBar: AppBar(title: Text('Update Contact'),
      backgroundColor: Colors.blueAccent,
      ), // Titre de la page
      body: Padding(padding:  // Widget de padding
        const EdgeInsets.all(16.0), // Ajoute du padding tout autour
        child: Column( // Organise les champs verticalement
          children: [ // Enfants de la colonne
            TextField( // Champ de texte pour le nom
              controller: nameController, // Contrôleur du nom
              decoration: InputDecoration(labelText: "Name"), // Libellé "Name"
            ), // Fin TextField nom
            TextField( // Champ de texte pour l'email
              controller: emailController, // Contrôleur de l'email
              decoration: InputDecoration(labelText: "Email"), // Libellé "Email"
            ), // Fin TextField email
            TextField( // Champ de texte pour le téléphone
              controller: phoneController, // Contrôleur du téléphone
              keyboardType: TextInputType.phone, // Clavier de type téléphone
              decoration: InputDecoration(labelText: "Phone"), // Libellé "Phone"
            ), // Fin TextField téléphone
            SizedBox(height: 20), // Espace vertical entre les champs et le bouton
            ElevatedButton( // Bouton pour valider la mise à jour
              onPressed: () { // Callback lors de l'appui
                final updatedContact = Contact( // Construit un nouveau contact mis à jour
                  name: nameController.text, // Nom saisi
                  email: emailController.text, // Email saisi
                  phone: phoneController.text, // Téléphone saisi
                ); // Fin de la construction

                Navigator.pop(context, updatedContact); // Retourne l'objet mis à jour à l'écran précédent
              }, // Fin de onPressed
              child: Text("Update Contact"), // Libellé du bouton
            ) // Fin de ElevatedButton
          ], // Fin des children de la colonne
        ), // Fin de Column
      ), // Fin de Padding
    ); // Fin de Scaffold
  } // Fin de build
} // Fin de la classe UpdateContact
