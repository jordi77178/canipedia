// lib/screens/education_canine/puppy_education/mordillements_screen.dart
import 'package:flutter/material.dart';

class MordillementsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gérer les mordillements"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/education/mordillement.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text("Gérer les mordillements", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text(
                "Les mordillements sont un comportement naturel chez le chiot mais il est important de lui apprendre à moduler sa force. Voici quelques conseils pour gérer ce comportement.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text("Étapes pour corriger les mordillements", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildStepCard("Utiliser des jouets adaptés", "Redirigez son mordillement vers des jouets appropriés."),
              _buildStepCard("Interrompre le jeu", "Si le mordillement devient trop brutal, arrêtez immédiatement le jeu."),
              _buildStepCard("Encourager la douceur", "Récompensez les comportements calmes et doux."),
              SizedBox(height: 20),
              Text("Erreurs à éviter", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildAdviceCard("Punition physique", "N'utilisez jamais la force pour corriger le chiot."),
              _buildAdviceCard("Récompense inappropriée", "Ne récompensez pas un comportement brutal."),
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