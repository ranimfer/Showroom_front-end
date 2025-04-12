import 'package:flutter/material.dart';

class UserManagementPage extends StatelessWidget {
  const UserManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Utilisateurs")),
      body: ListView.builder(
        itemCount: 5, // remplacer par une vraie liste
        itemBuilder: (context, index) => Card(
          child: ListTile(
            leading: const Icon(Icons.person),
            title: Text("Utilisateur $index"),
            subtitle: const Text("email@example.com"),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                // supprimer utilisateur
              },
            ),
          ),
        ),
      ),
    );
  }
}
