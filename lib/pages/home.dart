import 'package:flutter/material.dart';
import 'package:showroomofficiel/pages/products/product_list.dart';
import 'AboutPage/AboutPage.dart';
import 'cart/CartPage.dart';
import 'ContactPage.dart';
import 'LoginPage.dart';
import '../widgets/footer.dart';
import '../widgets/category_avatar.dart';
import '../widgets/product_card.dart';
import '../widgets/custom_navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }




  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      AccueilContent(
        searchText: _searchText,
        onPageSelected: _onItemTapped,
      ),
      const CartPage(),
      const AboutPage(),
      const ContactPage(),
      const LoginPage(),
      Center(child: ProductListPage()),
    ];

    return Scaffold(
      body: Column(
        children: [
          //_buildNavbar(),
          CustomNavbar(
            selectedIndex: _selectedIndex,
            onItemTapped: _onItemTapped,
          ),

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

class AccueilContent extends StatelessWidget {
  final String searchText;
  final Function(int) onPageSelected;

  const AccueilContent({
    super.key,
    required this.searchText,
    required this.onPageSelected,
  });

  List<Map<String, dynamic>> get _allProducts => [
    {'icon': Icons.lightbulb, 'name': 'Lampe LED', 'price': '39 DT'},
    {'icon': Icons.memory, 'name': 'GPU RTX 3060', 'price': '1900 DT'},
    {'icon': Icons.monitor, 'name': 'Écran 27"', 'price': '700 DT'},
    {'icon': Icons.mouse, 'name': 'Souris Gamer', 'price': '120 DT'},
  ];

  List<Map<String, dynamic>> get _filteredProducts {
    if (searchText.isEmpty) return _allProducts;
    return _allProducts
        .where((product) => product['name']
        .toLowerCase()
        .contains(searchText.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 200,
          color: Colors.grey[200],
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 45,
                backgroundImage: const AssetImage('assets/logoo.png'),
                backgroundColor: Colors.grey[200],
              ),
              const SizedBox(height: 20),
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
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => onPageSelected(2), // ✅ AboutPage
                child: const Text("À propos"),
              ),

              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => onPageSelected(3), // ✅ ContactPage
                child: const Text("Contact"),
              ),
            ],
          ),
        ),
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
                const SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [
                      CategoryAvatar(label: "Lampe", icon: Icons.lightbulb_outline),
                      SizedBox(width: 20),
                      CategoryAvatar(label: "Carte Graphique", icon: Icons.memory),
                      SizedBox(width: 20),
                      CategoryAvatar(label: "Écran", icon: Icons.monitor),
                      SizedBox(width: 20),
                      CategoryAvatar(label: "Souris", icon: Icons.mouse),
                    ],
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
