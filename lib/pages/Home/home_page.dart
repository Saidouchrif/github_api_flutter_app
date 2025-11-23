import 'package:flutter/material.dart';
import 'package:github_api_flutter_app/pages/Contact/contact_page.dart';
import 'package:github_api_flutter_app/pages/Posts/posts_page.dart';
import 'package:github_api_flutter_app/pages/Projects/project_page.dart';
import 'package:github_api_flutter_app/pages/Settings/settings_page.dart';
import 'package:github_api_flutter_app/pages/Users/users_page.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: Colors.blue),
                accountName: const Text("Said Ouchrif"),
                accountEmail: const Text("saidouchrif16@gmail.com"),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: AssetImage("images/profile.png"),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                  MaterialPageRoute(builder: (_)=> const HomePage())
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.people),
                title: const Text('Users'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                  MaterialPageRoute(builder: (_)=> const UsersPage())
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.business),
                title: const Text('Projects'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                  MaterialPageRoute(builder: (_)=> const ProjectsPage())
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.article),
                title: const Text('Posts'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                  MaterialPageRoute(builder: (_)=> const PostsPage())
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.contact_mail),
                title: const Text('Contact Us'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ContactPages()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SettingsPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),

      body: const MyBody(),
    );
  }
}
class MyBody extends StatelessWidget {
  const MyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 40), 

      child: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blueAccent,
                Colors.lightBlue,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.white.withOpacity(0.8),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 10,
                offset: const Offset(0, 4),
              )
            ],
          ),

          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,

            children: [
              Text(
                "👋 Welcome!",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 10),

              Text(
                "Welcome to My First Flutter App!",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}