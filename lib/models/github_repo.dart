class GithubRepo { // Modèle représentant un dépôt GitHub
  final String name; // Nom du dépôt
  final String? description; // Description du dépôt (optionnelle)
  final String htmlUrl; // URL HTML du dépôt (page GitHub)
  final String? language; // Langage principal du dépôt (optionnel)

  GithubRepo({ // Constructeur du modèle GithubRepo
    required this.name, // Nom requis
    required this.htmlUrl, // URL requise
    this.description, // Description optionnelle
    this.language, // Langage optionnel
  }); // Fin du constructeur

  factory GithubRepo.fromJson(Map<String, dynamic> json) { // Fabrique un GithubRepo à partir d'un JSON
    return GithubRepo( // Retourne une instance peuplée
      name: json['name'] ?? '', // Récupère le nom, chaîne vide si null
      description: json['description'], // Récupère la description (peut être null)
      htmlUrl: json['html_url'] ?? '', // Récupère l'URL HTML, chaîne vide si null
      language: json['language'], // Récupère le langage (peut être null)
    ); // Fin du constructeur nommé
  } // Fin de fromJson
} // Fin de la classe GithubRepo
