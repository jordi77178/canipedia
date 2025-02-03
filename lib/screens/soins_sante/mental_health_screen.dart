import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MentalHealthScreen extends StatelessWidget {
  final List<Map<String, dynamic>> mentalWellness = [
    {
      "title": "🧩 Jeux d’intelligence",
      "description": "Utilisez des jouets interactifs pour stimuler son cerveau.",
      "image": "assets/images/puzzle_toys.png",
      "color": Colors.deepPurple.shade400,
    },
    {
      "title": "🎶 Musique et sons apaisants",
      "description": "Aidez votre chien à se détendre avec de la musique relaxante.",
      "image": "assets/images/relaxing_music.png",
      "color": Colors.blue.shade400,
    },
    {
      "title": "🤗 Socialisation",
      "description": "Rencontrez d’autres chiens pour éviter l’ennui et la solitude.",
      "image": "assets/images/socialization.png",
      "color": Colors.green.shade400,
    },
    {
      "title": "🏡 Routines et repères",
      "description": "Une routine stable réduit l’anxiété et renforce la confiance.",
      "image": "assets/images/routine.png",
      "color": Colors.orange.shade400,
    },
    {
      "title": "🐾 Exercice et dépense physique",
      "description": "Un chien fatigué est un chien heureux et détendu.",
      "image": "assets/images/physical_activity.png",
      "color": Colors.red.shade400,
    },
    {
      "title": "💆 Massage et caresses",
      "description": "Apprenez à détendre votre chien avec des massages spécifiques.",
      "image": "assets/images/massage.png",
      "color": Colors.teal.shade400,
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
            );
          },
        ),
      ),
    );
  }

  Widget _buildWellnessCard(
      String title, String description, String imagePath, Color bgColor, BuildContext context) {
    return GestureDetector(
      onTap: () => _showWellnessDetail(context, title, description, imagePath),
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
              // ✅ Texte à gauche (70% de la largeur)
              Expanded(
                flex: 7,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
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
              // ✅ Image totalement à droite (30% de la largeur)
              Expanded(
                flex: 3,
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

  void _showWellnessDetail(BuildContext context, String title, String description, String imagePath) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.6,
          minChildSize: 0.4,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 2)],
                ),
                child: Column(
                  children: [
                    // ✅ Titre et bouton de fermeture
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: Icon(Icons.close, size: 28, color: Colors.grey[700]),
                          onPressed: () => Navigator.pop(context),
                        ).animate().rotate(duration: 600.ms),
                      ],
                    ),
                    Divider(),
                    SizedBox(height: 10),
                    // ✅ Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(imagePath, height: 150, fit: BoxFit.cover),
                    ).animate().fade(duration: 500.ms).scaleXY(begin: 0.9, end: 1),
                    SizedBox(height: 15),
                    // ✅ Description détaillée
                    Expanded(
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            description,
                            style: TextStyle(fontSize: 16, height: 1.5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}