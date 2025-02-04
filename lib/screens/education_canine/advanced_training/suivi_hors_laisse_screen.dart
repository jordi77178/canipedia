// lib/screens/education_canine/advanced_training/suivi_hors_laisse_screen.dart
import 'package:flutter/material.dart';

class SuiviHorsLaisseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Suivi hors laisse")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/education/libre.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text(
                "Suivi Hors Laisse",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Améliorez le suivi de votre chien sans l'utilisation de la laisse pour une plus grande liberté tout en gardant un contrôle optimal. Cette méthode nécessite une base d'obéissance solide et une confiance mutuelle.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              _buildStepCard("Étape 1 : Consolider l'obéissance de base", "Assurez-vous que votre chien réagit bien aux commandes de base."),
              _buildStepCard("Étape 2 : Entraînez dans un environnement sécurisé", "Commencez dans un espace clos et augmentez progressivement les distractions."),
              _buildStepCard("Étape 3 : Récompensez chaque succès", "Utilisez des récompenses pour renforcer le comportement positif."),
              SizedBox(height: 20),
              Text("Conseils et erreurs à éviter", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildAdviceCard("Laisser le chien trop libre trop tôt", "Commencez uniquement lorsque vous avez une base solide d'obéissance."),
              _buildAdviceCard("Négliger la sécurité", "Assurez-vous que l'environnement est sécurisé pour éviter tout risque."),
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