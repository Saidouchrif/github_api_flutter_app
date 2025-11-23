import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:github_api_flutter_app/models/post.dart';

class PostsService {
  static const String baseUrl = "https://jsonplaceholder.typicode.com";

  Future<List<Post>> fetchPosts() async {
    final url = Uri.parse("$baseUrl/posts");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load posts: ${response.statusCode}");
    }
  }
}
