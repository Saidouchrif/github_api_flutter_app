import 'package:flutter/material.dart'; // Importe la bibliothèque Material de Flutter
import 'package:github_api_flutter_app/pages/Contact/contact_add.dart'; // Importe la page d'ajout de contact
import 'package:github_api_flutter_app/pages/Home/home_page.dart'; // Importe la page d'accueil

void main() { // Point d'entrée de l'application
  runApp(const MyApp()); // Démarre l'application avec le widget racine MyApp
} // Fin de la fonction main

class MyApp extends StatelessWidget { // Widget racine stateless
  const MyApp({super.key}); // Constructeur const avec clé optionnelle

  @override // Surcharge de la méthode build
  Widget build(BuildContext context) { // Construit l'interface utilisateur
    return MaterialApp( // Retourne le conteneur principal de l'application
      home: const HomePage(),  // Définit la page d'accueil
      initialRoute: '/', // Définit la route initiale
      routes: { // Déclare les routes nommées
        "/addContact": (context) => AddContact(), // Route vers la page d'ajout de contact
      }, // Fin de la définition des routes
    ); // Fin de MaterialApp
  } // Fin de build
} // Fin de la classe MyApp




