import 'package:flutter/material.dart';

class CoucheScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Apprendre le Couché")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/education/couche.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),

              // 📝 Pourquoi apprendre "Couché" ?
              Text("Pourquoi apprendre le Couché ?", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text(
                "L’ordre 'Couché' aide à calmer un chien excité et à améliorer son obéissance. "
                    "C'est aussi une base pour d'autres commandes comme 'Pas bouger'.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              // 📌 Étapes de l'apprentissage
              Text("Étapes pour apprendre le Couché", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildStepCard("📍 Étape 1 : Assurez-vous qu’il soit assis", "Commencez l’exercice avec votre chien en position assise."),
              _buildStepCard("⬇️ Étape 2 : Guidez avec une friandise", "Tenez une friandise devant son nez et descendez-la lentement vers le sol."),
              _buildStepCard("✅ Étape 3 : Récompensez dès qu’il s’allonge", "Dès que ses coudes touchent le sol, donnez-lui la friandise en disant 'Couché'."),
              _buildStepCard("🔁 Étape 4 : Répétez l’exercice", "Faites plusieurs sessions courtes et positives."),

              SizedBox(height: 20),

              // 🚨 Erreurs à éviter
              Text("Les erreurs à éviter", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildAdviceCard("📌 Ne pas forcer", "Ne poussez pas votre chien au sol, il doit comprendre de lui-même."),
              _buildAdviceCard("📌 Être impatient", "Certains chiens prennent plus de temps que d’autres."),
              _buildAdviceCard("📌 Ne pas récompenser correctement", "Soyez clair et systématique avec les récompenses."),

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