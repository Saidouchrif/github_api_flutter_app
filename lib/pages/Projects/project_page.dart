import 'package:flutter/material.dart'; // Importe les widgets Material
import 'package:github_api_flutter_app/models/github_repo.dart'; // Modèle de dépôt GitHub
import 'package:github_api_flutter_app/services/github_service.dart'; // Service pour appeler l'API GitHub

class ProjectsPage extends StatefulWidget { // Page avec état listant les projets
  const ProjectsPage({super.key}); // Constructeur const

  @override // Indique une méthode surchargée
  State<ProjectsPage> createState() => _ProjectsPageState(); // Crée l'état associé
}

class _ProjectsPageState extends State<ProjectsPage> { // État de ProjectsPage
  final GithubService _githubService = GithubService(); // Instance du service GitHub
  late Future<List<GithubRepo>> _futureRepos; // Future qui contiendra les dépôts

  @override // Surcharge du cycle de vie initState
  void initState() { // Initialisation de l'état
    super.initState(); // Appel au parent
    _futureRepos = _githubService.fetchUserRepos('saidouchrif'); // Récupère les dépôts de l'utilisateur par défaut
  } // Fin de initState

  @override // Surcharge de build
  Widget build(BuildContext context) { // Construit l'interface de la page
    return Scaffold( // Structure de base de la page
      appBar: AppBar(title: const Text('My GitHub Projects'),
      backgroundColor: Colors.blueAccent,
      ), // Titre de la page
      body: FutureBuilder<List<GithubRepo>>( // Construit selon l'état du Future
        future: _futureRepos, // Futur surveillé
        builder: (context, snapshot) { // Fonction de construction réactive
          if (snapshot.connectionState == ConnectionState.waiting) { // Si en chargement
            return const Center(child: CircularProgressIndicator()); // Affiche un indicateur
          } // Fin du if waiting

          if (snapshot.hasError) { // Si une erreur survient
            return Center(child: Text('Error: ${snapshot.error}')); // Affiche le message d'erreur
          } // Fin du if erreur

          final repos = snapshot.data ?? []; // Récupère la liste des dépôts ou liste vide

          if (repos.isEmpty) { // Si aucun dépôt trouvé
            return const Center(child: Text('No projects found.')); // Affiche un message d'absence de données
          } // Fin du if vide

          return ListView.builder( // Construit la liste des dépôts
            itemCount: repos.length, // Nombre d'éléments
            itemBuilder: (context, index) { // Construit chaque item
              final repo = repos[index]; // Dépôt courant
              return ListTile( // Élément de liste visuel
                leading: Image.network( // Icône GitHub via URL
                  "https://cdn-icons-png.flaticon.com/512/25/25231.png", // URL de l'icône
                  width: 32, // Largeur de l'image
                  height: 32, // Hauteur de l'image
                ), // Fin de Image.network
                title: Text( // Titre de l'item
                  repo.name, // Nom du dépôt
                  style: TextStyle( // Style du texte
                    fontWeight: FontWeight.bold, // En gras
                    fontSize: 16, // Taille de police
                    color: Colors.blueAccent, // Couleur bleue accentuée
                  ), // Fin du style
                ), // Fin du titre
                subtitle: Text( // Sous-titre de l'item
                  (repo.description?.isNotEmpty ?? false) // Vérifie si la description est non vide
                      ? repo.description! // Si oui, affiche la description
                      : 'No description', // Sinon, message par défaut
                ), // Fin du sous-titre
                trailing: Text( // Texte à droite (langage)
                  repo.language ?? '', // Langage principal ou vide
                  style: TextStyle( // Style du texte
                    fontStyle: FontStyle.italic, // Italique
                    color: Colors.green, // Couleur verte
                  ), // Fin du style
                ), // Fin de trailing
                onTap: () { // Action lors du tap sur l'item
                  // Optionally, handle tap to open repo URL // Commentaire existant conservé
                }, // Fin de onTap
              ); // Fin de ListTile
            }, // Fin de itemBuilder
          ); // Fin de ListView.builder
        }, // Fin du builder
      ), // Fin de FutureBuilder
    ); // Fin de Scaffold
  } // Fin de build
} // Fin de la classe _ProjectsPageState
