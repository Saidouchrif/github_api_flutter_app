import 'package:flutter/material.dart';
import 'package:github_api_flutter_app/models/github_user.dart';
import 'package:github_api_flutter_app/services/github_service.dart';
import 'package:url_launcher/url_launcher.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final GithubService _githubService = GithubService();
  late Future<List<GithubUser>> _futureUsers;

  @override
  void initState() {
    super.initState();
    _futureUsers = _githubService.fetchUsers();
  }

  void openUserProfile(String url) async {
    if (url.isEmpty) return;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Could not open profile")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GitHub Users")),
      body: FutureBuilder<List<GithubUser>>(
        future: _futureUsers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final users = snapshot.data ?? [];

          if (users.isEmpty) {
            return const Center(child: Text("No users found."));
          }

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];

              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.avatarUrl),
                ),
                title: Text(
                  user.login,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                subtitle: Text(user.htmlUrl),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  openUserProfile(user.htmlUrl);
                },
              );
            },
          );
        },
      ),
    );
  }
}
