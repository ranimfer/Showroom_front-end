// TODO Implement this library.import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Tu peux remplacer cette liste avec des données dynamiques plus tard
    final List<Map<String, dynamic>> cartItems = [
      {'name': 'Lampe LED', 'price': 29.99, 'quantity': 2},
      {'name': 'Carte Graphique', 'price': 399.99, 'quantity': 1},
    ];

    double total = 0;
    for (var item in cartItems) {
      total += item['price'] * item['quantity'];
    }

    return SingleChildScrollView(
      key: const ValueKey("cart"),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Votre Panier',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ...cartItems.map((item) => ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
            title: Text(item['name'], style: const TextStyle(fontSize: 18)),
            subtitle: Text('Quantité : ${item['quantity']}'),
            trailing: Text('${item['price'] * item['quantity']} TND'),
          )),
          const Divider(height: 40),
          Text('Total : ${total.toStringAsFixed(2)} TND',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Commande passée avec succès !")),
              );
            },
            icon: const Icon(Icons.shopping_cart_checkout),
            label: const Text('Commander'),
            style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16)),
          )
        ],
      ),
    );
  }
}
