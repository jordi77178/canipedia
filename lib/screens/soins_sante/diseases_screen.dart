import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '/screens/soins_sante/diseases/fievre_tique_screen.dart';
import '/screens/soins_sante/diseases/leishmaniose_screen.dart';
import '/screens/soins_sante/diseases/maladie_carre_screen.dart';
import '/screens/soins_sante/diseases/maladie_parodontale_screen.dart';
import '/screens/soins_sante/diseases/parvovirose_screen.dart';



class DiseasesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> diseases = [
    {
      "title": "Maladie de Carré",
      "description": "Virus grave affectant les voies respiratoires, digestives et nerveuses.",
      "image": "assets/images/soins/carre.png",
      "color": Colors.brown.shade300,
      "page": MaladieCarreScreen(),
    },
    {
      "title": "Parvovirose",
      "description": "Infection virale extrêmement contagieuse touchant l’intestin des chiots.",
      "image": "assets/images/soins/parvovirose.png",
      "color": Colors.brown.shade300,
      "page": ParvoviroseScreen(),
    },
    {
      "title": "Maladie parodontale",
      "description": "Accumulation de tartre causant gingivite et perte de dents.",
      "image": "assets/images/soins/parodontale.png",
      "color": Colors.brown.shade300,
      "page": MaladieParodontaleScreen(),
    },
    {
      "title": "Leishmaniose",
      "description": "Maladie parasitaire transmise par les phlébotomes, souvent mortelle.",
      "image": "assets/images/soins/leishmaniose.png",
      "color": Colors.brown.shade300,
      "page": LeishmanioseScreen(),
    },
    {
      "title": "Fièvre de la tique",
      "description": "Infection bactérienne transmise par les tiques, provoquant fièvre et anémie.",
      "image": "assets/images/soins/tique.png",
      "color": Colors.brown.shade300,
      "page": FievreTiqueScreen(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Maladies Canines")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: diseases.length,
          itemBuilder: (context, index) {
            final disease = diseases[index];
            return _buildDiseaseCard(
              disease["title"],
              disease["description"],
              disease["image"],
              disease["color"],
              context,
              disease["page"],
            );
          },
        ),
      ),
    );
  }

  Widget _buildDiseaseCard(
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
                      Text(description, style: TextStyle(fontSize: 14, color: Colors.white70)),
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