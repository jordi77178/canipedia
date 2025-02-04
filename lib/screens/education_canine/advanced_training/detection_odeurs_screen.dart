// lib/screens/education_canine/advanced_training/detection_odeurs_screen.dart
import 'package:flutter/material.dart';

class DetectionOdeursScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Détection d'odeurs")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/education/flair.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text(
                "Détection d'Odeurs",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Initiez votre chien à la recherche et à la détection d'odeurs comme un professionnel. Cette technique stimule son esprit et peut être appliquée à divers jeux de piste.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              _buildStepCard("Étape 1 : Introduire une odeur spécifique", "Utilisez une odeur familière à votre chien."),
              _buildStepCard("Étape 2 : Créer un jeu de piste", "Cachez des récompenses associées à l'odeur pour stimuler la recherche."),
              _buildStepCard("Étape 3 : Augmenter la complexité", "Variez les cachettes et la difficulté de l'exercice."),
              SizedBox(height: 20),
              Text("Conseils et erreurs à éviter", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildAdviceCard("Utiliser des odeurs trop intenses", "Optez pour des odeurs naturelles et modérées."),
              _buildAdviceCard("Changer trop rapidement d'odeur", "Maintenez une cohérence pour que le chien puisse associer l'odeur à l'exercice."),
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