import 'dart:convert';
import 'package:http/http.dart' as http;

/// Service responsable d’envoyer des requêtes à l’API OpenAI
/// pour générer des réponses au chat.
class OpenAIService {
  // ⚠️ Remplace par ta clé API (à utiliser en local uniquement)
  static const String _apiKey = "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";

  // Endpoint officiel d’OpenAI Chat Completions
  static const String _baseUrl = "https://api.openai.com/v1/chat/completions";

  /// Envoie un message de l'utilisateur à OpenAI
  /// et retourne la réponse générée par l'IA.
  Future<String> sendMessage(String userMessage) async {
    final url = Uri.parse(_baseUrl);

    // Headers requis pour OpenAI
    final headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $_apiKey",
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
