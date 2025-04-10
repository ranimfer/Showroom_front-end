import 'package:flutter/material.dart';

class SolutionSection extends StatefulWidget {
  const SolutionSection({super.key});

  @override
  State<SolutionSection> createState() => _SolutionSectionState();
}

class _SolutionSectionState extends State<SolutionSection> {
  int currentIndex = 0;

  final List<Map<String, String>> solutions = [
    {
      'title': 'Solution Smart City',
      'image': 'assets/solution1.png',
    },
    {
      'title': 'Solution Agricole',
      'image': 'assets/solution2.png',
    },
    {
      'title': 'Solution Énergie',
      'image': 'assets/solution3.png',
    },
    // Tu peux ajouter d’autres solutions ici
  ];

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
    final current = solutions[currentIndex];
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.grey.shade200, // 🔵 Couleur un peu plus foncée
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ⬅️ Partie gauche
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text(
                  current['title']!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    current['image']!,
                    fit: BoxFit.cover,
                    height: 200,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _previousSolution,
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                    const SizedBox(width: 12),
                    IconButton(
                      onPressed: _nextSolution,
                      icon: const Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 24),

          // ➡️ Partie droite
          Expanded(
            flex: 2,
            child: const Text(
              "Présentation des solutions\n\n"
                  "SOTUNEC ++ développe des solutions qui permettent un suivi en temps réel et à distance des objets connectés : frigos, machines, compteurs d’eau, véhicules, espaces verts et agricoles (poulaillers, serres, ruches, clapiers…), voire même une cité entière pour optimiser les ressources.\n\n"
                  "Les solutions sont :\n"
                  "- Non filaires\n"
                  "- Clé en main\n"
                  "- Connectées\n"
                  "- Évolutives et personnalisables\n"
                  "- Faciles à installer\n"
                  "- Surtout économiques.",
              style: TextStyle(fontSize: 16, height: 1.6),
            ),
          ),
        ],
      ),
    );
  }
}
