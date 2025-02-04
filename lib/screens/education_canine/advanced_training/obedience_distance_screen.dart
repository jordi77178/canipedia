// lib/screens/education_canine/advanced_training/obedience_distance_screen.dart
import 'package:flutter/material.dart';

class ObedienceDistanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Obéissance à distance")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/education/loin.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text(
                "Obéissance à distance",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Apprenez à donner des ordres clairs à distance pour un contrôle total de votre chien. Cette technique vous permettra d'améliorer la communication même lorsque vous n'êtes pas à proximité immédiate.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              _buildStepCard("Étape 1 : Commencez en intérieur", "Pratiquez dans un environnement sans distraction."),
              _buildStepCard("Étape 2 : Augmentez progressivement la distance", "Déplacez-vous lentement pour renforcer la commande."),
              _buildStepCard("Étape 3 : Récompensez systématiquement", "Utilisez des friandises et des encouragements pour renforcer le comportement."),
              SizedBox(height: 20),
              Text("Conseils et erreurs à éviter", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildAdviceCard("Ne pas répéter la commande", "Soyez constant dans vos signaux et vos récompenses."),
              _buildAdviceCard("Augmenter trop rapidement la distance", "Respectez le rythme d'apprentissage de votre chien."),
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