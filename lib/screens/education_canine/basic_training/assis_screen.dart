import 'package:flutter/material.dart';

class AssisScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Apprendre le Assis")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/education/patte.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),

              // 📝 Pourquoi apprendre "Assis" ?
              Text("Pourquoi apprendre le Assis ?", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text(
                "Le 'Assis' est un ordre fondamental qui permet de canaliser l’énergie de votre chien "
                    "et de lui apprendre à écouter calmement avant d'obtenir quelque chose.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              // 📌 Étapes de l'apprentissage
              Text("Étapes pour apprendre le Assis", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildStepCard("📍 Étape 1 : Attirer son attention", "Montrez une friandise et placez-la devant son nez."),
              _buildStepCard("⬇️ Étape 2 : Guider vers l'assis", "Levez lentement la friandise au-dessus de sa tête jusqu’à ce qu'il s'assoie."),
              _buildStepCard("✅ Étape 3 : Récompenser", "Dès qu'il s'assoit, dites 'Assis' et donnez-lui la friandise."),
              _buildStepCard("🔁 Étape 4 : Répéter", "Répétez plusieurs fois et réduisez progressivement les friandises."),

              SizedBox(height: 20),

              // 🚨 Erreurs à éviter
              Text("Les erreurs à éviter", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildAdviceCard("📌 Forcer le chien à s'asseoir", "Ne poussez pas son arrière-train, laissez-le comprendre par lui-même."),
              _buildAdviceCard("📌 Manquer de patience", "Certains chiens apprennent plus vite que d’autres, soyez patient."),
              _buildAdviceCard("📌 Ne pas être cohérent", "Utilisez toujours le même mot et le même ton pour l’ordre."),

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