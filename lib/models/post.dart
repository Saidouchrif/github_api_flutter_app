class Post { // Modèle représentant un article (post)
  final int id; // Identifiant unique du post
  final String title; // Titre du post
  final String body; // Contenu du post

  Post({ // Constructeur de la classe Post
    required this.id, // Paramètre requis : id
    required this.title, // Paramètre requis : title
    required this.body, // Paramètre requis : body
  }); // Fin du constructeur

  factory Post.fromJson(Map<String, dynamic> json) { // Crée un Post à partir d'un JSON
    return Post( // Retourne une instance de Post
      id: json['id'], // Lit l'identifiant depuis le JSON
      title: json['title'], // Lit le titre depuis le JSON
      body: json['body'], // Lit le contenu depuis le JSON
    ); // Fin de l'initialisation
  } // Fin de fromJson
} // Fin de la classe Post
