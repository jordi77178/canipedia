import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '/screens/education_canine/behavior_problems/aboiements_screen.dart';
import '/screens/education_canine/behavior_problems/agressivite_screen.dart';
import '/screens/education_canine/behavior_problems/destruction_screen.dart';
import '/screens/education_canine/behavior_problems/fugue_screen.dart';
import '/screens/education_canine/behavior_problems/peur_screen.dart';
import '/screens/education_canine/behavior_problems/proprete_screen.dart';


class BehaviorProblemsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> problems = [
    {
      "title": "Aboiements excessifs",
      "description": "Comprendre pourquoi votre chien aboie et comment le calmer efficacement.",
      "image": "assets/images/education/aboiement.png",
      "color": Colors.brown.shade300,
      "page": AboiementsScreen(), // 🌟 Nouvelle page indépendante
    },
    {
      "title": "Destruction de meubles",
      "description": "Apprenez à stopper les comportements destructeurs et à canaliser son énergie.",
      "image": "assets/images/education/meuble.png",
      "color": Colors.brown.shade300,
      "page": DestructionScreen(),
    },
    {
      "title": "Agressivité",
      "description": "Découvrez les causes et les techniques pour gérer un chien agressif.",
      "image": "assets/images/education/aggressivite.png",
      "color": Colors.brown.shade300,
      "page": AgressiviteScreen(),
    },
    {
      "title": "Fugue et désobéissance",
      "description": "Comment éviter les fugues et améliorer le rappel de votre chien.",
      "image": "assets/images/education/fugue.png",
      "color": Colors.brown.shade300,
      "page": FugueScreen(),
    },
    {
      "title": "Problèmes de propreté",
      "description": "Enseignez la propreté à votre chien avec des méthodes efficaces.",
      "image": "assets/images/education/caca.png",
      "color": Colors.brown.shade300,
      "page": PropreteScreen(),
    },
    {
      "title": "Peur et anxiété",
      "description": "Aidez votre chien à surmonter ses peurs et gérer son anxiété.",
      "image": "assets/images/education/peur.png",
      "color": Colors.brown.shade300,
      "page": PeurScreen(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Comportements Problématiques")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: problems.length,
          itemBuilder: (context, index) {
            final problem = problems[index];
            return _buildProblemCard(
              problem["title"],
              problem["description"],
              problem["image"],
              problem["color"],
              context,
              problem["page"], // 👈 Ajout de la page associée
            );
          },
        ),
      ),
    );
  }
}

  Widget _buildProblemCard(
      String title, String description, String imagePath, Color bgColor, BuildContext context, Widget page) {
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
            color: bgColor ?? Colors.grey, // Couleur de fond par défaut
          ),
          child: Row(
            children: [
              // ✅ Texte à gauche (70%)
              Expanded(
                flex: 6,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
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
              // ✅ Image à droite (30%)
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

  void _showProblemDetail(BuildContext context, String title, String description, String imagePath) {
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
