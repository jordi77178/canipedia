// lib/screens/education_canine/puppy_education/solitude_screen.dart
import 'package:flutter/material.dart';

class SolitudeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Apprendre la solitude"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center
            ,
            children: [
              Image.asset("assets/images/education/solitude.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text("Apprendre la solitude", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text(
                "Habituer votre chiot à rester seul progressivement permet d’éviter l’anxiété de séparation. Voici quelques étapes pour y parvenir en douceur.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text("Conseils pour réussir", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildStepCard("Commencer par de courtes absences", "Laissez le chiot seul quelques minutes et augmentez progressivement la durée."),
              _buildStepCard("Créer un environnement sécurisant", "Assurez-vous que le chiot dispose de ses jouets et de son espace habituel."),
              _buildStepCard("Rester discret lors des départs et arrivées", "Évitez de faire une grande scène pour ne pas accentuer l'angoisse."),
              SizedBox(height: 20),
              Text("Erreurs à éviter", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildAdviceCard("Forcer la solitude", "Ne laissez pas le chiot seul trop longtemps dès le début."),
              _buildAdviceCard("Augmenter la durée trop rapidement", "Respectez le rythme d'adaptation de votre chiot."),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepCard(String title, String description) {
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

  Widget _buildAdviceCard(String title, String description) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(Icons.error_outline, color: Colors.red),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
      ),
    );
  }
}