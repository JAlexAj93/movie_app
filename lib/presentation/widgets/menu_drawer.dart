import 'package:flutter/material.dart';
import 'package:movie_app/presentation/cubit/language_cubit.dart';

class MenuDrawer extends StatelessWidget {
  final Function(Language) onLanguageChange;
  final bool isDarkMode; // Recibe el estado del modo oscuro
  final Function(bool) onToggleDarkMode; // Recibe el cambio del Switch

  const MenuDrawer({
    super.key,
    required this.onLanguageChange,
    required this.isDarkMode,
    required this.onToggleDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.only(top: 50),
        children: [
          ListTile(
            title: const Text('Change Language'),
            onTap: () {
              _showLanguageDialog(context);
            },
          ),
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: isDarkMode,
            onChanged: (bool value) {
              onToggleDarkMode(
                  value); // Llama al callback cuando el Switch cambia
            },
          ),
        ],
      ),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select Language"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text("English"),
                onTap: () {
                  onLanguageChange(Language.enUS);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Spanish"),
                onTap: () {
                  onLanguageChange(Language.esMX);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
