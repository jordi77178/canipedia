// lib/screens/education_canine/puppy_education/proprete_chiot_screen.dart
import 'package:flutter/material.dart';

class PropreteChiotScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Début de la propreté"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/education/propre.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text("Début de la propreté", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text(
                "Découvrez des méthodes douces et efficaces pour apprendre à votre chiot où et quand faire ses besoins. La patience et la cohérence sont essentielles durant cette étape.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text("Étapes recommandées", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildStepCard("Établir une routine", "Définissez des horaires réguliers pour les repas et les sorties."),
              _buildStepCard("Surveiller les signes", "Soyez attentif aux indices indiquant que le chiot doit sortir."),
              _buildStepCard("Récompensez les réussites", "Félicitez et récompensez dès qu'il fait ses besoins au bon endroit."),
              SizedBox(height: 20),
              Text("Conseils et erreurs à éviter", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildAdviceCard("Ne pas punir", "Évitez toute forme de punition qui pourrait créer de la confusion."),
              _buildAdviceCard("Être cohérent", "La régularité est la clé pour un apprentissage réussi."),
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