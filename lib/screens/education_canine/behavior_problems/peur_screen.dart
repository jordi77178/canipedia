import 'package:flutter/material.dart';

class PeurScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Peur et anxiété chez le chien")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 🖼️ Image principale
              Image.asset("assets/images/education/peur.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),

              // 📝 Pourquoi un chien peut-il être anxieux ?
              Text("Pourquoi mon chien a-t-il peur ?", style: _titleStyle),
              SizedBox(height: 10),
              Text(
                "L’anxiété canine peut être causée par un manque de socialisation, un traumatisme, "
                    "une mauvaise expérience passée ou un hyper-attachement au maître. "
                    "Il est essentiel d’en identifier la cause pour mieux la traiter.",
                style: _textStyle,
              ),
              SizedBox(height: 20),

              // 📌 Causes de l’anxiété
              Text("Les principales causes d’anxiété", style: _titleStyle),
              SizedBox(height: 10),
              _buildCauseCard("🎆 Bruits forts", "Feux d’artifice, orages et klaxons peuvent terroriser certains chiens."),
              _buildCauseCard("🐶 Peur des autres chiens", "Un chien mal socialisé peut craindre la rencontre avec ses congénères."),
              _buildCauseCard("🏡 Anxiété de séparation", "Certains chiens paniquent quand ils restent seuls."),
              _buildCauseCard("😨 Expériences traumatisantes", "Un passé douloureux peut expliquer certaines peurs."),
              _buildCauseCard("🦷 Douleur ou maladie", "Un problème médical non détecté peut rendre un chien anxieux."),
              SizedBox(height: 20),

              // ✅ Solutions pratiques
              Text("Méthodes pour aider un chien anxieux", style: _titleStyle),
              SizedBox(height: 10),
              _buildSolutionCard("✅ Désensibilisation progressive", "Exposez-le progressivement à ses peurs en restant calme."),
              _buildSolutionCard("✅ Rassurer sans surprotéger", "Ne renforcez pas sa peur en le consolant excessivement."),
              _buildSolutionCard("✅ Diffuseurs apaisants", "Les phéromones ou une musique douce peuvent l’aider."),
              _buildSolutionCard("✅ Séances d’éducation positive", "Travaillez avec un éducateur canin pour renforcer sa confiance."),
              _buildSolutionCard("✅ Jouets interactifs", "Occuper son esprit peut l’aider à se détendre."),
              SizedBox(height: 20),

              // 🚨 Erreurs à éviter
              Text("Les erreurs à ne pas commettre", style: _titleStyle),
              SizedBox(height: 10),
              _buildAdviceCard("📌 Ne pas forcer un chien apeuré", "Le contraindre pourrait aggraver son stress."),
              _buildAdviceCard("📌 Ne pas gronder un chien craintif", "Cela ne ferait qu’augmenter son anxiété."),
              _buildAdviceCard("📌 Éviter les situations traumatisantes", "Une mauvaise expérience peut renforcer sa peur."),
              _buildAdviceCard("📌 Ne pas négliger l’exercice", "Un chien bien dépensé est souvent plus serein."),
              SizedBox(height: 20),

              // 📊 Tableau des signes d’anxiété
              Text("Signes d’anxiété chez le chien", style: _titleStyle),
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

  // 📊 Tableau des signes d’anxiété
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
            _buildTableRow("Signe", "Explication", isHeader: true),
            _buildTableRow("🐾 Halètement excessif", "Un chien anxieux respire plus vite."),
            _buildTableRow("😟 Tremblements", "Peut être un signe de peur ou de stress."),
            _buildTableRow("🐶 Fuite ou repli sur soi", "Un chien craintif essaie d’échapper à la situation."),
            _buildTableRow("🐕 Aboiements excessifs", "Il essaie d’exprimer son malaise."),
            _buildTableRow("🦴 Léchage excessif", "Un chien stressé peut se lécher compulsivement."),
            _buildTableRow("🏡 Dégradations en absence", "Signe possible d’anxiété de séparation."),
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