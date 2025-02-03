import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TrainingTipsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> trainingTips = [
    {
      "title": "Soyez patient et cohérent",
      "description": "La clé du succès est la répétition et la patience. Un chien apprend par la constance de son maître.",
      "image": "assets/images/education/patiente.png",
      "color": Colors.brown.shade300,    },
    {
      "title": "Récompenses et motivation",
      "description": "Bien utiliser les friandises, caresses et encouragements renforce les bons comportements.",
      "image": "assets/images/education/recompense.png",
      "color": Colors.brown.shade300,    },
    {
      "title": "Utilisation du bon ton de voix",
      "description": "Un ton calme et ferme est plus efficace qu’une voix agressive ou criarde.",
      "image": "assets/images/education/ton.png",
      "color": Colors.brown.shade300,    },
    {
      "title": "Évitez les punitions inutiles",
      "description": "Punir un chien après-coup est inefficace. Mettez l'accent sur le renforcement positif.",
      "image": "assets/images/education/punirinutile.png",
      "color": Colors.brown.shade300,    },
    {
      "title": "Courtes séances mais fréquentes",
      "description": "Des sessions courtes plusieurs fois par jour sont plus efficaces que des entraînements longs.",
      "image": "assets/images/education/chrono.png",
      "color": Colors.brown.shade300,    },
    {
      "title": "Comprendre le langage canin",
      "description": "Apprenez à lire les signaux de stress, de joie ou d’inconfort pour mieux communiquer.",
      "image": "assets/images/education/dialogue.png",
      "color": Colors.brown.shade300,    },
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
            );
          },
        ),
      ),
    );
  }

  Widget _buildTipCard(
      String title, String description, String imagePath, Color bgColor, BuildContext context) {
    return GestureDetector(
      onTap: () => _showTipDetail(context, title, description, imagePath),
      child: Card(
        elevation: 6,
        margin: EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: bgColor ?? Colors.grey, // Couleur de fond avec valeur par défaut
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
              // ✅ Image totalement à droite (prend 30% de la largeur)
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
                    height: 150, // Ajustable selon la hauteur de la carte
                  ),
                ),
              ),
            ],
          ),
        ),
      ).animate().fade(duration: 500.ms).slideX(begin: 0.1),
    );
  }

  void _showTipDetail(BuildContext context, String title, String description, String imagePath) {
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
                    // ✅ Description
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