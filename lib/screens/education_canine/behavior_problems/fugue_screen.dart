import 'package:flutter/material.dart';

class FugueScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fugues et désobéissance")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 🖼️ Image principale
              Image.asset("assets/images/education/fugue.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),

              // 📝 Pourquoi un chien fugue-t-il ?
              Text("Pourquoi mon chien fugue ?", style: _titleStyle),
              SizedBox(height: 10),
              Text(
                "Un chien peut fuguer pour diverses raisons : instinct de chasse, manque de stimulation, "
                    "peur, anxiété de séparation ou encore un territoire mal sécurisé. "
                    "Comprendre la cause est essentiel pour mettre en place une solution efficace.",
                style: _textStyle,
              ),
              SizedBox(height: 20),

              // 📌 Causes des fugues
              Text("Les principales causes des fugues", style: _titleStyle),
              SizedBox(height: 10),
              _buildCauseCard("🏃 Manque d’exercice", "Un chien qui ne se dépense pas suffisamment cherchera à explorer ailleurs."),
              _buildCauseCard("🐕 Instinct de chasse", "Les chiens de chasse peuvent être attirés par une odeur ou un animal."),
              _buildCauseCard("😨 Peur ou stress", "Un chien peut fuir en cas de peur soudaine (feux d’artifice, bruit fort)."),
              _buildCauseCard("🏡 Problème territorial", "Certains chiens cherchent à élargir leur territoire."),
              _buildCauseCard("💔 Anxiété de séparation", "Un chien attaché à son maître peut fuguer pour le retrouver."),
              SizedBox(height: 20),

              // ✅ Solutions pour éviter la fugue
              Text("Méthodes pour éviter les fugues", style: _titleStyle),
              SizedBox(height: 10),
              _buildSolutionCard("✅ Sécuriser l’environnement", "Clôturez bien votre jardin et évitez les échappatoires."),
              _buildSolutionCard("✅ Augmenter l’exercice", "Un chien qui se dépense est moins tenté de fuguer."),
              _buildSolutionCard("✅ Entraîner le rappel", "Un bon rappel est essentiel pour éviter les fugues."),
              _buildSolutionCard("✅ Eviter les punitions", "Le rappel doit être systématiquement positif."),
              _buildSolutionCard("✅ Surveiller l’état émotionnel", "Un chien anxieux doit être rassuré et occupé."),
              SizedBox(height: 20),

              // 🚨 Erreurs à éviter
              Text("Les erreurs à ne pas commettre", style: _titleStyle),
              SizedBox(height: 10),
              _buildAdviceCard("📌 Punir après une fugue", "Votre chien associera votre retour à une punition."),
              _buildAdviceCard("📌 Négliger la stimulation mentale", "Un chien intelligent doit être occupé."),
              _buildAdviceCard("📌 Laisser un chien sans surveillance", "Surtout en extérieur sans clôture."),
              _buildAdviceCard("📌 Attendre trop longtemps pour le rappel", "L’entraînement doit être constant et progressif."),
              SizedBox(height: 20),

              // 📊 Tableau des techniques de rappel
              Text("Techniques de rappel efficace", style: _titleStyle),
              SizedBox(height: 10),
              _buildTable(),

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
        title: Text(title, style: _boldTextStyle),
        subtitle: Text(description, style: _textStyle),
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
        title: Text(title, style: _boldTextStyle),
        subtitle: Text(description, style: _textStyle),
      ),
    );
  }

  // 🚨 Widget pour afficher une erreur courante
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

  // 📊 Tableau des techniques de rappel
  Widget _buildTable() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Table(
          border: TableBorder.all(color: Colors.grey.shade300),
          columnWidths: {
            0: FlexColumnWidth(2),
            1: FlexColumnWidth(3),
          },
          children: [
            _buildTableRow("Technique", "Description", isHeader: true),
            _buildTableRow("🎯 Rappel positif", "Associez le rappel à une récompense systématique."),
            _buildTableRow("🐶 Jeu de cache-cache", "Cachez-vous et appelez votre chien pour renforcer le rappel."),
            _buildTableRow("🔊 Signal unique", "Utilisez toujours le même mot ou sifflet pour rappeler."),
            _buildTableRow("🏃‍♂️ Courir à l’opposé", "Faites semblant de partir pour inciter le chien à suivre."),
            _buildTableRow("🦴 Récompenses variées", "Alternez friandises, caresses et jeux pour motiver."),
          ],
        ),
      ),
    );
  }

  TableRow _buildTableRow(String cell1, String cell2, {bool isHeader = false}) {
    return TableRow(
      decoration: BoxDecoration(color: isHeader ? Colors.blue.shade100 : Colors.transparent),
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(cell1, style: isHeader ? _boldTextStyle : _textStyle),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(cell2, style: isHeader ? _boldTextStyle : _textStyle),
        ),
      ],
    );
  }

  // 🎨 Styles de texte
  final TextStyle _titleStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  final TextStyle _boldTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle _textStyle = TextStyle(fontSize: 16);
}