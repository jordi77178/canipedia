import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HygieneScreen extends StatelessWidget {
  final List<Map<String, dynamic>> hygieneTips = [
    {
      "title": "🚿 Bain & Fréquence",
      "description": "Donner un bain une fois par mois est idéal pour éviter d'altérer les huiles naturelles de la peau.",
      "image": "assets/images/bath.png",
      "color": Colors.blue.shade300,
    },
    {
      "title": "🦷 Soins dentaires",
      "description": "Un brossage des dents 2 à 3 fois par semaine prévient tartre et infections buccales.",
      "image": "assets/images/dental_care.png",
      "color": Colors.green.shade400,
    },
    {
      "title": "👂 Nettoyage des oreilles",
      "description": "Les oreilles doivent être nettoyées toutes les 2 semaines pour éviter les otites.",
      "image": "assets/images/ear_cleaning.png",
      "color": Colors.orange.shade300,
    },
    {
      "title": "🐾 Coupe des griffes",
      "description": "Les griffes doivent être taillées toutes les 4 semaines pour éviter blessures et douleurs.",
      "image": "assets/images/nail_trim.png",
      "color": Colors.brown.shade400,
    },
    {
      "title": "🧼 Soin du pelage",
      "description": "Un brossage régulier (2-3 fois/semaine) réduit la perte de poils et prévient les nœuds.",
      "image": "assets/images/coat_care.png",
      "color": Colors.red.shade300,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hygiène & Soins")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: hygieneTips.length,
          itemBuilder: (context, index) {
            final tip = hygieneTips[index];
            return _buildHygieneCard(
              tip["title"],
              tip["description"],
              tip["image"],
              tip["color"],
              context,
            );
          },
        ),
      ),
    );
  }

  Widget _buildHygieneCard(
      String title, String description, String imagePath, Color bgColor, BuildContext context) {
    return GestureDetector(
      onTap: () => _showHygieneDetail(context, title, description, imagePath),
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
              // ✅ Texte à gauche (prend 70% de la largeur)
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
              // ✅ Image totalement à droite (prend 30% de la largeur)
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

  void _showHygieneDetail(BuildContext context, String title, String description, String imagePath) {
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