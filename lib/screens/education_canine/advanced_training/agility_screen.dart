// lib/screens/education_canine/advanced_training/agility_screen.dart
import 'package:flutter/material.dart';

class AgilityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Agility, parcours sportifs")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/education/agility.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text(
                "Agility et Parcours Sportifs",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Développez les capacités physiques et mentales de votre chien avec des parcours agiles. L'agility permet d'améliorer sa coordination et renforce le lien entre vous.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              _buildStepCard("Étape 1 : Familiarisation avec le parcours", "Laissez votre chien explorer le parcours à son rythme."),
              _buildStepCard("Étape 2 : Apprendre les obstacles de base", "Commencez par des obstacles simples comme le tunnel ou les petits sauts."),
              _buildStepCard("Étape 3 : Augmenter progressivement la difficulté", "Intégrez des obstacles plus complexes au fil des séances."),
              SizedBox(height: 20),
              Text("Conseils et erreurs à éviter", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildAdviceCard("Ne pas forcer votre chien", "Respectez son rythme d'apprentissage et évitez la frustration."),
              _buildAdviceCard("Ignorer les signaux de fatigue", "Offrez des pauses régulières pour éviter l'épuisement."),
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