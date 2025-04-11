// lib/constants/constant.dart

class Constants {
  static const String appName = "My Showroom";

  // Données des catégories avec mappage
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

  // Fusion globale des produits
  static const List<Map<String, dynamic>> productData = [
    ...smartAgriculture,
    ...smartLighting,
    ...smartWaterManagement,
    ...smartHousing,
    ...coldChain,
  ];

  // Produits - Smart Agriculture
  static const List<Map<String, dynamic>> smartAgriculture = [
    {
      "id": "1",
      "name": "Capteur d'humidité du sol",
      "description": "Permet de mesurer l’humidité du sol en temps réel.",
      "price": "250.0",
      "image": "assets/logo.png",
      "caracteristiques": "Précision élevée, longue durée de vie.",
      "communication": "LoRaWAN",
      "categories": ["Smart Agriculture", "IoT", "Capteur"],
    },
    {
      "id": "2",
      "name": "Station météo connectée",
      "description": "Mesure température, humidité, pression, etc.",
      "price": "400.0",
      "image": "assets/logo.png",
      "caracteristiques": "Multi-capteurs, connectivité sans fil.",
      "communication": "Wi-Fi",
      "categories": ["Smart Agriculture", "Météo", "Connecté"],
    },
  ];

  // Produits - Smart Lighting
  static const List<Map<String, dynamic>> smartLighting = [
    {
      "id": "3",
      "name": "Lampe LED intelligente",
      "description": "Éclairage automatisé avec détection de mouvement.",
      "price": "180.0",
      "image": "assets/logo.png",
      "caracteristiques": "Économie d'énergie, longue durée.",
      "communication": "Zigbee",
      "categories": ["Smart Lighting", "Économie d’énergie"],
    },
    {
      "id": "4",
      "name": "Système d’éclairage solaire connecté",
      "description": "Éclairage autonome et durable.",
      "price": "320.0",
      "image": "assets/logo.png",
      "caracteristiques": "Panneaux solaires, batterie intégrée.",
      "communication": "GSM",
      "categories": ["Smart Lighting", "Écologique"],
    },
  ];

  // Produits - Smart Water Management
  static const List<Map<String, dynamic>> smartWaterManagement = [
    {
      "id": "5",
      "name": "Débitmètre connecté",
      "description": "Suivi en temps réel de la consommation d’eau.",
      "price": "280.0",
      "image": "assets/logo.png",
      "caracteristiques": "Mesure précise, alerte de fuite.",
      "communication": "NB-IoT",
      "categories": ["Smart Water Management", "Suivi"],
    },
    {
      "id": "6",
      "name": "Capteur de niveau d'eau",
      "description": "Surveillance des niveaux d’eau dans les réservoirs.",
      "price": "300.0",
      "image": "assets/logo.png",
      "caracteristiques": "Détection de seuil, robuste.",
      "communication": "LoRa",
      "categories": ["Smart Water Management", "Surveillance"],
    },
  ];

  // Produits - Smart Housing
  static const List<Map<String, dynamic>> smartHousing = [
    {
      "id": "7",
      "name": "Caméra de surveillance Wi-Fi",
      "description": "Caméra HD avec vision nocturne.",
      "price": "350.0",
      "image": "assets/logo.png",
      "caracteristiques": "Vision nocturne, détection de mouvement.",
      "communication": "Wi-Fi",
      "categories": ["Smart Housing", "Sécurité"],
    },
    {
      "id": "8",
      "name": "Serrure intelligente",
      "description": "Accès sans clé via smartphone.",
      "price": "450.0",
      "image": "assets/logo.png",
      "caracteristiques": "Accès à distance, journal d’accès.",
      "communication": "Bluetooth",
      "categories": ["Smart Housing", "Sécurité", "Accès"],
    },
  ];

  // Produits - Chaîne de froid
  static const List<Map<String, dynamic>> coldChain = [
    {
      "id": "9",
      "name": "Capteur de température IoT",
      "description": "Surveillance continue de la température.",
      "price": "220.0",
      "image": "assets/logo.png",
      "caracteristiques": "Précision, alerte en temps réel.",
      "communication": "Sigfox",
      "categories": ["Chaîne de froid", "Température"],
    },
    {
      "id": "10",
      "name": "Boîte isotherme connectée",
      "description": "Transport sécurisé de produits sensibles.",
      "price": "500.0",
      "image": "assets/logo.png",
      "caracteristiques": "Isolation renforcée, suivi GPS.",
      "communication": "LTE",
      "categories": ["Chaîne de froid", "Transport", "Santé"],
    },
  ];
}
