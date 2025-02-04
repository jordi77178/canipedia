// lib/screens/education_canine/puppy_education_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

// Importation des pages spécifiques de l'éducation du chiot
import 'puppy_education/socialisation_screen.dart';
import 'puppy_education/proprete_chiot_screen.dart';
import 'puppy_education/mordillements_screen.dart';
import 'puppy_education/solitude_screen.dart';
import 'puppy_education/promenades_laisse_screen.dart';

class PuppyEducationScreen extends StatelessWidget {
  final List<Map<String, dynamic>> puppyTrainingSteps = [
    {
      "title": "Socialisation précoce",
      "description": "Exposez votre chiot à diverses personnes, bruits et environnements dès son plus jeune âge.",
      "image": "assets/images/education/socialisation.png",
      "color": Colors.brown.shade300,
      "page": SocialisationScreen(),
    },
    {
      "title": "Début de la propreté",
      "description": "Méthodes douces et efficaces pour apprendre à votre chiot où et quand faire ses besoins.",
      "image": "assets/images/education/propre.png",
      "color": Colors.brown.shade300,
      "page": PropreteChiotScreen(),
    },
    {
      "title": "Gérer les mordillements",
      "description": "Apprenez à votre chiot à ne pas mordre en jouant et à avoir une bonne inhibition de la morsure.",
      "image": "assets/images/education/mordillement.png",
      "color": Colors.brown.shade300,
      "page": MordillementsScreen(),
    },
    {
      "title": "Apprendre la solitude",
      "description": "Évitez l’anxiété de séparation en habituant votre chiot à rester seul progressivement.",
      "image": "assets/images/education/solitude.png",
      "color": Colors.brown.shade300,
      "page": SolitudeScreen(),
    },
    {
      "title": "Promenades en laisse",
      "description": "Apprenez à votre chiot à marcher en laisse sans tirer et à bien se comporter en extérieur.",
      "image": "assets/images/education/chiotlaisse.png",
      "color": Colors.brown.shade300,
      "page": PromenadesLaisseScreen(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Éducation des Chiots")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: puppyTrainingSteps.length,
          itemBuilder: (context, index) {
            final step = puppyTrainingSteps[index];
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

  Widget _buildTrainingCard(
      String title,
      String description,
      String imagePath,
      Color bgColor,
      BuildContext context,
      Widget page,
      ) {
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
                flex: 6,
                child: Padding(
                  padding: EdgeInsets.all(5),
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