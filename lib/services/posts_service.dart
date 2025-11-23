import 'dart:convert'; // Fournit jsonDecode pour convertir le JSON en objets Dart
import 'package:http/http.dart' as http; // Package HTTP pour effectuer les requêtes
import 'package:github_api_flutter_app/models/post.dart'; // Modèle Post pour typer les données

class PostsService { // Service pour interagir avec l'API JSONPlaceholder
  static const String baseUrl = "https://jsonplaceholder.typicode.com"; // URL de base de l'API

  Future<List<Post>> fetchPosts() async { // Récupère une liste de posts
    final url = Uri.parse("$baseUrl/posts"); // Construit l'URI de l'endpoint /posts
    final response = await http.get(url); // Exécute une requête GET

    if (response.statusCode == 200) { // Vérifie que la réponse est OK
      List data = jsonDecode(response.body); // Décode le corps JSON en liste dynamique
      return data.map((json) => Post.fromJson(json)).toList(); // Convertit chaque entrée en objet Post
    } else { // En cas d'erreur HTTP
      throw Exception("Failed to load posts: ${response.statusCode}"); // Lève une exception avec le code
    } // Fin du if/else
  } // Fin de fetchPosts
} // Fin de la classe PostsService
