import 'package:flutter/material.dart'; // Importe la bibliothèque Material de Flutter
import 'package:github_api_flutter_app/pages/Contact/contact_page.dart'; // Importe la page de contacts
import 'package:github_api_flutter_app/pages/Posts/posts_page.dart'; // Importe la page des posts
import 'package:github_api_flutter_app/pages/Projects/project_page.dart'; // Importe la page des projets GitHub
import 'package:github_api_flutter_app/pages/Settings/settings_page.dart'; // Importe la page des paramètres
import 'package:github_api_flutter_app/pages/Users/users_page.dart'; // Importe la page des utilisateurs GitHub
class HomePage extends StatelessWidget { // Définition du widget d'accueil (stateless)
  const HomePage({super.key}); // Constructeur const avec clé

  @override // Indique la redéfinition de build
  Widget build(BuildContext context) { // Construit l'interface de la page d'accueil
    return Scaffold( // Structure de base de la page
      appBar: AppBar(title: const Text('Home Page')), // Barre d'app avec le titre
      drawer: Drawer( // Tiroir de navigation latéral
        child: SafeArea( // Assure l'affichage sous les zones sûres (encoches)
          child: ListView( // Liste des éléments de navigation
            padding: EdgeInsets.zero, // Supprime le padding par défaut
            children: [ // Début de la liste d'items
              UserAccountsDrawerHeader( // En-tête avec informations de profil
                decoration: const BoxDecoration(color: Colors.blue), // Fond bleu
                accountName: const Text("Said Ouchrif"), // Nom du compte
                accountEmail: const Text("saidouchrif16@gmail.com"), // Email du compte
                currentAccountPicture: const CircleAvatar( // Avatar circulaire
                  backgroundImage: AssetImage("images/profile.png"), // Image depuis les assets
                ), // Fin de CircleAvatar
              ), // Fin du header de compte
              ListTile( // Élément de menu: Home
                leading: const Icon(Icons.home), // Icône maison
                title: const Text('Home'), // Titre de l'item
                onTap: () { // Action au clic
                  Navigator.pop(context); // Ferme le tiroir
                  Navigator.push(context, // Navigue vers la HomePage
                  MaterialPageRoute(builder: (_)=> const HomePage()) // Crée la route vers HomePage
                  ); // Fin de push
                }, // Fin de onTap
              ), // Fin de ListTile Home
              ListTile( // Élément de menu: Users
                leading: const Icon(Icons.people), // Icône utilisateurs
                title: const Text('Users'), // Titre de l'item
                onTap: () { // Action au clic
                  Navigator.pop(context); // Ferme le tiroir
                  Navigator.push(context, // Navigue vers UsersPage
                  MaterialPageRoute(builder: (_)=> const UsersPage()) // Crée la route vers UsersPage
                  ); // Fin de push
                }, // Fin de onTap
              ), // Fin de ListTile Users
              ListTile( // Élément de menu: Projects
                leading: const Icon(Icons.business), // Icône de projets
                title: const Text('Projects'), // Titre de l'item
                onTap: () { // Action au clic
                  Navigator.pop(context); // Ferme le tiroir
                  Navigator.push(context, // Navigue vers ProjectsPage
                  MaterialPageRoute(builder: (_)=> const ProjectsPage()) // Crée la route vers ProjectsPage
                  ); // Fin de push
                }, // Fin de onTap
              ), // Fin de ListTile Projects
              ListTile( // Élément de menu: Posts
                leading: const Icon(Icons.article), // Icône d'articles
                title: const Text('Posts'), // Titre de l'item
                onTap: () { // Action au clic
                  Navigator.pop(context); // Ferme le tiroir
                  Navigator.push(context, // Navigue vers PostsPage
                  MaterialPageRoute(builder: (_)=> const PostsPage()) // Crée la route vers PostsPage
                  ); // Fin de push
                }, // Fin de onTap
              ), // Fin de ListTile Posts
              ListTile( // Élément de menu: Contact Us
                leading: const Icon(Icons.contact_mail), // Icône de contact
                title: const Text('Contact Us'), // Titre de l'item
                onTap: () { // Action au clic
                  Navigator.pop(context); // Ferme le tiroir
                  Navigator.push( // Lance la navigation
                    context, // Contexte courant
                    MaterialPageRoute(builder: (_) => const ContactPages()), // Crée la route vers ContactPages
                  ); // Fin de push
                }, // Fin de onTap
              ), // Fin de ListTile Contact
              ListTile( // Élément de menu: Settings
                leading: const Icon(Icons.settings), // Icône paramètres
                title: const Text('Settings'), // Titre de l'item
                onTap: () { // Action au clic
                  Navigator.pop(context); // Ferme le tiroir
                  Navigator.push( // Lance la navigation
                    context, // Contexte
                    MaterialPageRoute(builder: (_) => const SettingsPage()), // Route vers SettingsPage
                  ); // Fin de push
                }, // Fin de onTap
              ), // Fin de ListTile Settings
            ], // Fin des children de la ListView
          ), // Fin de ListView
        ), // Fin de SafeArea
      ), // Fin du Drawer

      body: const MyBody(), // Corps de la page: widget personnalisé
    ); // Fin de Scaffold
  } // Fin de build
} // Fin de la classe HomePage
class MyBody extends StatelessWidget { // Widget stateless pour le contenu d'accueil
  const MyBody({super.key}); // Constructeur const

