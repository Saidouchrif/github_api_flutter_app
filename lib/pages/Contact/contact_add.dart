import 'package:flutter/material.dart'; // Importe la bibliothèque Material
import 'package:github_api_flutter_app/models/contact_model.dart'; // Modèle Contact

class AddContact extends StatelessWidget { // Écran d'ajout de contact (stateless)
  AddContact({super.key}); // Constructeur avec clé optionnelle

  final nameController = TextEditingController(); // Contrôleur pour le champ nom
  final emailController = TextEditingController(); // Contrôleur pour le champ email
  final phoneController = TextEditingController(); // Contrôleur pour le champ téléphone

  @override // Surcharge de build
  Widget build(BuildContext context) { // Construit l'interface
    return Scaffold( // Structure de page
      appBar: AppBar(title: Text("Add Contact"),
      backgroundColor: Colors.blueAccent,
      ), // Barre d'app avec le titre
      body: Padding( // Ajoute des marges internes
        padding: const EdgeInsets.all(16.0), // Padding uniforme de 16
        child: Column( // Colonne de champs et bouton
          children: [ // Enfants de la colonne
            TextField( // Champ texte pour le nom
              controller: nameController, // Contrôleur du nom
              decoration: InputDecoration(labelText: "Name"), // Libellé du champ
            ), // Fin du TextField (nom)
            TextField( // Champ texte pour l'email
              controller: emailController, // Contrôleur de l'email
              decoration: InputDecoration(labelText: "Email"), // Libellé du champ
            ), // Fin du TextField (email)
            TextField( // Champ texte pour le téléphone
              controller: phoneController, // Contrôleur du téléphone
              keyboardType: TextInputType.phone, // Clavier numérique (téléphone)
              decoration: InputDecoration(labelText: "Phone"), // Libellé du champ
            ), // Fin du TextField (téléphone)

            SizedBox(height: 20), // Espace vertical de 20px

            ElevatedButton( // Bouton d'action
              onPressed: () { // Callback au clic
                final newContact = Contact( // Crée un nouveau contact
                  name: nameController.text, // Récupère le nom saisi
                  email: emailController.text, // Récupère l'email saisi
                  phone: phoneController.text, // Récupère le téléphone saisi
                ); // Fin de la création du contact

                Navigator.pop(context, newContact);  // Retourne à l'écran précédent avec le contact créé
              }, // Fin de onPressed
              child: Text("Add Contact"), // Libellé du bouton
            ) // Fin de ElevatedButton
          ], // Fin des children
        ), // Fin de Column
      ), // Fin de Padding
    ); // Fin de Scaffold
  } // Fin de build
} // Fin de la classe AddContact