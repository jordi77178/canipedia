import 'package:flutter/material.dart';

class LaisseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Apprendre la marche en laisse")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/education/laisse.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),

              Text("Pourquoi apprendre la marche en laisse ?", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text(
                "Marcher calmement en laisse est essentiel pour des promenades agréables. "
                    "Un chien qui tire peut se blesser et rendre la balade stressante pour le maître.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              Text("Étapes pour apprendre la marche en laisse", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildStepCard("📍 Étape 1 : Choisir une bonne laisse et un harnais", "Optez pour une laisse courte et un harnais adapté."),
              _buildStepCard("🐕 Étape 2 : Commencer dans un endroit calme", "Avant d’aller en extérieur, entraînez-le à marcher à côté de vous à la maison."),
              _buildStepCard("✅ Étape 3 : Récompenser la bonne position", "Dès qu’il marche sans tirer, donnez-lui une friandise ou félicitez-le."),
              _buildStepCard("🔄 Étape 4 : Stopper dès qu’il tire", "Si le chien tire, arrêtez-vous immédiatement et attendez qu’il se détende avant de continuer."),
              _buildStepCard("🔁 Étape 5 : Répéter et progresser", "Augmentez progressivement la durée des promenades en ajoutant des distractions."),

              SizedBox(height: 20),

              Text("Les erreurs à éviter", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildAdviceCard("📌 Ne pas tirer sur la laisse", "Cela peut causer du stress et inciter le chien à tirer encore plus."),
              _buildAdviceCard("📌 Être impatient", "L’apprentissage de la marche en laisse demande du temps."),
              _buildAdviceCard("📌 Récompenser quand il tire", "Ne laissez pas le chien avancer s’il tire, cela renforce le mauvais comportement."),

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