import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class PuppyEducationScreen extends StatelessWidget {
  final List<Map<String, dynamic>> puppyTrainingSteps = [
    {
      "title": "Socialisation précoce",
      "description": "Exposez votre chiot à diverses personnes, bruits et environnements dès son plus jeune âge.",
      "image": "assets/images/education/socialisation.png",
      "color": Colors.brown.shade300,    },
    {
      "title": "Début de la propreté",
      "description": "Méthodes douces et efficaces pour apprendre à votre chiot où et quand faire ses besoins.",
      "image": "assets/images/education/propre.png",
      "color": Colors.brown.shade300,    },
    {
      "title": "Gerer les mordillements",
      "description": "Apprenez à votre chiot à ne pas mordre en jouant et à avoir une bonne inhibition de la morsure.",
      "image": "assets/images/education/mordillement.png",
      "color": Colors.brown.shade300,    },
    {
      "title": "Apprendre la solitude",
      "description": "Évitez l’anxiété de séparation en habituant votre chiot à rester seul progressivement.",
      "image": "assets/images/education/solitude.png",
      "color": Colors.brown.shade300,    },
    {
      "title": "Promenades en laisse",
      "description": "Apprenez à votre chiot à marcher en laisse sans tirer et à bien se comporter en extérieur.",
      "image": "assets/images/education/chiotlaisse.png",
      "color": Colors.brown.shade300,    },
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
            );
          },
        ),
      ),
    );
  }

  Widget _buildTrainingCard(
      String title, String description, String imagePath, Color bgColor, BuildContext context) {
    return GestureDetector(
      onTap: () => _showTrainingDetail(context, title, description, imagePath),
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

  void _showTrainingDetail(BuildContext context, String title, String description, String imagePath) {
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