  @override // Redéfinition de build
  Widget build(BuildContext context) { // Construit l'interface du contenu
    return Container( // Conteneur principal
      width: double.infinity, // Prend toute la largeur disponible
      padding: const EdgeInsets.only(top: 40),  // Ajoute un padding en haut

      child: Center( // Centre le contenu
        child: Container( // Carte personnalisée
          padding: const EdgeInsets.all(20), // Padding interne
          margin: const EdgeInsets.symmetric(horizontal: 20), // Marges horizontales
          decoration: BoxDecoration( // Décoration de la carte
            gradient: LinearGradient( // Dégradé de couleurs
              colors: [ // Liste des couleurs
                Colors.blueAccent, // Bleu accentué
                Colors.lightBlue, // Bleu clair
              ], // Fin des couleurs
              begin: Alignment.topLeft, // Début du dégradé en haut à gauche
              end: Alignment.bottomRight, // Fin du dégradé en bas à droite
            ), // Fin du LinearGradient
            borderRadius: BorderRadius.circular(16), // Bords arrondis
            border: Border.all( // Bordure blanche translucide
              color: Colors.white.withOpacity(0.8), // Couleur de la bordure
              width: 2, // Épaisseur de la bordure
            ), // Fin de Border.all
            boxShadow: [ // Liste d'ombres portées
              BoxShadow( // Ombre principale
                color: Colors.black.withOpacity(0.15), // Couleur de l'ombre
                blurRadius: 10, // Rayon de flou
                offset: const Offset(0, 4), // Décalage de l'ombre
              ) // Fin de BoxShadow
            ], // Fin de boxShadow
          ), // Fin de BoxDecoration
          child: const Column( // Colonne de textes (constante)
            crossAxisAlignment: CrossAxisAlignment.start, // Aligne à gauche
            mainAxisSize: MainAxisSize.min, // Taille minimale verticale

            children: [ // Enfants de la colonne
              Text( // Premier texte
                "👋 Welcome!", // Contenu du texte
                style: TextStyle( // Style du texte
                  fontSize: 28, // Taille de police
                  fontWeight: FontWeight.bold, // En gras
                  color: Colors.white, // Couleur blanche
                ), // Fin du style
              ), // Fin du Text
              SizedBox(height: 10), // Espace vertical de 10 pixels
              Text( // Second texte
                "Welcome to My First Flutter App!", // Message d'accueil
                style: TextStyle( // Style du texte
                  fontSize: 18, // Taille de police
                  color: Colors.white70, // Blanc avec opacité (70%)
                ), // Fin du style
              ), // Fin du Text
            ], // Fin des children
          ), // Fin de Column
        ), // Fin du Container interne
      ), // Fin de Center
    ); // Fin du Container principal
  } // Fin de build
} // Fin de la classe MyBody