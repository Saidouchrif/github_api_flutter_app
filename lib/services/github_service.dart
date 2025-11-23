import 'dart:convert'; // Fournit jsonEncode/jsonDecode pour (dé)sérialiser le JSON
import 'package:http/http.dart' as http; // Client HTTP pour effectuer les requêtes REST
import 'package:github_api_flutter_app/models/github_repo.dart'; // Modèle représentant un dépôt GitHub
import 'package:github_api_flutter_app/models/github_user.dart'; // Modèle représentant un utilisateur GitHub

class GithubService { // Service dédié aux appels de l'API GitHub
  static const String baseUrl = 'https://api.github.com'; // URL de base de l'API GitHub

  // ========== FETCH USER REPOS ==========
  Future<List<GithubRepo>> fetchUserRepos(String username) async { // Récupère la liste des dépôts d'un utilisateur
    final url = Uri.parse('$baseUrl/users/$username/repos'); // Construit l'URL de l'endpoint des dépôts

    final response = await http.get( // Envoie une requête GET
      url, // Vers l'URL construite
      headers: { // Ajoute des en-têtes requis par l'API GitHub
        "Accept": "application/vnd.github+json", // Spécifie le format de réponse attendu
        "X-GitHub-Api-Version": "2022-11-28", // Version de l'API GitHub
      }, // Fin des en-têtes
    ); // Fin de la requête GET

    if (response.statusCode == 200) { // Vérifie le succès de la réponse
      final List data = jsonDecode(response.body); // Décode le corps JSON en liste dynamique
      return data.map((json) => GithubRepo.fromJson(json)).toList(); // Mappe chaque entrée JSON vers un modèle GithubRepo
    } else { // Si le code n'est pas 200
      throw Exception('Failed to load repos: ${response.statusCode}'); // Lève une exception avec le code HTTP
    } // Fin du if/else
  } // Fin de fetchUserRepos

  // ========== FETCH USERS LIST ==========
  Future<List<GithubUser>> fetchUsers() async { // Récupère une liste d'utilisateurs GitHub publics
    final url = Uri.parse('$baseUrl/users?per_page=30'); // Construit l'URL avec une pagination simple

    final response = await http.get( // Envoie une requête GET
      url, // Vers l'URL des utilisateurs
      headers: { // En-têtes HTTP
        "Accept": "application/vnd.github+json", // Demande le JSON GitHub
        "X-GitHub-Api-Version": "2022-11-28", // Indique la version de l'API
      }, // Fin des en-têtes
    ); // Fin de la requête GET

    if (response.statusCode == 200) { // Si la réponse est OK
      final List data = jsonDecode(response.body); // Parse le JSON en liste
      return data.map((json) => GithubUser.fromJson(json)).toList(); // Convertit en liste de GithubUser
    } else { // Sinon erreur
      throw Exception('Failed to load users: ${response.statusCode}'); // Lève une exception avec le statut
    } // Fin du if/else
  } // Fin de fetchUsers
} // Fin de la classe GithubService
