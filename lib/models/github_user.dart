class GithubUser {
  final String login;      // username
  final String avatarUrl;  // photo
  final String htmlUrl;    // lien profile

  GithubUser({
    required this.login,
    required this.avatarUrl,
    required this.htmlUrl,
  });

  factory GithubUser.fromJson(Map<String, dynamic> json) {
    return GithubUser(
      login: json['login'] ?? '',
      avatarUrl: json['avatar_url'] ?? '',
      htmlUrl: json['html_url'] ?? '',
    );
  }
}
