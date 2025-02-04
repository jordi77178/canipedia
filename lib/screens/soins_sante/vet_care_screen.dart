import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '/screens/soins_sante/vet_care/essential_vaccinations_screen.dart';
import '/screens/soins_sante/vet_care/first_aid_screen.dart';
import '/screens/soins_sante/vet_care/identify_health_issues_screen.dart';
import '/screens/soins_sante/vet_care/parasites_vermifuges_screen.dart';
import '/screens/soins_sante/vet_care/routine_visits_screen.dart';



class VetCareScreen extends StatelessWidget {
  final List<Map<String, dynamic>> vetCareTips = [
    {
      "title": "Visites de routine",
      "description": "Un check-up annuel est essentiel pour s'assurer que votre chien est en bonne santé.",
      "image": "assets/images/soins/visiteveto.png",
      "color": Colors.brown.shade300,
      "page": RoutineVisitsScreen(),
    },
    {
      "title": "Vaccinations essentielles",
      "description": "Les vaccins préviennent de nombreuses maladies graves. Consultez votre vétérinaire pour un suivi régulier.",
      "image": "assets/images/soins/vaccin.png",
      "color": Colors.brown.shade300,
      "page": EssentialVaccinationsScreen(),
    },
    {
      "title": "Parasites et vermifuges",
      "description": "Un traitement antiparasitaire (puces, tiques, vers) doit être administré régulièrement.",
      "image": "assets/images/soins/vermifuge.png",
      "color": Colors.brown.shade300,
      "page": ParasitesVermifugesScreen(),
    },
    {
      "title": "Premiers secours",
      "description": "Apprenez les gestes d'urgence : hémorragies, brûlures, intoxications, etc.",
      "image": "assets/images/soins/secours.png",
      "color": Colors.brown.shade300,
      "page": FirstAidScreen(),
    },
    {
      "title": "Identifier un problème de santé",
      "description": "Changements d’appétit, fatigue, vomissements… Repérez rapidement les signes inquiétants.",
      "image": "assets/images/soins/detecter.png",
      "color": Colors.brown.shade300,
      "page": IdentifyHealthIssuesScreen(),
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
              tip["page"],
            );
          },
        ),
      ),
    );
  }

  Widget _buildVetCareCard(
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
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
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
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                  child: Image.asset(imagePath,
                      fit: BoxFit.cover, height: 150),
                ),
              ),
            ],
          ),
        ),
      ).animate().fade(duration: 500.ms).slideX(begin: 0.1),
    );
  }
}