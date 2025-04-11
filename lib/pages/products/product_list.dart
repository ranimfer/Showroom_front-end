// lib/pages/product_list.dart
import 'package:flutter/material.dart';
import 'product_detail.dart';
import '../../constants/constant.dart';
import '../../models/product.dart';
import 'style.dart';
import 'config/size_config.dart';
import 'colors.dart';

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<Product> products = Product.fromList(Constants.productData);
  List<Product> displayedProducts = [];
  int selectedCategoryIndex = 0;

  @override
  void initState() {
    super.initState();
    displayedProducts = products;
  }

  void searchProducts(String query) {
    final results = products.where((p) =>
    p.name.toLowerCase().contains(query.toLowerCase()) ||
        p.description.toLowerCase().contains(query.toLowerCase()));
    setState(() {
      displayedProducts = results.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double screenWidth = SizeConfig.getScreenWidth();

    // Ajuster dynamiquement le nombre de colonnes pour écran large
    int crossAxisCount;
    if (screenWidth >= 1200) {
      crossAxisCount = 4;
    } else if (screenWidth >= 900) {
      crossAxisCount = 3;
    } else {
      crossAxisCount = 2;
    }

    return Scaffold(
      backgroundColor: AppColors.purple2,
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: standardPaddingX,
              child: TextField(
                onChanged: searchProducts,
                decoration: InputDecoration(
                  hintText: 'Rechercher un produit...',
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.all(12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: standardPaddingX,
              child: PrimaryText(
                text: 'Nos Produits',
                size: 28,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: standardPaddingX,
              child: Wrap(
                spacing: 10,
                children: List.generate(
                  Constants.categories.length,
                      (index) {
                    String categoryLabel = Constants.categories[index]['label'] as String;
                    return ChoiceChip(
                      label: Text(categoryLabel),
                      selected: selectedCategoryIndex == index,
                      onSelected: (bool selected) {
                        setState(() {
                          selectedCategoryIndex = index;
                          displayedProducts = products
                              .where((product) =>
                          product.categories != null &&
                              product.categories!.contains(categoryLabel))
                              .toList();
                        });
                      },
                      selectedColor: AppColors.primary,
                      backgroundColor: Colors.white,
                      labelStyle: TextStyle(
                        color: selectedCategoryIndex == index
                            ? Colors.white
                            : Colors.black,
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: standardPaddingX,
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: displayedProducts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: 3 / 4,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final product = displayedProducts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductDetailPage(product: product),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5,
                              )
                            ],
                          ),
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    product.image,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                product.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "${product.price.toStringAsFixed(2)} TND",
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 25), // espace pour le bouton
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: InkWell(
                            onTap: () {
                              // 👉 Logique à définir plus tard : ajout au panier
                              print("Produit ajouté au panier : ${product.name}");
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              padding: EdgeInsets.all(8),
                              child: Icon(
                                Icons.add_shopping_cart,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },

              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
