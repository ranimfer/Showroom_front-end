import '../models/cart_item.dart';
import '../models/product.dart';

final List<CartItem> cartItems  = [
  CartItem(
    product: Product(
      id: '1',
      name: 'Lampe LED',
      description: 'Éclairez votre maison avec style.',
      price: 29.99,
      image: 'assets/logo.png',
      category: 'Éclairage',
    ),
    quantity: 2,
  ),
  CartItem(
    product: Product(
      id: '2',
      name: 'Carte Graphique',
      description: 'Haute performance pour gamers.',
      price: 399.99,
      image: 'assets/logo.png',
      category: 'Composants',
    ),
    quantity: 1,
  ),
];
