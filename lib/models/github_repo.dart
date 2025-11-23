class GithubRepo {
  final String name;
  final String? description;
  final String htmlUrl;
  final String? language;

  GithubRepo({
    required this.name,
    required this.htmlUrl,
    this.description,
    this.language,
  });

  factory GithubRepo.fromJson(Map<String, dynamic> json) {
    return GithubRepo(
      name: json['name'] ?? '',
      description: json['description'],
      htmlUrl: json['html_url'] ?? '',
      language: json['language'],
    );
  }
}
