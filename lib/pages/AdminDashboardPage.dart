import 'package:flutter/material.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tableau de bord Admin'),
      ),
      body: const Center(
        child: Text(
          'Bienvenue sur le dashboard admin 👑',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

