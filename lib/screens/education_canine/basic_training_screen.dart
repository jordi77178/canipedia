import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '/screens/education_canine/basic_training/assis_screen.dart';
import '/screens/education_canine/basic_training/couche_screen.dart';
import '/screens/education_canine/basic_training/rappel_screen.dart';
import '/screens/education_canine/basic_training/laisse_screen.dart';
import '/screens/education_canine/basic_training/stay_screen.dart';
import '/screens/education_canine/basic_training/patte_screen.dart';


class BasicTrainingScreen extends StatelessWidget {
  final List<Map<String, dynamic>> trainingSteps = [
    {
      "title": "Apprendre le Assis",
      "description": "Méthode simple et efficace pour apprendre le assis à votre chien.",
      "image": "assets/images/education/assis.png",
      "color": Colors.brown.shade300,
      "page": AssisScreen(), // 🌟 Nouvelle page indépendante
    },
    {
      "title": "Apprendre le Couché",
      "description": "Technique pour enseigner le couché en douceur.",
      "image": "assets/images/education/couche.png",
      "color": Colors.brown.shade300,
      "page": CoucheScreen(),
    },
    {
      "title": "Le Rappel",
      "description": "Exercices pour garantir que votre chien revient quand vous l'appelez.",
      "image": "assets/images/education/rappel.png",
      "color": Colors.brown.shade300,
      "page": RappelScreen(),
    },
    {
      "title": "La Marche en laisse",
      "description": "Comment éviter que votre chien tire sur la laisse.",
      "image": "assets/images/education/laisse.png",
      "color": Colors.brown.shade300,
      "page": LaisseScreen(),
    },
    {
      "title": "Le Pas Bouger",
      "description": "Lui apprendre à rester immobile même avec des distractions.",
      "image": "assets/images/education/stay.png",
      "color": Colors.brown.shade300,
      "page": StayScreen(),
    },
    {
      "title": "Le Donne la patte",
      "description": "Lui apprendre à rester immobile même avec des distractions.",
      "image": "assets/images/education/patte.png",
      "color": Colors.brown.shade300,
      "page": DonnePatte(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bases du Dressage")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: trainingSteps.length,
          itemBuilder: (context, index) {
            final step = trainingSteps[index];
            return _buildTrainingCard(
              step["title"],
              step["description"],
              step["image"],
              step["color"],
              context,
              step["page"], // 👈 Ajout de la page associée
            );
          },
        ),
      ),
    );
  }

  Widget _buildTrainingCard(String title, String description, String imagePath, Color? bgColor, BuildContext context, Widget page) {
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
              Expanded(
                flex: 6,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white)),
                      SizedBox(height: 5),
                      Text(description, style: TextStyle(fontSize: 14, color: Colors.white70)),
                    ],
                  ),
                ),
              ),
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