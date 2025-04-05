// TODO Implement this library.import 'package:flutter/material.dart';
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
        children: const [
          Center(
            child: Image(
              image: AssetImage('../assets/logo.png'),
              height: 120,
            ),
          ),
          SizedBox(height: 24),
          Text(
            'À propos de MyShowroom',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            'MyShowroom est une plateforme innovante de présentation de produits technologiques.\n'
                'Elle permet aux entreprises de mettre en avant leurs articles à travers une interface interactive et moderne.\n\n'
                'Notre objectif est de rapprocher les fournisseurs de leurs clients grâce à des visualisations immersives, notamment des modèles 3D.',
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
          SizedBox(height: 24),
          Text(
            'Nos valeurs :',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          BulletPoint(text: '💡 Innovation'),
          BulletPoint(text: '🤝 Accessibilité'),
          BulletPoint(text: '📦 Simplicité'),
          BulletPoint(text: '📱 Expérience utilisateur'),
        ],
      ),
    );
  }
}

// Un petit widget pour les puces de texte
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
