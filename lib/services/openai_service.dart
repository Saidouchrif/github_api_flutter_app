import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Service responsable d’envoyer des requêtes à l’API OpenAI
/// pour générer des réponses au chat.
class OpenAIService {
  // ⚠️ La clé API est récupérée depuis l’environnement (secure)
  final String openAiApiKey = dotenv.env['OPENAI_API_KEY'] ?? "";
 
  // Endpoint officiel d’OpenAI Chat Completions
  static const String _baseUrl = "https://api.openai.com/v1/chat/completions";

  /// Envoie un message de l'utilisateur à OpenAI
  /// et retourne la réponse générée par l'IA.
  Future<String> sendMessage(String userMessage) async {
    final url = Uri.parse(_baseUrl);

    // Vérification si la clé API existe
    if (openAiApiKey.isEmpty) {
      throw Exception("❌ OPENAI_API_KEY non définie. Ajoute-la dans l'environnement.");
    }

    // Headers requis pour OpenAI
    final headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $openAiApiKey",
    };

    // Corps de la requête
    final body = jsonEncode({
      "model": "gpt-4.1-mini", // Modèle ChatGPT utilisé
      "messages": [
        {
          "role": "system",
          "content": "Tu es un assistant IA utile et professionnel."
        },
        {
          "role": "user",
          "content": userMessage
        }
      ]
    });

    // Envoi de la requête POST
    final response = await http.post(url, headers: headers, body: body);

    // Si la requête est réussie (200)
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // Extraction du texte de la réponse
      final String reply =
          data["choices"][0]["message"]["content"] ?? "Pas de réponse.";
      return reply;

    } else {
      // En cas d’erreur → on affiche le code
      print("Erreur API: ${response.statusCode} - ${response.body}");
      throw Exception("Impossible d'obtenir une réponse de OpenAI.");
    }
  }
  
}
