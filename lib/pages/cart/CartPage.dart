import 'package:flutter/material.dart';
import '../../constants/cart_data.dart';
import '../../models/cart_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late List<CartItem> localCartItems;

  @override
  void initState() {
    super.initState();
    localCartItems = List.from(cartItems); // Copie locale modifiable
  }

  void _incrementQuantity(int index) {
    setState(() {
      localCartItems[index] =
          CartItem(product: localCartItems[index].product, quantity: localCartItems[index].quantity + 1);
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (localCartItems[index].quantity > 1) {
        localCartItems[index] =
            CartItem(product: localCartItems[index].product, quantity: localCartItems[index].quantity - 1);
      }
    });
  }

  double _calculateTotal() {
    return localCartItems.fold(0, (sum, item) => sum + item.totalPrice);
  }

  @override
  Widget build(BuildContext context) {
    double total = _calculateTotal();

    return SingleChildScrollView(
      key: const ValueKey("cart"),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '🛒 Votre Panier',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          ...localCartItems.asMap().entries.map((entry) {
            int index = entry.key;
            CartItem item = entry.value;

            return Card(
              elevation: 3,
              margin: const EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: Image.asset(
                  item.product.image,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(item.product.name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600)),
                subtitle: Row(
                  children: [
                    IconButton(
                      onPressed: () => _decrementQuantity(index),
                      icon: const Icon(Icons.remove_circle_outline),
                    ),
                    Text('${item.quantity}',
                        style: const TextStyle(fontSize: 16)),
                    IconButton(
                      onPressed: () => _incrementQuantity(index),
                      icon: const Icon(Icons.add_circle_outline),
                    ),
                  ],
                ),
                trailing: Text(
                  '${item.totalPrice.toStringAsFixed(2)} TND',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.teal),
                ),
              ),
            );
          }),

          const Divider(height: 40, thickness: 1),

          Text(
            'Total : ${total.toStringAsFixed(2)} TND',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text("✅ Commande passée avec succès !")),
                );
              },
              icon: const Icon(Icons.shopping_cart_checkout),
              label: const Text('Commander'),
              style: ElevatedButton.styleFrom(
                padding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
