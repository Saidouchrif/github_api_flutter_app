class GithubUser { // Modèle représentant un utilisateur GitHub
  final String login;      // Nom d'utilisateur (login)
  final String avatarUrl;  // URL de l'avatar (photo de profil)
  final String htmlUrl;    // URL de la page de profil GitHub

  GithubUser({ // Constructeur du modèle GithubUser
    required this.login, // Paramètre requis: login
    required this.avatarUrl, // Paramètre requis: avatarUrl
    required this.htmlUrl, // Paramètre requis: htmlUrl
  }); // Fin du constructeur

  factory GithubUser.fromJson(Map<String, dynamic> json) { // Crée un utilisateur à partir d'une map JSON
    return GithubUser( // Retourne une instance initialisée
      login: json['login'] ?? '', // Récupère le login, valeur par défaut vide
      avatarUrl: json['avatar_url'] ?? '', // Récupère l'URL de l'avatar
      htmlUrl: json['html_url'] ?? '', // Récupère l'URL du profil
    ); // Fin de l'initialisation
  } // Fin de fromJson
} // Fin de la classe GithubUser
