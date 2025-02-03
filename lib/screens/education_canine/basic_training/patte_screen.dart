import 'package:flutter/material.dart';

class DonnePatte extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Apprendre à Donner la Patte")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 🖼️ Image principale
              Image.asset("assets/images/education/patte.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),

              // 📝 Pourquoi apprendre à donner la patte ?
              Text("Pourquoi apprendre à donner la patte ?", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text(
                "Donner la patte est un exercice amusant et utile qui renforce la complicité entre le maître et son chien. "
                    "Cet exercice favorise l’obéissance et peut être utilisé pour des soins comme le nettoyage des pattes.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              // ✅ Étapes de l'entraînement
              Text("Étapes pour apprendre à donner la patte", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildStepCard("📍 Étape 1 : Préparer des friandises", "Utilisez de petites friandises appétissantes pour motiver votre chien."),
              _buildStepCard("🖐️ Étape 2 : Faire asseoir votre chien", "Demandez-lui de s’asseoir pour qu’il soit en position stable."),
              _buildStepCard("🐾 Étape 3 : Toucher légèrement sa patte", "Touchez délicatement sa patte avant de lui donner une friandise."),
              _buildStepCard("🔄 Étape 4 : Associer un mot-clé", "Dites 'Donne la patte' à chaque fois que vous touchez sa patte."),
              _buildStepCard("🏆 Étape 5 : Récompenser et répéter", "Lorsqu’il lève la patte, donnez-lui une friandise et répétez l’exercice."),

              SizedBox(height: 20),

              // 🚨 Les erreurs à éviter
              Text("Les erreurs à éviter", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildAdviceCard("📌 Forcer la patte", "Ne soulevez pas violemment sa patte, il doit le faire de lui-même."),
              _buildAdviceCard("📌 Être impatient", "Chaque chien apprend à son rythme, soyez patient et encouragez-le."),
              _buildAdviceCard("📌 Ne pas utiliser de récompenses", "Au début, utilisez toujours des friandises pour renforcer le comportement."),

              SizedBox(height: 20),

              // 🐶 Variations et défis
              Text("Variations et défis avancés", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildChallengeCard("🤝 Apprendre à donner l’autre patte", "Une fois la première patte maîtrisée, entraînez-le à donner l’autre."),
              _buildChallengeCard("🎩 Faire un 'check' ou un 'high five'", "Levez votre main plus haut pour lui apprendre à taper dedans."),
              _buildChallengeCard("🎭 Associer un geste", "Ajoutez un geste avec la main pour qu’il comprenne sans mot-clé."),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // ✅ Widget pour afficher une étape
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

  // 🚨 Widget pour afficher un conseil important
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

  // 🏆 Widget pour afficher un défi avancé
  Widget _buildChallengeCard(String title, String description) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(Icons.star, color: Colors.orange),
        title: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text(description, style: TextStyle(fontSize: 16)),
      ),
    );
  }
}