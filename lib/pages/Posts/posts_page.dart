import 'package:flutter/material.dart'; // Importe les widgets Material de Flutter
import 'package:github_api_flutter_app/models/post.dart'; // Importe le modèle Post
import 'package:github_api_flutter_app/services/posts_service.dart'; // Importe le service PostsService

class PostsPage extends StatefulWidget { // Déclare un widget avec état pour la page des posts
  const PostsPage({super.key}); // Constructeur constant avec clé optionnelle

  @override // Indique que la méthode surchargée
  State<PostsPage> createState() => _PostsPageState(); // Crée l'état associé à ce widget
}

class _PostsPageState extends State<PostsPage> { // Classe d'état pour PostsPage
  final PostsService _service = PostsService(); // Instance du service pour récupérer les posts
  late Future<List<Post>> _futurePosts; // Futur qui contiendra la liste des posts

  @override // Surcharge du cycle de vie initState
  void initState() { // Méthode appelée lors de l'initialisation de l'état
    super.initState(); // Appelle l'implémentation parente
    _futurePosts = _service.fetchPosts(); // Lance la récupération des posts
  } // Fin de initState

  @override // Surcharge de build
  Widget build(BuildContext context) { // Construit l'interface de la page
    return Scaffold( // Structure de page avec AppBar et body
      appBar: AppBar(title: const Text("Posts"),
      backgroundColor: Colors.blueAccent,
      ), // Barre d'applications avec le titre "Posts"
      body: FutureBuilder<List<Post>>( // Widget réactif basé sur l'état d'un Future
        future: _futurePosts, // Le futur à écouter
        builder: (context, snapshot) { // Fonction de construction pour les différents états
          if (snapshot.connectionState == ConnectionState.waiting) { // Si la requête est en cours
            return const Center(child: CircularProgressIndicator()); // Affiche un indicateur de chargement centré
          } // Fin du if d'attente

          if (snapshot.hasError) { // Si une erreur est survenue
            return Center(child: Text("Error: ${snapshot.error}")); // Affiche le message d'erreur
          } // Fin du if d'erreur

          final posts = snapshot.data ?? []; // Récupère la liste de posts ou une liste vide par défaut

          return ListView.builder( // Construit une liste paresseuse des éléments
            itemCount: posts.length, // Nombre d'éléments à afficher
            itemBuilder: (context, index) { // Construit chaque item de la liste
              final post = posts[index]; // Récupère l'élément courant

              return Card( // Carte matérielle pour un effet d'élévation
                margin: const EdgeInsets.all(12), // Marge externe autour de la carte
                elevation: 3, // Élévation (ombre) de la carte
                child: ListTile( // Tuile standard avec titre et sous-titre
                  title: Text( // Titre de la tuile
                    post.title, // Affiche le titre du post
                    style: const TextStyle( // Style du texte du titre
                      fontSize: 16, // Taille de police
                      fontWeight: FontWeight.bold, // Gras
                      color: Colors.blue, // Couleur bleue
                    ), // Fin du style
                  ), // Fin du titre
                  subtitle: Text(post.body), // Sous-titre: contenu du post
                ), // Fin de ListTile
              ); // Fin de Card
            }, // Fin de itemBuilder
          ); // Fin de ListView.builder
        }, // Fin du builder
      ), // Fin de FutureBuilder
    ); // Fin de Scaffold
  } // Fin de build
} // Fin de la classe _PostsPageState
