import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:github_api_flutter_app/models/github_repo.dart';
import 'package:github_api_flutter_app/models/github_user.dart'; // 👈 مهم

class GithubService {
  static const String baseUrl = 'https://api.github.com';

  // ========== FETCH USER REPOS ==========
  Future<List<GithubRepo>> fetchUserRepos(String username) async {
    final url = Uri.parse('$baseUrl/users/$username/repos');

    final response = await http.get(
      url,
      headers: {
        "Accept": "application/vnd.github+json",
        "X-GitHub-Api-Version": "2022-11-28",
      },
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((json) => GithubRepo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load repos: ${response.statusCode}');
    }
  }

  // ========== FETCH USERS LIST ==========
  Future<List<GithubUser>> fetchUsers() async {
    final url = Uri.parse('$baseUrl/users?per_page=30');

    final response = await http.get(
      url,
      headers: {
        "Accept": "application/vnd.github+json",
        "X-GitHub-Api-Version": "2022-11-28",
      },
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((json) => GithubUser.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users: ${response.statusCode}');
    }
  }
}
