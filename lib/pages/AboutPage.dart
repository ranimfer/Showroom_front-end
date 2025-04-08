import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: const ValueKey("apropos"),
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'À propos de SOTUNEC ++',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image bien redimensionnée et centrée
              Expanded(
                flex: 1,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 300, // limite la taille de l’image
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/smart.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                flex: 2,
                child: const Text(
                  "La société SOTUNEC ++ créée en 2015, ayant obtenu la License IoT en 2018 et le label start up en 2019.\n\n"
                      "Pionnière du développement des solutions IOT (Internet Of Things) en Tunisie pour l’économie des ressources, comprenant :\n"
                      "– Des capteurs sans fils : pour la collecte des données et la commande à distance des objets connectés.\n"
                      "– Une offre de connectivité : l’installation et l’exploitation d’un réseau IoT (LoRa).\n"
                      "– Des applications “métier”: web et mobiles pour faire le suivi en temps réel et à distance des objets connectés.\n\n"
                      "SOTUNEC ++ met à votre disposition des solutions clé en main, intégrées et connectées pour l’économie des ressources dans différents domaines :\n"
                      "l’industrie, l’agriculture, l’énergie, le transport et les smart cities.",
                  style: TextStyle(fontSize: 16, height: 1.6),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          const Text(
            'Nos valeurs :',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          const BulletPoint(text: '💡 Innovation'),
          const BulletPoint(text: '🔗 Connectivité'),
          const BulletPoint(text: '⚙️ Intégration sur mesure'),
          const BulletPoint(text: '🌍 Durabilité & efficacité'),
        ],
      ),
    );
  }
}

class BulletPoint extends StatelessWidget {
  final String text;

  const BulletPoint({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 18)),
          Expanded(
            child: Text(text, style: const TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
