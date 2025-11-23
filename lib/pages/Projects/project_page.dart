import 'package:flutter/material.dart';
import 'package:github_api_flutter_app/models/github_repo.dart';
import 'package:github_api_flutter_app/services/github_service.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  final GithubService _githubService = GithubService();
  late Future<List<GithubRepo>> _futureRepos;

  @override
  void initState() {
    super.initState();
    _futureRepos = _githubService.fetchUserRepos('saidouchrif');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My GitHub Projects')),
      body: FutureBuilder<List<GithubRepo>>(
        future: _futureRepos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          final repos = snapshot.data ?? [];

          if (repos.isEmpty) {
            return const Center(child: Text('No projects found.'));
          }

          return ListView.builder(
            itemCount: repos.length,
            itemBuilder: (context, index) {
              final repo = repos[index];
              return ListTile(
                leading: const Icon(Icons.folder),
                title: Text(repo.name),
                subtitle: Text(
                  (repo.description?.isNotEmpty ?? false)
                      ? repo.description!
                      : 'No description',
                ),
                trailing: Text(repo.language ?? ''),
                onTap: () {
                  // par ex: t9dar t7ell lien f browser b url_launcher
                  // wla taffichi details page
                },
              );
            },
          );
        },
      ),
    );
  }
}
