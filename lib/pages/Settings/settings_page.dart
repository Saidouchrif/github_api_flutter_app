import 'package:flutter/material.dart'; // Importe la bibliothèque Material de Flutter

class SettingsPage extends StatefulWidget { // Écran des paramètres avec état
  const SettingsPage({super.key}); // Constructeur const

  @override // Surcharge de méthode
  State<SettingsPage> createState() => _SettingsPageState(); // Crée l'état associé
}

class _SettingsPageState extends State<SettingsPage> { // État de SettingsPage
  bool isDarkMode = false; // Indicateur de thème sombre (UI uniquement)
  String selectedLanguage = "English"; // Langue sélectionnée (UI uniquement)

  @override // Surcharge de build
  Widget build(BuildContext context) { // Construit l'interface des paramètres
    return Scaffold( // Structure de page
      appBar: AppBar( // Barre supérieure
        title: const Text("Settings"), // Titre de la page
        centerTitle: true, // Centre le titre
      ), // Fin de AppBar

      body: ListView( // Liste défilante des options
        padding: const EdgeInsets.all(16.0), // Padding interne
        children: [ // Enfants de la liste

          // ----------- DARK MODE -----------
          SwitchListTile( // Ligne avec interrupteur pour le thème sombre
            title: const Text("Dark Mode"), // Titre de l'option
            subtitle: const Text("Enable or disable dark theme"), // Description
            value: isDarkMode, // Valeur actuelle de l'interrupteur
            onChanged: (value) { // Callback lors du changement
              setState(() { // Déclenche une reconstruction du widget
                isDarkMode = value; // Met à jour l'état local
              }); // Fin de setState
            }, // Fin de onChanged
          ), // Fin de SwitchListTile

          const Divider(), // Séparateur visuel

          // ----------- LANGUAGE -----------
          ListTile( // Ligne de sélection de la langue
            title: const Text("Language"), // Titre de l'option
            subtitle: Text(selectedLanguage), // Affiche la langue actuelle
            trailing: DropdownButton<String>( // Sélecteur déroulant
              value: selectedLanguage, // Valeur courante
              items: const [ // Éléments disponibles
                DropdownMenuItem(value: "English", child: Text("English")), // Option Anglais
                DropdownMenuItem(value: "French", child: Text("French")), // Option Français
                DropdownMenuItem(value: "Arabic", child: Text("Arabic")), // Option Arabe
              ], // Fin des items
              onChanged: (value) { // Callback au changement de valeur
                setState(() {   // Met à jour l'état
                  selectedLanguage = value!; // Assigne la nouvelle valeur (non nulle)
                }); // Fin de setState
              }, // Fin de onChanged
            ), // Fin de DropdownButton
          ), // Fin de ListTile (language)

          const Divider(), // Séparateur visuel

          // ----------- ABOUT APP -----------
          ListTile( // Ligne d'information "À propos"
            leading: const Icon(Icons.info_outline), // Icône d'information
            title: const Text("About App"), // Titre
            subtitle: const Text("Version 1.0.0 - Made by Ouchrif IT"), // Sous-titre
            onTap: () { // Action au clic
              showAboutDialog( // Ouvre une boîte de dialogue "À propos"
                context: context, // Contexte d'affichage
                applicationName: "GitHub Explorer", // Nom de l'application
                applicationVersion: "1.0.0", // Version
                applicationLegalese: "Developed by Said Ouchrif", // Mentions légales
              ); // Fin de showAboutDialog
            }, // Fin de onTap
          ), // Fin de ListTile (about)

          const Divider(), // Séparateur visuel

          // ----------- CLEAR CACHE (UI ONLY) -----------
          ListTile( // Ligne pour "vider le cache" (démonstration UI)
            leading: const Icon(Icons.cleaning_services), // Icône de nettoyage
            title: const Text("Clear Cache"), // Titre
            subtitle: const Text("Remove temporary app data"), // Description
            onTap: () { // Action au clic
              ScaffoldMessenger.of(context).showSnackBar( // Affiche une notification
                const SnackBar(content: Text("Cache cleared successfully")), // Message de confirmation
              ); // Fin de showSnackBar
            }, // Fin de onTap
          ), // Fin de ListTile (clear cache)
        ], // Fin des children
      ), // Fin de ListView
    ); // Fin de Scaffold
  } // Fin de build
} // Fin de la classe _SettingsPageState
