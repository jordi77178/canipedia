// lib/screens/education_canine/advanced_training/rapport_objets_screen.dart
import 'package:flutter/material.dart';

class RapportObjetsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Rapport d'objets")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/education/rapport.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text(
                "Rapport d'Objets",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Perfectionnez le retour d'objets et les techniques avancées de récupération. Cette compétence renforce l'obéissance et le jeu interactif avec votre chien.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              _buildStepCard("Étape 1 : Introduire l'objet", "Utilisez un objet familier pour initier l'exercice."),
              _buildStepCard("Étape 2 : Encourager le retour", "Appelez votre chien et récompensez-le dès qu'il rapporte l'objet."),
              _buildStepCard("Étape 3 : Varier les objets", "Changez régulièrement d'objet pour maintenir l'intérêt."),
              SizedBox(height: 20),
              Text("Conseils et erreurs à éviter", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildAdviceCard("Forcer le chien à rapporter", "Laissez-le progresser à son propre rythme."),
              _buildAdviceCard("Négliger la récompense", "Récompensez systématiquement chaque réussite pour renforcer le comportement."),
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