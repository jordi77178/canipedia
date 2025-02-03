import 'package:flutter/material.dart';

class StayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Apprendre le Pas Bouger")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/education/stay.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),

              Text("Pourquoi apprendre 'Pas Bouger' ?", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text(
                "L’ordre 'Pas Bouger' est utile pour contrôler votre chien à distance. "
                    "Il évite les fugues, renforce l’obéissance et permet une meilleure gestion en extérieur.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              Text("Étapes pour apprendre le Pas Bouger", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildStepCard("📍 Étape 1 : Commencer en position assise ou couchée", "Le chien doit être calme avant de débuter l’exercice."),
              _buildStepCard("🛑 Étape 2 : Dire 'Pas Bouger' avec un geste", "Levez la main devant lui et dites 'Pas bouger' fermement."),
              _buildStepCard("🔄 Étape 3 : Reculer lentement", "Faites un pas en arrière, puis revenez immédiatement et récompensez."),
              _buildStepCard("🐕 Étape 4 : Augmenter la distance", "Ajoutez progressivement plus d’espace entre vous et votre chien."),
              _buildStepCard("⏳ Étape 5 : Ajouter de la durée", "Faites durer le 'Pas bouger' de plus en plus longtemps avant de libérer."),

              SizedBox(height: 20),

              Text("Les erreurs à éviter", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildAdviceCard("📌 Ne pas relâcher trop vite", "Attendez au moins 5 secondes avant de donner la friandise."),
              _buildAdviceCard("📌 Bouger trop vite", "Reculer trop vite peut pousser le chien à vous suivre."),
              _buildAdviceCard("📌 Ne pas utiliser un ordre clair", "Soyez cohérent avec le mot utilisé (ex: 'Pas bouger' et non 'Stop')."),

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