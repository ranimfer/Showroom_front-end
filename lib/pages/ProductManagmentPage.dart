import 'package:flutter/material.dart';

class ProductManagementPage extends StatelessWidget {
  const ProductManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Produits")),
      body: ListView.builder(
        itemCount: 5, // à remplacer par une vraie liste
        itemBuilder: (context, index) => Card(
          child: ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: Text("Produit $index"),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                // supprimer produit
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ajouter produit
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
