import 'package:flutter/material.dart';
//import 'AboutPage.dart';
import 'AboutPage.dart';
import 'CartPage.dart';
import 'ContactPage.dart';
import 'LoginPage.dart';
import '../widgets/footer.dart';
import '../widgets/category_avatar.dart';
import '../widgets/product_card.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<String> _pageTitles = ['Accueil', 'Panier', 'À propos', 'Contact', 'Connectez-vous'];

  final List<Widget> _pages = [
    const AccueilContent(),
    const CartPage(),
    const AboutPage(),
    const ContactPage(),
    const LoginPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildNavbar() {
    return Container(
      color: Colors.blueGrey[900],
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          const Text(
            '🛍️ MyShowroom',
            style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          for (int i = 0; i < _pageTitles.length; i++)
            TextButton(
              onPressed: () => _onItemTapped(i),
              child: Text(
                _pageTitles[i],
                style: TextStyle(
                  color: _selectedIndex == i ? Colors.amber : Colors.white,
                  fontSize: 16,
                  fontWeight: _selectedIndex == i ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildNavbar(),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _pages[_selectedIndex],
            ),
          ),
          Footer(onPageSelected: _onItemTapped),
        ],
      ),
    );
  }
}

class AccueilContent extends StatefulWidget {
  const AccueilContent({super.key});

  @override
  State<AccueilContent> createState() => _AccueilContentState();
}

class _AccueilContentState extends State<AccueilContent> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> _allProducts = [
    {'icon': Icons.lightbulb, 'name': 'Lampe LED', 'price': '39 DT'},
    {'icon': Icons.memory, 'name': 'GPU RTX 3060', 'price': '1900 DT'},
    {'icon': Icons.monitor, 'name': 'Écran 27"', 'price': '700 DT'},
    {'icon': Icons.mouse, 'name': 'Souris Gamer', 'price': '120 DT'},
  ];

  String _searchText = '';

  List<Map<String, dynamic>> get _filteredProducts {
    if (_searchText.isEmpty) return _allProducts;
    return _allProducts
        .where((product) =>
        product['name'].toLowerCase().contains(_searchText.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Sidebar Catégories
      // Nouvelle Sidebar avec logo et description
      Container(
      width: 200,
      color: Colors.grey[200],
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Logo circulaire
          CircleAvatar(
            radius: 45,
            backgroundImage: const AssetImage('assets/logoo.png'),
            backgroundColor: Colors.grey[200],
          ),
          const SizedBox(height: 20),

          // Nom de la société
          const Text(
            'MyShowroom',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),

          // Boîte avec description
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Text(
              'Solutions IoT innovantes pour les entreprises modernes.',
              style: TextStyle(fontSize: 13, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),


        // Zone principale
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Accueil',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),

                // Zone de recherche
                TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {
                      _searchText = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Rechercher un produit...",
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),

                const SizedBox(height: 32),

                const Text(
                  'Produits',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),

                _filteredProducts.isEmpty
                    ? const Text('Aucun produit trouvé.')
                    : Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: _filteredProducts
                      .map((product) => ProductCard(
                    icon: product['icon'],
                    name: product['name'],
                    price: product['price'],
                  ))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
