import 'package:flutter/material.dart';
import 'ProductManagmentPage.dart';
import 'UserManagmentPage.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dashboard Admin",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueGrey[900] , 
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text("Menu Admin", style: TextStyle(color: Colors.white)),
              decoration: BoxDecoration(color: Colors.blueGrey),
            ),
            ListTile(
              title: const Text("Gestion Produits"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (_) => const ProductManagementPage(),
                ));
              },
            ),
            ListTile(
              title: const Text("Gestion Utilisateurs"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (_) => const UserManagementPage(),
                ));
              },
            ),
          ],
        ),
      ),
      body: const Center(child: Text("Bienvenue sur le dashboard admin")),
    );
  }
}
