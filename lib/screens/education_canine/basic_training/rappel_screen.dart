import 'package:flutter/material.dart';

class RappelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Apprendre le Rappel")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/education/rappel.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),

              Text("Pourquoi apprendre le Rappel ?", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text(
                "Le rappel est essentiel pour la sécurité de votre chien et son autonomie. "
                    "Un bon rappel vous permet de le laisser en liberté sans danger.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              Text("Étapes pour apprendre le Rappel", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildStepCard("📍 Étape 1 : Commencez dans un endroit calme", "Appelez votre chien d’une voix joyeuse et montrez-lui une friandise."),
              _buildStepCard("🐕 Étape 2 : Ajoutez une laisse longue", "Utilisez une longe pour qu’il puisse venir vers vous sans s’éloigner trop."),
              _buildStepCard("🎯 Étape 3 : Récompensez immédiatement", "Dès qu’il revient, donnez-lui une friandise et félicitez-le."),
              _buildStepCard("🔁 Étape 4 : Augmentez progressivement la distance", "Travaillez en extérieur en ajoutant des distractions petit à petit."),

              SizedBox(height: 20),

              Text("Les erreurs à éviter", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildAdviceCard("📌 Ne pas punir à l’arrivée", "Ne grondez jamais un chien qui revient, même s’il a mis du temps."),
              _buildAdviceCard("📌 Être trop monotone", "Le rappel doit toujours être joyeux et motivant."),
              _buildAdviceCard("📌 Ne pas être progressif", "Ne commencez pas directement en extérieur avec distractions."),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepCard(String title, String description) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(Icons.check_circle, color: Colors.green),
        title: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text(description, style: TextStyle(fontSize: 16)),
      ),
    );
  }

  Widget _buildAdviceCard(String title, String description) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(Icons.error_outline, color: Colors.red),
        title: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text(description, style: TextStyle(fontSize: 16)),
      ),
    );
  }
}