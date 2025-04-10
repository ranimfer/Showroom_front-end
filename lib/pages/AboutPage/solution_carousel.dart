import 'package:flutter/material.dart';

class SolutionCarousel extends StatefulWidget {
  const SolutionCarousel({super.key});

  @override
  State<SolutionCarousel> createState() => _SolutionCarouselState();
}

class _SolutionCarouselState extends State<SolutionCarousel> {
  final List<Map<String, String>> solutions = [
    {'title': 'SMART CITIES', 'image': 'assets/solutions/smartcity.png'},
    {'title': 'SMART AGRICULTURE', 'image': 'assets/solutions/smartagriculture.png'},
    {'title': 'SUIVI DE LA CHAINE DE FROID', 'image': 'assets/solutions/frozenstatus.png'},
    {'title': 'SMART ENERGY MANAGEMENT', 'image': 'assets/solutions/smartenergy.png'},
    {'title': 'SMART WATER', 'image': 'assets/solutions/smartwater.png'},
    {'title': 'SMART HOME', 'image': 'assets/solutions/smarthome.png'},
    {'title': 'SMART GARDEN', 'image': 'assets/solutions/smartgarden.png'},
  ];

  int currentIndex = 0;

  void _nextSolution() {
    setState(() {
      currentIndex = (currentIndex + 1) % solutions.length;
    });
  }

  void _previousSolution() {
    setState(() {
      currentIndex = (currentIndex - 1 + solutions.length) % solutions.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final solution = solutions[currentIndex];

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 32),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          // Partie gauche : image + titre + boutons
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  solution['title']!,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                Image.asset(
                  solution['image']!,
                  height: 200,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _previousSolution,
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                    IconButton(
                      onPressed: _nextSolution,
                      icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(width: 24),
          // Partie droite : description
          Expanded(
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Présentation des solutions\n\n"
                    "BWS développe des solutions qui permettent un suivi en temps réel et à distance des objets connectés : frigos, machine, compteur d’eau, véhicule, espace vert et agricole (poulailler, serre, ruche et clapier,…) voire même une cité pour l’économie des ressources.\n\n"
                    "Les solutions BWS sont non filaires, clé en main, connectées, évolutives, personnalisables, faciles à installer et surtout économiques.",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
