import 'package:flutter/material.dart';

class EducationScreen extends StatelessWidget {
  final List<Map<String, String>> educationTips = [
    {"title": "L'importance du dressage", "content": "Un chien bien dressé est plus heureux et équilibré."},
    {"title": "Apprendre la propreté", "content": "Utilisez le renforcement positif pour de meilleurs résultats."},
    {"title": "Comment socialiser son chien ?", "content": "Exposez-le à différents environnements dès son jeune âge."},
    {"title": "Éviter l’anxiété de séparation", "content": "Ne partez pas toujours de manière soudaine, habituez-le progressivement."},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Éducation Canine")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: educationTips.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 3,
              margin: EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                title: Text(educationTips[index]["title"]!, style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(educationTips[index]["content"]!),
                leading: Icon(Icons.school, color: Colors.blue),
              ),
            );
          },
        ),
      ),
    );
  }
}