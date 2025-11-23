import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;
  String selectedLanguage = "English";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [

          // ----------- DARK MODE -----------
          SwitchListTile(
            title: const Text("Dark Mode"),
            subtitle: const Text("Enable or disable dark theme"),
            value: isDarkMode,
            onChanged: (value) {
              setState(() {
                isDarkMode = value;
              });
            },
          ),

          const Divider(),

          // ----------- LANGUAGE -----------
          ListTile(
            title: const Text("Language"),
            subtitle: Text(selectedLanguage),
            trailing: DropdownButton<String>(
              value: selectedLanguage,
              items: const [
                DropdownMenuItem(value: "English", child: Text("English")),
                DropdownMenuItem(value: "French", child: Text("French")),
                DropdownMenuItem(value: "Arabic", child: Text("Arabic")),
              ],
              onChanged: (value) {
                setState(() {  
                  selectedLanguage = value!;
                });
              },
            ),
          ),

          const Divider(),

          // ----------- ABOUT APP -----------
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text("About App"),
            subtitle: const Text("Version 1.0.0 - Made by Ouchrif IT"),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: "GitHub Explorer",
                applicationVersion: "1.0.0",
                applicationLegalese: "Developed by Said Ouchrif",
              );
            },
          ),

          const Divider(),

          // ----------- CLEAR CACHE (UI ONLY) -----------
          ListTile(
            leading: const Icon(Icons.cleaning_services),
            title: const Text("Clear Cache"),
            subtitle: const Text("Remove temporary app data"),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Cache cleared successfully")),
              );
            },
          ),
        ],
      ),
    );
  }
}
