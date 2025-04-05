import 'package:flutter/material.dart';




class AccueilPage extends StatelessWidget {
  const AccueilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // --- Section: Catégorie
              const Text(
                'Catégories',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              // --- Section: Avatars
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  CategoryAvatar(label: "Lampe", icon: Icons.lightbulb_outline),
                  CategoryAvatar(label: "Carte Graphique", icon: Icons.memory),
                  CategoryAvatar(label: "Écran", icon: Icons.monitor),
                  CategoryAvatar(label: "Souris", icon: Icons.mouse),
                ],
              ),

              const SizedBox(height: 32),

              // --- Section: Produits
              const Text(
                'Produits populaires',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  ProductCard(
                    imageUrl: 'https://via.placeholder.com/100',
                    name: 'Lampe LED',
                    price: '39 DT',
                  ),
                  ProductCard(
                    imageUrl: 'https://via.placeholder.com/100',
                    name: 'GPU RTX 3060',
                    price: '1900 DT',
                  ),
                  ProductCard(
                    imageUrl: 'https://via.placeholder.com/100',
                    name: 'Écran 27"',
                    price: '700 DT',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryAvatar extends StatelessWidget {
  final String label;
  final IconData icon;

  const CategoryAvatar({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.blueGrey,
          radius: 30,
          child: Icon(icon, color: Colors.white, size: 30),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Column(
        children: [
          Image.network(imageUrl, height: 100),
          const SizedBox(height: 12),
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(price, style: const TextStyle(color: Colors.green)),
        ],
      ),
    );
  }
}
