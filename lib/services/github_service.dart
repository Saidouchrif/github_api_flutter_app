import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:github_api_flutter_app/models/github_repo.dart';

class GithubService {
  static const String baseUrl = 'https://api.github.com';

  Future<List<GithubRepo>> fetchUserRepos(String username) async {
    final url = Uri.parse('$baseUrl/users/$username/repos');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((json) => GithubRepo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load repos: ${response.statusCode}');
    }
  }
}