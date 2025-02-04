// lib/screens/education_canine/training_tips_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

// Importation des pages dédiées
import 'training_tips/patience_coherent_screen.dart';
import 'training_tips/recompenses_motivation_screen.dart';
import 'training_tips/ton_voix_screen.dart';
import 'training_tips/punition_inutile_screen.dart';
import 'training_tips/seances_frequentes_screen.dart';
import 'training_tips/langage_canin_screen.dart';

class TrainingTipsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> trainingTips = [
    {
      "title": "Soyez patient et cohérent",
      "description": "La clé du succès est la répétition et la patience. Un chien apprend par la constance de son maître.",
      "image": "assets/images/education/patiente.png",
      "color": Colors.brown.shade300,
      "page": PatienceCoherentScreen(),
    },
    {
      "title": "Récompenses et motivation",
      "description": "Bien utiliser les friandises, caresses et encouragements renforce les bons comportements.",
      "image": "assets/images/education/recompense.png",
      "color": Colors.brown.shade300,
      "page": RecompensesMotivationScreen(),
    },
    {
      "title": "Utilisation du bon ton de voix",
      "description": "Un ton calme et ferme est plus efficace qu’une voix agressive ou criarde.",
      "image": "assets/images/education/ton.png",
      "color": Colors.brown.shade300,
      "page": TonVoixScreen(),
    },
    {
      "title": "Évitez les punitions inutiles",
      "description": "Punir un chien après-coup est inefficace. Mettez l'accent sur le renforcement positif.",
      "image": "assets/images/education/punirinutile.png",
      "color": Colors.brown.shade300,
      "page": PunitionInutileScreen(),
    },
    {
      "title": "Courtes séances mais fréquentes",
      "description": "Des sessions courtes plusieurs fois par jour sont plus efficaces que des entraînements longs.",
      "image": "assets/images/education/chrono.png",
      "color": Colors.brown.shade300,
      "page": SeancesFrequentesScreen(),
    },
    {
      "title": "Comprendre le langage canin",
      "description": "Apprenez à lire les signaux de stress, de joie ou d’inconfort pour mieux communiquer.",
      "image": "assets/images/education/dialogue.png",
      "color": Colors.brown.shade300,
      "page": LangageCaninScreen(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Conseils et Erreurs à Éviter")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: trainingTips.length,
          itemBuilder: (context, index) {
            final tip = trainingTips[index];
            return _buildTipCard(
              tip["title"],
              tip["description"],
              tip["image"],
              tip["color"],
              context,
              tip["page"],
            );
          },
        ),
      ),
    );
  }

  Widget _buildTipCard(
      String title, String description, String imagePath, Color bgColor, BuildContext context, Widget page) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      ),
      child: Card(
        elevation: 6,
        margin: EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: bgColor ?? Colors.grey,
          ),
          child: Row(
            children: [
              // Texte à gauche (70%)
              Expanded(
                flex: 7,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(height: 5),
                      Text(
                        description,
                        style: TextStyle(fontSize: 14, color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ),
              // Image à droite (30%)
              Expanded(
                flex: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    height: 150,
                  ),
                ),
              ),
            ],
          ),
        ),
      ).animate().fade(duration: 500.ms).slideX(begin: 0.1),
    );
  }
}