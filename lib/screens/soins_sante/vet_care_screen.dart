import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class VetCareScreen extends StatelessWidget {
  final List<Map<String, dynamic>> vetCareTips = [
    {
      "title": "📅 Visites de routine",
      "description": "Un check-up annuel est essentiel pour s'assurer que votre chien est en bonne santé.",
      "image": "assets/images/checkup.png",
      "color": Colors.blue.shade300,
    },
    {
      "title": "💉 Vaccinations essentielles",
      "description": "Les vaccins préviennent de nombreuses maladies graves. Consultez votre vétérinaire pour un suivi régulier.",
      "image": "assets/images/vaccine.png",
      "color": Colors.green.shade400,
    },
    {
      "title": "🦠 Parasites et vermifuges",
      "description": "Un traitement antiparasitaire (puces, tiques, vers) doit être administré régulièrement.",
      "image": "assets/images/parasites.png",
      "color": Colors.orange.shade300,
    },
    {
      "title": "🚑 Premiers secours",
      "description": "Apprenez les gestes d'urgence : hémorragies, brûlures, intoxications, etc.",
      "image": "assets/images/first_aid.png",
      "color": Colors.red.shade400,
    },
    {
      "title": "🩺 Identifier un problème de santé",
      "description": "Changements d’appétit, fatigue, vomissements… Repérez rapidement les signes inquiétants.",
      "image": "assets/images/health_check.png",
      "color": Colors.purple.shade300,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Soins Vétérinaires")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: vetCareTips.length,
          itemBuilder: (context, index) {
            final tip = vetCareTips[index];
            return _buildVetCareCard(
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

  Widget _buildVetCareCard(
      String title, String description, String imagePath, Color bgColor, BuildContext context) {
    return GestureDetector(
      onTap: () => _showVetCareDetail(context, title, description, imagePath),
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

  void _showVetCareDetail(BuildContext context, String title, String description, String imagePath) {
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