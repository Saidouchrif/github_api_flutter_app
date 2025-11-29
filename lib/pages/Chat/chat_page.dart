import 'package:flutter/material.dart';
import 'package:github_api_flutter_app/services/openai_service.dart';

/// Page permettant à l’utilisateur de discuter avec l’IA (ChatGPT)
class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final OpenAIService _openAIService = OpenAIService();      // Service OpenAI
  final TextEditingController _controller = TextEditingController(); // Champ texte

  // Liste des messages échangés
  List<Map<String, String>> _messages = [];

  bool _isLoading = false; // Indique si l’IA est en train d’écrire

  /// Fonction déclenchée lorsqu’on appuie sur "Envoyer"
  Future<void> _sendMessage() async {
    final text = _controller.text.trim();

    if (text.isEmpty) return;

    // Ajout du message de l’utilisateur à l'écran
    setState(() {
      _messages.add({"role": "user", "text": text});
      _controller.clear();
      _isLoading = true;
    });

    try {
      // Appel de l'API OpenAI
      final reply = await _openAIService.sendMessage(text);

      // Ajout de la réponse de l’IA
      setState(() {
        _messages.add({"role": "ai", "text": reply});
      });

    } catch (e) {
      // En cas d’erreur
      setState(() {
        _messages.add({"role": "ai", "text": "❌ Erreur: $e"});
      });
    }

    // Fin du chargement
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat IA (OpenAI)"),
        centerTitle: true,
      ),

      // Structure principale
      body: Column(
        children: [
          // ----------- LISTE DES MESSAGES -----------
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                final isUser = msg["role"] == "user";

                return Align(
                  alignment: isUser
                      ? Alignment.centerRight
                      : Alignment.centerLeft,

                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.all(10),

                    // Style du bubble message
                    decoration: BoxDecoration(
                      color: isUser
                          ? Colors.blueAccent
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(12),
                    ),

                    child: Text(
                      msg["text"] ?? "",
                      style: TextStyle(
                        color: isUser ? Colors.white : Colors.black87,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // ----------- INDICATEUR DE CHARGEMENT -----------
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),

          // ----------- ZONE D'ÉCRITURE -----------
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // Champ texte
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "Écrivez votre message...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                const SizedBox(width: 8),

                // Bouton envoyer
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _isLoading ? null : _sendMessage,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
