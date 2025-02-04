import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '/screens/soins_sante/mental_health/exercice_depense_screen.dart';
import '/screens/soins_sante/mental_health/musique_apaisante_screen.dart';
import '/screens/soins_sante/mental_health/jeux_intelligence_screen.dart';
import '/screens/soins_sante/mental_health/massage_caresse_screen.dart';
import '/screens/soins_sante/mental_health/routines_repere_screen.dart';
import '/screens/soins_sante/mental_health/socialisation_mental_screen.dart';





class MentalHealthScreen extends StatelessWidget {
  final List<Map<String, dynamic>> mentalWellness = [
    {
      "title": "Jeux d’intelligence",
      "description": "Utilisez des jouets interactifs pour stimuler son cerveau.",
      "image": "assets/images/soins/cerebral.png",
      "color": Colors.brown.shade300,
      "page": JeuxIntelligenceScreen(),
    },
    {
      "title": "Musique et sons apaisants",
      "description": "Aidez votre chien à se détendre avec de la musique relaxante.",
      "image": "assets/images/soins/music.png",
      "color": Colors.brown.shade300,
      "page": MusiqueApaisanteScreen(),
    },
    {
      "title": "Socialisation",
      "description": "Rencontrez d’autres chiens pour éviter l’ennui et la solitude.",
      "image": "assets/images/soins/socialisation.png",
      "color": Colors.brown.shade300,
      "page": SocialisationMentalScreen(),
    },
    {
      "title": "Routines et repères",
      "description": "Une routine stable réduit l’anxiété et renforce la confiance.",
      "image": "assets/images/soins/routine.png",
      "color": Colors.brown.shade300,
      "page": RoutinesRepereScreen(),
    },
    {
      "title": "Exercice et dépense physique",
      "description": "Un chien fatigué est un chien heureux et détendu.",
      "image": "assets/images/soins/exercice.png",
      "color": Colors.brown.shade300,
      "page": ExerciceDepenseScreen(),
    },
    {
      "title": "Massage et caresses",
      "description": "Apprenez à détendre votre chien avec des massages spécifiques.",
      "image": "assets/images/soins/caresse.png",
      "color": Colors.brown.shade300,
      "page": MassageCaresseScreen(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bien-être Mental du Chien")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: mentalWellness.length,
          itemBuilder: (context, index) {
            final item = mentalWellness[index];
            return _buildWellnessCard(
              item["title"],
              item["description"],
              item["image"],
              item["color"],
              context,
              item["page"],
            );
          },
        ),
      ),
    );
  }

  Widget _buildWellnessCard(String title, String description, String imagePath, Color bgColor, BuildContext context, Widget page) {
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
              // Texte à gauche (70 %)
              Expanded(
                flex: 6,
                child: Padding(
                  padding: EdgeInsets.all(10),
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
              // Image à droite (30 %)
              Expanded(
                flex: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
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