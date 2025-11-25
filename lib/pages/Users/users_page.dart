import 'package:flutter/material.dart'; // Importe les widgets Material
import 'package:github_api_flutter_app/models/github_user.dart'; // Modèle d'utilisateur GitHub
import 'package:github_api_flutter_app/services/github_service.dart'; // Service GitHub pour les appels API
import 'package:url_launcher/url_launcher.dart'; // Ouvre des liens dans le navigateur

class UsersPage extends StatefulWidget { // Widget avec état pour l'écran des utilisateurs
  const UsersPage({super.key}); // Constructeur const

  @override // Méthode surchargée
  State<UsersPage> createState() => _UsersPageState(); // Crée l'état associé
}

class _UsersPageState extends State<UsersPage> { // État de UsersPage
  final GithubService _githubService = GithubService(); // Instance du service GitHub
  late Future<List<GithubUser>> _futureUsers; // Future qui contiendra la liste d'utilisateurs

  @override // Cycle de vie: initState
  void initState() { // Initialisation de l'état
    super.initState(); // Appel au parent
    _futureUsers = _githubService.fetchUsers(); // Lance la récupération des utilisateurs
  } // Fin de initState

  void openUserProfile(String url) async { // Ouvre un profil utilisateur dans le navigateur externe
    if (url.isEmpty) return; // Ne fait rien si l'URL est vide
    final uri = Uri.parse(url); // Convertit la chaîne en Uri
    if (await canLaunchUrl(uri)) { // Vérifie si l'URL peut être lancée
      await launchUrl(uri, mode: LaunchMode.externalApplication); // Ouvre dans une application externe
    } else { // Si impossible d'ouvrir
      ScaffoldMessenger.of(context).showSnackBar( // Affiche un message d'erreur
        const SnackBar(content: Text("Could not open profile")), // Contenu du SnackBar
      ); // Fin du SnackBar
    } // Fin du if/else
  } // Fin de openUserProfile

  @override // Surcharge de build
  Widget build(BuildContext context) { // Construit l'interface de la page
    return Scaffold( // Structure de base de la page
      appBar: AppBar(title: const Text("GitHub Users"), // Barre d'app avec le titre
      backgroundColor: Colors.blueAccent,
      ), // Titre de la page
      body: FutureBuilder<List<GithubUser>>( // Construit en fonction de l'état du Future
        future: _futureUsers, // Le futur à écouter
        builder: (context, snapshot) { // Fonction de construction réactive
          if (snapshot.connectionState == ConnectionState.waiting) { // Si en cours de chargement
            return const Center(child: CircularProgressIndicator()); // Affiche un loader centré
          } // Fin du if waiting

          if (snapshot.hasError) { // Si une erreur est survenue
            return Center(child: Text("Error: ${snapshot.error}")); // Affiche l'erreur
          } // Fin du if erreur

          final users = snapshot.data ?? []; // Récupère les utilisateurs ou liste vide

          if (users.isEmpty) { // Si la liste est vide
            return const Center(child: Text("No users found.")); // Affiche un message
          } // Fin du if vide

          return ListView.builder( // Construit la liste paresseuse des éléments
            itemCount: users.length, // Nombre d'éléments
            itemBuilder: (context, index) { // Construit chaque item
              final user = users[index]; // Utilisateur courant

              return ListTile( // Élément de liste visuel
                leading: CircleAvatar( // Avatar circulaire
                  backgroundImage: NetworkImage(user.avatarUrl), // Image distante de l'avatar
                ), // Fin du CircleAvatar
                title: Text( // Titre de l'item
                  user.login, // Affiche le login de l'utilisateur
                  style: const TextStyle( // Style du texte
                    fontWeight: FontWeight.bold, // En gras
                    color: Colors.blueAccent, // Couleur bleue
                  ), // Fin du style
                ), // Fin du titre
                subtitle: Text(user.htmlUrl), // Sous-titre: URL du profil
                trailing: const Icon(Icons.arrow_forward_ios, size: 16), // Icône directionnelle
                onTap: () { // Action au tap
                  openUserProfile(user.htmlUrl); // Ouvre le profil dans le navigateur
                }, // Fin de onTap
              ); // Fin de ListTile
            }, // Fin de itemBuilder
          ); // Fin de ListView.builder
        }, // Fin du builder
      ), // Fin de FutureBuilder
    ); // Fin de Scaffold
  } // Fin de build
} // Fin de la classe _UsersPageState
