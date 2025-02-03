import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AdvancedTrainingScreen extends StatelessWidget {
  final List<Map<String, dynamic>> advancedTrainingSteps = [
    {
      "title": "Obéissance à distance",
      "description": "Apprenez à donner des ordres clairs à distance pour un contrôle total.",
      "image": "assets/images/education/loin.png",
      "color": Colors.brown.shade300,    },
    {
      "title": "Agility, parcours sportifs",
      "description": "Développez les capacités physiques et mentales de votre chien avec des parcours agiles.",
      "image": "assets/images/education/agility.png",
      "color": Colors.brown.shade300,    },
    {
      "title": "Rapport d'objets",
      "description": "Perfectionnez le retour d'objets et les techniques avancées de récupération.",
      "image": "assets/images/education/rapport.png",
      "color": Colors.brown.shade300,    },
    {
      "title": "Détection d'odeurs",
      "description": "Initiez votre chien à la recherche et détection d'odeurs comme un professionnel.",
      "image": "assets/images/education/flair.png",
      "color": Colors.brown.shade300,    },
    {
      "title": "Éducation aux signaux silencieux",
      "description": "Enseignez des commandes avec des gestes et non des mots.",
      "image": "assets/images/education/gestes.png",
      "color": Colors.brown.shade300,    },
    {
      "title": "Suivi hors laisse",
      "description": "Améliorez le suivi sans laisse pour une liberté maîtrisée.",
      "image": "assets/images/education/libre.png",
      "color": Colors.brown.shade300,    },
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