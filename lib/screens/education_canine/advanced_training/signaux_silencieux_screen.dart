// lib/screens/education_canine/advanced_training/signaux_silencieux_screen.dart
import 'package:flutter/material.dart';

class SignauxSilencieuxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Éducation aux signaux silencieux")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/education/gestes.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text(
                "Éducation aux Signaux Silencieux",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Enseignez des commandes à votre chien par le biais de gestes plutôt que par des mots. Cette méthode renforce la communication non verbale et est particulièrement utile dans des environnements bruyants.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              _buildStepCard("Étape 1 : Choisir des gestes clairs", "Utilisez des gestes simples et distincts."),
              _buildStepCard("Étape 2 : Associer le geste à une commande", "Renforcez progressivement l'association entre le geste et l'action souhaitée."),
              _buildStepCard("Étape 3 : Répéter et renforcer", "Pratiquez régulièrement pour une bonne assimilation."),
              SizedBox(height: 20),
              Text("Conseils et erreurs à éviter", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildAdviceCard("Utiliser des gestes trop similaires", "Assurez-vous que chaque geste est unique."),
              _buildAdviceCard("Manquer de cohérence", "Utilisez toujours le même geste pour la même commande."),
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