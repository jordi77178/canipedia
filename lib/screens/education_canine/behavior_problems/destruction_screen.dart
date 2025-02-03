import 'package:flutter/material.dart';

class DestructionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Destruction de meubles")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/education/meuble.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),

              // 📝 Pourquoi un chien détruit ?
              Text("Pourquoi mon chien détruit-il tout ?", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text(
                "La destruction chez le chien peut avoir plusieurs origines : "
                    "l’ennui, l’anxiété de séparation, le manque d’exercice, le stress ou un besoin de mastication.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              // 📌 Causes de la destruction
              Text("Les principales causes de destruction", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildCauseCard("🛑 Ennui", "Un chien qui s’ennuie va chercher à se distraire en mâchant."),
              _buildCauseCard("🚪 Anxiété de séparation", "Un chien stressé par l’absence de son maître peut exprimer son anxiété en détruisant."),
              _buildCauseCard("🏃‍♂️ Manque d’exercice", "Un chien qui ne dépense pas assez d’énergie va compenser en mâchant."),
              _buildCauseCard("🦷 Besoin naturel de mastication", "Certains chiens ont un instinct fort de mastication, surtout en période de croissance."),
              _buildCauseCard("⚡ Stress et frustration", "Un chien peut détruire s’il est stressé par un environnement bruyant ou instable."),
              SizedBox(height: 20),

              // ✅ Solutions pour stopper la destruction
              Text("Solutions efficaces", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildSolutionCard("✅ Lutter contre l’ennui", "Augmentez la stimulation mentale et physique du chien."),
              _buildSolutionCard("✅ Des jouets adaptés", "Proposez des jouets à mâcher, type Kong rempli."),
              _buildSolutionCard("✅ Gestion de l’anxiété", "Apprenez au chien à rester seul progressivement."),
              _buildSolutionCard("✅ Limiter l’accès", "Restreignez l’accès aux objets destructibles."),
              _buildSolutionCard("✅ Éducation positive", "Renforcez les bons comportements avec des récompenses."),
              _buildSolutionCard("✅ L’importance de l’exercice", "Un chien bien dépensé est un chien calme."),
              _buildSolutionCard("✅ Désensibilisation progressive", "Habituez votre chien à être seul progressivement."),
              SizedBox(height: 20),

              // 🚨 Que faire si le chien continue ?
              Text("Que faire si le chien continue de détruire ?", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildAdviceCard("📌 Ne pas punir après coup", "Si vous trouvez un meuble détruit en rentrant, ne punissez pas votre chien, il ne comprendra pas."),
              _buildAdviceCard("📌 Renforcer les bonnes habitudes", "Récompensez systématiquement le calme et l’usage des jouets à mâcher."),
              _buildAdviceCard("📌 Consultez un éducateur canin", "Si le problème persiste, une consultation avec un professionnel peut être bénéfique."),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // 📌 Widget pour afficher une cause
  Widget _buildCauseCard(String title, String description) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(Icons.warning, color: Colors.orange),
        title: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text(description, style: TextStyle(fontSize: 16)),
      ),
    );
  }

  // ✅ Widget pour afficher une solution
  Widget _buildSolutionCard(String title, String description) {
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
}