import 'package:flutter/material.dart';

class AboiementsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gérer les aboiements excessifs")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 🖼️ Image principale
              Image.asset("assets/images/education/aboiement.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),

              // 📌 Introduction
              Text("Pourquoi mon chien aboie-t-il trop ?", style: _titleStyle),
              SizedBox(height: 10),
              Text(
                "Les aboiements sont un mode de communication naturel chez le chien. Toutefois, certains aboiements peuvent devenir problématiques : stress, ennui, peur ou excitation excessive. Comprendre la cause est essentiel pour trouver la bonne solution.",
                style: _textStyle,
              ),
              SizedBox(height: 20),

              // 🔥 Types d’aboiements avec solutions adaptées
              Text("Types d’aboiements et solutions adaptées", style: _titleStyle),
              SizedBox(height: 10),
              _buildBarkingType(
                "🛑 Aboiements d’ennui",
                "Un chien qui s’ennuie cherche à évacuer son énergie par l’aboiement.",
                "✔ Augmentez les balades et le temps de jeu.",
                "✔ Proposez des jouets interactifs et des activités mentales.",
                "✔ Instaurez un emploi du temps stable.",
                "Exemple : Un chien seul toute la journée aboie sans arrêt. Offrez-lui un Kong rempli de nourriture pour l’occuper.",
              ),
              _buildBarkingType(
                "🚨 Aboiements liés aux bruits",
                "Certains chiens aboient dès qu’ils perçoivent un bruit inhabituel.",
                "✔ Désensibilisez-le aux bruits en augmentant leur fréquence progressive.",
                "✔ Enseignez-lui à se calmer sur commande.",
                "✔ Récompensez les moments de silence.",
                "Exemple : Si votre chien aboie à chaque passage devant la maison, détournez son attention avec un jeu ou une récompense.",
              ),

              _buildBarkingType(
                "🐶 Aboiements pour attirer l’attention",
                "Le chien a appris que l’aboiement lui apporte une interaction.",
                "✔ Ignorez totalement les aboiements d’attention.",
                "✔ Récompensez les comportements calmes.",
                "✔ Apprenez-lui un signal de silence.",
                "Exemple : Si votre chien aboie pour demander une friandise, attendez qu’il se taise avant de lui donner.",
              ),
              _buildBarkingType(
                  "🚨 Aboiement d’alerte",
                  "Votre chien aboie lorsqu’il entend un bruit inconnu ou qu’un étranger approche.",
                  "✔ Enseignez un ordre 'Stop' ou 'Silence' en récompensant le calme.\n",
                      "✔ Désensibilisez-le aux bruits en lui faisant écouter progressivement des enregistrements.\n",
                      "✔ Ignorez les fausses alertes pour éviter qu’il associe l’aboiement à une réaction de votre part.",
                  "Exemple : Si votre chien aboie à la sonnette, demandez-lui de s’asseoir et récompensez-le lorsqu’il se tait.",
              ),

              _buildBarkingType(
                  "😨 Aboiement par anxiété",
                  "Un chien stressé peut aboyer excessivement lorsqu’il est seul ou dans un nouvel environnement.",
                  "✔ Habituez-le à rester seul progressivement avec des exercices de courte durée.\n",
                      "✔ Laissez-lui un jouet interactif ou un vêtement avec votre odeur pour le rassurer.\n",
                      "✔ Travaillez la désensibilisation en simulant des départs sans le stresser.",
                  "Exemple : Si votre chien aboie dès que vous partez, commencez par de courtes absences et augmentez progressivement.",
              ),
              _buildBarkingType(
                  "⚕️ Aboiement lié à un problème médical",
                  "Certains chiens aboient à cause d’un inconfort ou d’une douleur.",
                  "✔ Consultez un vétérinaire si votre chien aboie sans raison apparente.\n",
                      "✔ Vérifiez son alimentation et son activité physique pour prévenir les douleurs articulaires.\n",
                      "✔ Adaptez son environnement pour qu’il se sente à l’aise et en sécurité.",
                  "Exemple : Un chien âgé qui aboie excessivement peut souffrir de troubles cognitifs ou de douleurs articulaires.",
              ),
              SizedBox(height: 20),
// ✅ Plan d'action complet pour réduire les aboiements
              Text("Plan d’action détaillé pour diminuer les aboiements", style: _titleStyle),
              SizedBox(height: 10),
              _buildPlanAction("🎯 Étape 1 : Identifier la cause",
                  "Observez les situations où votre chien aboie pour comprendre ce qui le déclenche."),
              _buildPlanAction("🔄 Étape 2 : Ne pas renforcer l’aboiement",
                  "Évitez de lui répondre ou de lui donner ce qu’il veut lorsqu’il aboie."),
              _buildPlanAction("🏆 Étape 3 : Récompenser le calme",
                  "Dès qu’il arrête d’aboyer, félicitez-le et donnez-lui une friandise."),
              _buildPlanAction("🧩 Étape 4 : Utiliser des exercices de désensibilisation",
                  "Exposez-le progressivement à ses déclencheurs pour lui apprendre à ne pas réagir."),
              _buildPlanAction("🕰️ Étape 5 : Lui apprendre un ordre de contrôle",
                  "Utilisez un mot comme 'Silence' et associez-le à une récompense lorsqu’il se tait."),
              SizedBox(height: 20),



              // 🚨 Erreurs à éviter
              Text("Les erreurs à éviter", style: _titleStyle),
              SizedBox(height: 10),
              _buildAdviceCard("📌 Crier sur le chien", "Cela peut être perçu comme une interaction et aggraver le problème."),
              _buildAdviceCard("📌 Punir après l’aboiement", "Le chien ne comprend pas pourquoi il est puni si la correction n’est pas immédiate."),
              _buildAdviceCard("📌 Récompenser involontairement", "Donner de l’attention à un chien qui aboie peut renforcer ce comportement."),
              SizedBox(height: 20),

            ],
          ),
        ),
      ),

    );


  }

  // 📌 Widget pour afficher un type d’aboiement avec solutions et exemple
  Widget _buildBarkingType(String title, String description, String solution1, String solution2, String solution3, String example) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        leading: Icon(Icons.volume_up, color: Colors.blue),
        title: Text(title, style: _boldTextStyle),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(description, style: _textStyle),
                SizedBox(height: 10),
                Text("🔹 Solutions :", style: _boldTextStyle),
                Text("• $solution1\n• $solution2\n• $solution3", style: _textStyle),
                SizedBox(height: 10),
                Text("📝 Exemple :", style: _boldTextStyle),
                Text(example, style: _textStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 📌 Widget pour afficher chaque étape du plan d’action
  Widget _buildPlanAction(String title, String description) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(Icons.task_alt, color: Colors.green),
        title: Text(title, style: _boldTextStyle),
        subtitle: Text(description, style: _textStyle),
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
        title: Text(title, style: _boldTextStyle),
        subtitle: Text(description, style: _textStyle),
      ),
    );
  }




  // 🎨 Styles de texte
  final TextStyle _titleStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  final TextStyle _boldTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle _textStyle = TextStyle(fontSize: 16);
}