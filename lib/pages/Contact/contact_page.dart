import 'package:flutter/material.dart'; // Importe la bibliothèque Material
import 'package:github_api_flutter_app/models/contact_model.dart'; // Modèle Contact
import 'package:github_api_flutter_app/pages/Contact/cantact_update.dart'; // Écran de mise à jour du contact

class ContactPages extends StatefulWidget { // Écran des contacts (stateful)
  const ContactPages({super.key}); // Constructeur const

  @override // Méthode surchargée
  State<ContactPages> createState() => _ContactPagesState(); // Crée l'état associé
}

class _ContactPagesState extends State<ContactPages> { // État de la page des contacts
  List<Contact> contacts = [ // Liste locale de contacts (données mock)
    Contact(name: "said", email: "said@example.com", phone: "1234567890"), // Contact 1
    Contact(name: "ouchrif", email: "ouchrif@example.com", phone: "0987654321"), // Contact 2
    Contact(name: "hamza", email: "hamza@example.com", phone: "1122334455"), // Contact 3
  ]; // Fin de la liste
  @override // Surcharge de build
  Widget build(BuildContext context) { // Construit l'interface de la page
    return Scaffold( // Structure de base
      appBar: AppBar(title: Text('Contact Us')), // Barre d'app avec titre
      floatingActionButton: FloatingActionButton( // Bouton flottant d'ajout
        // for add contact // Commentaire d'origine
        onPressed: () async { // Action asynchrone au clic
          final newContact = await Navigator.pushNamed(context, '/addContact') as Contact?; // Ouvre l'écran d'ajout et récupère le contact créé
          if (newContact != null) { // Si un contact a été retourné
            setState(() { // Met à jour l'état pour rafraîchir la liste
              contacts.add(newContact); // Ajoute le nouveau contact à la liste
            }); // Fin de setState
          } // Fin du if
        }, // Fin de onPressed
        child: Icon(Icons.add), // Icône d'ajout
      ), // Fin de FloatingActionButton
      body: buildList(), // Corps de la page: liste des contacts
    ); // Fin de Scaffold
  } // Fin de build

  Widget buildList() { // Construit la liste des contacts
    return ListView.builder( // Liste paresseuse
      itemCount: contacts.length, // Nombre d'éléments
      itemBuilder: (context, index) { // Construit chaque élément
        final contact = contacts[index]; // Récupère le contact courant
        return ListTile( // Élément visuel de liste
          leading: CircleAvatar(child: Text(contact.name[0].toUpperCase())), // Avatar avec initiale du nom
          title: Text(contact.name), // Titre: nom du contact
          subtitle: Text('${contact.email}\n${contact.phone}'), // Sous-titre: email et téléphone (sur 2 lignes)
          isThreeLine: true, // Force l'affichage sur 3 lignes max
          // for delete contact // Commentaire d'origine
          trailing: IconButton(onPressed: () { // Bouton de suppression
            setState(() { // Met à jour l'état
              contacts.removeAt(index); // Supprime le contact à l'index
            }); // Fin de setState
            // affichier un message de confirmation // Commentaire d'origine
            ScaffoldMessenger.of(context).showSnackBar( // Affiche un snackbar de confirmation
              SnackBar( // Composant Snackbar
                content: Text('Contact Deleted'), // Message
                duration: Duration(seconds: 2), // Durée d'affichage
                ), // Fin du contenu de SnackBar
            ); // Fin de showSnackBar
          }, icon: Icon(Icons.delete)), // Icône corbeille
          // for update contact // Commentaire d'origine
          onTap: () async{ // Action au tap pour mettre à jour
            final updated = await Navigator.push(context,  // Navigue vers l'écran de mise à jour
            MaterialPageRoute(builder: (_)=> UpdateContact(contact: contact)) // Construit la route avec le contact courant
            ); // Fin de push
            if (updated != null) { // Si un contact mis à jour est renvoyé
              setState(() { // Met à jour l'état
                contacts[index] = updated; // Remplace l'ancien contact par le nouveau
              }); // Fin de setState
            } // Fin du if
          }, // Fin de onTap
        ); // Fin de ListTile
      }, // Fin de itemBuilder
    ); // Fin de ListView.builder
  } // Fin de buildList
} // Fin de la classe _ContactPagesState
