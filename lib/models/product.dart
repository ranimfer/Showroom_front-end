// lib/models/product.dart

class Product {
  final String id;
  final String name;
  final String description;
  final String image;
  final double price;
  final String? caracteristiques;
  final String? communication;
  final List<String>? categories; // liste de catégories secondaires

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    this.caracteristiques,
    this.communication,
    this.categories,
  });

  // Fabrique une liste de produits à partir des données constantes
  static List<Product> fromList(List<Map<String, dynamic>> data) {
    return data.map((item) {
      // On s'assure que chaque valeur est bien de type String
      return Product(
        id: item['id']?.toString() ?? '',  // Ajout de vérification pour id
        name: item['name']?.toString() ?? 'Produit inconnu',  // S'assurer que 'label' est une String
        description: item['description']?.toString() ?? 'description inconnue',  // S'assurer que 'category' est une String
        image: item['image']?.toString() ?? 'assets/logo.png',  // S'assurer que 'image' est une String
        //price: item['price']?.toDouble() ?? 'Prix inconnu',  // S'assurer que 'price' est une String
        price: double.tryParse(item['price'] ?? '') ?? 0.0,
        caracteristiques: item['caracteristiques']?.toString(),
        communication: item['communication']?.toString(),
        categories: (item['categories'] as List<dynamic>?)
            ?.map((e) => e.toString())
            .toList(),
      );
    }).toList();
  }
}
