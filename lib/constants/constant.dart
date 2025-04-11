// lib/constants/constant.dart

class Constants {
  static const String appName = "My Showroom";

  // Données des catégories
  static const List<Map<String, dynamic>> categories = [
    {
      "label": "Smart Agriculture",
      "arrayMappedname": smartAgriculture,
    },
    {
      "label": "Smart Lighting",
      "arrayMappedname": smartLighting,
    },
    {
      "label": "Smart Water Management",
      "arrayMappedname": smartWaterManagement,
    },
    {
      "label": "Smart Housing",
      "arrayMappedname": smartHousing,
    },
    {
      "label": "Chaîne de froid",
      "arrayMappedname": coldChain,
    },
  ];

  // Liste globale des produits (fusion des catégories)
  static const List<Map<String, String>> productData = [
    ...smartAgriculture,
    ...smartLighting,
    ...smartWaterManagement,
    ...smartHousing,
    ...coldChain,
  ];

  // Données des catégories avec des produits
  static const List<Map<String, String>> smartAgriculture = [
    {
      "id": "1",  // Ajout de l'ID
      "category": "Smart Agriculture",
      "label": "Capteur d'humidité du sol",
      "price": "250.0",
      "image": "assets/logo.png",
    },
    {
      "id": "2",  // Ajout de l'ID
      "category": "Smart Agriculture",
      "label": "Station météo connectée",
      "price": "400.0",
      "image": "assets/logo.png",
    },
  ];

  static const List<Map<String, String>> smartLighting = [
    {
      "id": "3",  // Ajout de l'ID
      "category": "Smart Lighting",
      "label": "Lampe LED intelligente",
      "price": "180.0",
      "image": "assets/logo.png",
    },
    {
      "id": "4",  // Ajout de l'ID
      "category": "Smart Lighting",
      "label": "Système d’éclairage solaire connecté",
      "price": "320.0",
      "image": "assets/logo.png",
    },
  ];

  static const List<Map<String, String>> smartWaterManagement = [
    {
      "id": "5",  // Ajout de l'ID
      "category": "Smart Water Management",
      "label": "Débitmètre connecté",
      "price": "280.0",
      "image": "assets/logo.png",
    },
    {
      "id": "6",  // Ajout de l'ID
      "category": "Smart Water Management",
      "label": "Capteur de niveau d'eau",
      "price": "300.0",
      "image": "assets/logo.png",
    },
  ];

  static const List<Map<String, String>> smartHousing = [
    {
      "id": "7",  // Ajout de l'ID
      "category": "Smart Housing",
      "label": "Caméra de surveillance Wi-Fi",
      "price": "350.0",
      "image": "assets/logo.png",
    },
    {
      "id": "8",  // Ajout de l'ID
      "category": "Smart Housing",
      "label": "Serrure intelligente",
      "price": "450.0",
      "image": "assets/logo.png",
    },
  ];

  static const List<Map<String, String>> coldChain = [
    {
      "id": "9",  // Ajout de l'ID
      "category": "Chaîne de froid",
      "label": "Capteur de température IoT",
      "price": "220.0",
      "image": "assets/logo.png",
    },
    {
      "id": "10",  // Ajout de l'ID
      "category": "Chaîne de froid",
      "label": "Boîte isotherme connectée",
      "price": "500.0",
      "image": "assets/logo.png",
    },
  ];
}
