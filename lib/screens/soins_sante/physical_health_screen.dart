import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '/screens/soins_sante/physical_health/canicross_jogging_screen.dart';
import '/screens/soins_sante/physical_health/entrainement_mental_screen.dart';
import '/screens/soins_sante/physical_health/jeux_interactifs_screen.dart';
import '/screens/soins_sante/physical_health/natation_screen.dart';
import '/screens/soins_sante/physical_health/parcours_agility_screen.dart';
import '/screens/soins_sante/physical_health/promenades_quotidiennes_screen.dart';



class PhysicalHealthScreen extends StatelessWidget {
  final List<Map<String, dynamic>> activities = [
    {
      "title": "Promenades quotidiennes",
      "description": "Les bases : 30 à 60 minutes de marche par jour pour tous les chiens.",
      "image": "assets/images/soins/promenade.png",
      "color": Colors.brown.shade300,
      "page": PromenadesQuotidiennesScreen(),
    },
    {
      "title": "Jeux interactifs",
      "description": "Lancez-lui la balle ou jouez à la corde pour renforcer vos liens.",
      "image": "assets/images/soins/tircorde.png",
      "color": Colors.brown.shade300,
      "page": JeuxInteractifsScreen(),
    },
    {
      "title": "Parcours d'agility",
      "description": "Parfait pour stimuler l’intelligence et la forme physique.",
      "image": "assets/images/soins/agility.png",
      "color": Colors.brown.shade300,
      "page": ParcoursAgilityScreen(),
    },
    {
      "title": "Canicross & Jogging",
      "description": "Courir avec son chien est idéal pour les races sportives.",
      "image": "assets/images/soins/canicross.png",
      "color": Colors.brown.shade300,
      "page": CanicrossJoggingScreen(),
    },
    {
      "title": "Natation",
      "description": "Excellent exercice, doux pour les articulations.",
      "image": "assets/images/soins/natation.png",
      "color": Colors.brown.shade300,
      "page": NatationScreen(),
    },
    {
      "title": "Entraînement mental",
      "description": "Stimulez son cerveau avec des jeux d’intelligence et du dressage.",
      "image": "assets/images/soins/cerebral.png",
      "color": Colors.brown.shade300,
      "page": EntrainementMentalScreen(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Activité Physique du Chien")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: activities.length,
          itemBuilder: (context, index) {
            final activity = activities[index];
            return _buildActivityCard(
              activity["title"],
              activity["description"],
              activity["image"],
              activity["color"],
              context,
              activity["page"],
            );
          },
        ),
      ),
    );
  }

  Widget _buildActivityCard(String title, String description, String imagePath, Color bgColor, BuildContext context, Widget page) {
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
                      Text(title,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                      SizedBox(height: 5),
                      Text(description,
                          style: TextStyle(fontSize: 14, color: Colors.white70)),
                    ],
                  ),
                ),
              ),
              // Image à droite (30 %)
              Expanded(
                flex: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
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