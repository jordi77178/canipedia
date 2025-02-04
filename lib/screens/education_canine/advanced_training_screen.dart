// lib/screens/education_canine/advanced_training_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

// Import des pages créées dans le dossier advanced_training
import 'advanced_training/obedience_distance_screen.dart';
import 'advanced_training/agility_screen.dart';
import 'advanced_training/rapport_objets_screen.dart';
import 'advanced_training/detection_odeurs_screen.dart';
import 'advanced_training/signaux_silencieux_screen.dart';
import 'advanced_training/suivi_hors_laisse_screen.dart';

class AdvancedTrainingScreen extends StatelessWidget {
  final List<Map<String, dynamic>> advancedTrainingSteps = [
    {
      "title": "Obéissance à distance",
      "description": "Apprenez à donner des ordres clairs à distance pour un contrôle total.",
      "image": "assets/images/education/loin.png",
      "color": Colors.brown.shade300,
      "page": ObedienceDistanceScreen(),
    },
    {
      "title": "Agility, parcours sportifs",
      "description": "Développez les capacités physiques et mentales de votre chien avec des parcours agiles.",
      "image": "assets/images/education/agility.png",
      "color": Colors.brown.shade300,
      "page": AgilityScreen(),
    },
    {
      "title": "Rapport d'objets",
      "description": "Perfectionnez le retour d'objets et les techniques avancées de récupération.",
      "image": "assets/images/education/rapport.png",
      "color": Colors.brown.shade300,
      "page": RapportObjetsScreen(),
    },
    {
      "title": "Détection d'odeurs",
      "description": "Initiez votre chien à la recherche et détection d'odeurs comme un professionnel.",
      "image": "assets/images/education/flair.png",
      "color": Colors.brown.shade300,
      "page": DetectionOdeursScreen(),
    },
    {
      "title": "Éducation aux signaux silencieux",
      "description": "Enseignez des commandes avec des gestes et non des mots.",
      "image": "assets/images/education/gestes.png",
      "color": Colors.brown.shade300,
      "page": SignauxSilencieuxScreen(),
    },
    {
      "title": "Suivi hors laisse",
      "description": "Améliorez le suivi sans laisse pour une liberté maîtrisée.",
      "image": "assets/images/education/libre.png",
      "color": Colors.brown.shade300,
      "page": SuiviHorsLaisseScreen(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dressage Avancé")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: advancedTrainingSteps.length,
          itemBuilder: (context, index) {
            final step = advancedTrainingSteps[index];
            return _buildTrainingCard(
              step["title"],
              step["description"],
              step["image"],
              step["color"],
              context,
              step["page"],
            );
          },
        ),
      ),
    );
  }

  Widget _buildTrainingCard(String title, String description, String imagePath, Color bgColor, BuildContext context, Widget page) {
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
            color: bgColor,
          ),
          child: Row(
            children: [
              // Texte à gauche (70%)
              Expanded(
                flex: 6,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                      SizedBox(height: 5),
                      Text(description, style: TextStyle(fontSize: 14, color: Colors.white70)),
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
                  child: Image.asset(imagePath, fit: BoxFit.cover, height: 150),
                ),
              ),
            ],
          ),
        ),
      ).animate().fade(duration: 500.ms).slideX(begin: 0.1),
    );
  }
}