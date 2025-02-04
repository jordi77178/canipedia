// lib/screens/education_canine/training_tips/patience_coherent_screen.dart
import 'package:flutter/material.dart';

class PatienceCoherentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Soyez patient et cohérent"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/education/patiente.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text(
                "Soyez patient et cohérent",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "La clé du succès est la répétition et la patience. Un chien apprend par la constance de son maître. Il est important de fixer des règles claires et de s'y tenir pour éviter toute confusion.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text("Conseils pratiques", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildTipDetailCard("Répétez les commandes", "Utilisez régulièrement les mêmes mots et gestes pour chaque ordre."),
              _buildTipDetailCard("Restez calme", "Votre attitude calme et posée aide le chien à comprendre l'importance de la cohérence."),
              SizedBox(height: 20),
              Text("Erreurs à éviter", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildTipDetailCard("Incohérence", "Changer trop souvent les règles ou les commandes peut créer de la confusion chez le chien."),
              _buildTipDetailCard("Impatience", "Évitez de montrer de la frustration si le chien ne comprend pas immédiatement."),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTipDetailCard(String title, String description) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(Icons.check_circle, color: Colors.green),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
      ),
    );
  }
}