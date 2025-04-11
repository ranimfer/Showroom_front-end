import 'package:flutter/material.dart';

class CustomNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomNavbar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      height: 72,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: Row(
        children: [
          // Logo
          GestureDetector(
            onTap: () => onItemTapped(0),
            child: Row(
              children: [
                Image.asset(
                  'assets/logoo.png',
                  height: 60,
                ),
                const SizedBox(width: 12),

              ],
            ),
          ),

          const Spacer(),

          // Navigation items
          _navItem("Accueil", 0, selectedIndex, onItemTapped),
          _navItem("SOTUNEC ++", 2, selectedIndex, onItemTapped),
          _navItem("Produits", 5, selectedIndex, onItemTapped),

          const Spacer(),

          // Icons à droite
          IconButton(
            onPressed: () => onItemTapped(1),
            icon: Icon(Icons.shopping_cart_outlined),
            color: selectedIndex == 1 ? Colors.blue : Colors.black87,
            tooltip: "Panier",
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () => onItemTapped(4),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[700],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: const Text("Connexion"),
          )
        ],
      ),
    );
  }

  Widget _navItem(String title, int index, int selectedIndex, Function(int) onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: GestureDetector(
        onTap: () => onTap(index),
        child: Text(
          title,
          style: TextStyle(
            color: selectedIndex == index ? Colors.blue : Colors.black87,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
