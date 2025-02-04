// lib/screens/education_canine/puppy_education/promenades_laisse_screen.dart
import 'package:flutter/material.dart';

class PromenadesLaisseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Promenades en laisse"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/education/chiotlaisse.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text("Promenades en laisse", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text(
                "Apprenez à votre chiot à marcher en laisse sans tirer et à adopter un comportement calme lors des promenades. Une bonne maîtrise de la laisse est essentielle pour des sorties agréables.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text("Étapes pour réussir", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildStepCard("Initier la familiarisation", "Laissez le chiot s'habituer à la laisse en la laissant traîner pendant ses jeux."),
              _buildStepCard("Pratiquer à l'intérieur", "Commencez dans un environnement sans distractions pour renforcer le comportement."),
              _buildStepCard("Sortir progressivement", "Augmentez la durée des promenades à l'extérieur tout en restant vigilant."),
              SizedBox(height: 20),
              Text("Conseils et erreurs à éviter", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildAdviceCard("Tirer sur la laisse", "Corrigez doucement mais fermement sans crier."),
              _buildAdviceCard("Ignorer les distractions", "Apprenez à rediriger l'attention du chiot lors des sorties."),
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