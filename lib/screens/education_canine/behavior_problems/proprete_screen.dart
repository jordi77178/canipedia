import 'package:flutter/material.dart';

class PropreteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Problèmes de propreté")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 🖼️ Image principale
              Image.asset("assets/images/education/caca.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),

              // 📝 Pourquoi un chien n’est-il pas propre ?
              Text("Pourquoi mon chien n’est-il pas propre ?", style: _titleStyle),
              SizedBox(height: 10),
              Text(
                "Un chien peut avoir des accidents pour diverses raisons : manque d’éducation, "
                    "problème médical, stress ou besoin non satisfait. La patience et une bonne méthode "
                    "sont essentielles pour l’apprentissage de la propreté.",
                style: _textStyle,
              ),
              SizedBox(height: 20),

              // 📌 Causes des accidents urinaires et fécaux
              Text("Les causes fréquentes des accidents", style: _titleStyle),
              SizedBox(height: 10),
              _buildCauseCard("🍼 Chien trop jeune", "Un chiot met du temps à apprendre à se retenir."),
              _buildCauseCard("🚪 Accès limité à l’extérieur", "Un chien doit pouvoir sortir régulièrement."),
              _buildCauseCard("😰 Stress et anxiété", "Les chiens stressés ont souvent des accidents."),
              _buildCauseCard("⚠️ Problème médical", "Une infection urinaire peut provoquer des accidents."),
              _buildCauseCard("👎 Mauvaise méthode éducative", "Punir après coup ne sert à rien et aggrave le problème."),
              SizedBox(height: 20),

              // ✅ Solutions efficaces
              Text("Méthodes pour apprendre la propreté", style: _titleStyle),
              SizedBox(height: 10),
              _buildSolutionCard("✅ Établir une routine stricte", "Sortez votre chien aux mêmes heures chaque jour."),
              _buildSolutionCard("✅ Féliciter et récompenser", "Un chien apprend mieux avec des encouragements et friandises."),
              _buildSolutionCard("✅ Observer les signes d’envie", "Grattement, reniflage ou agitation indiquent un besoin d’élimination."),
              _buildSolutionCard("✅ Utiliser un tapis éducatif", "Idéal pour les chiots ou les chiens en appartement."),
              _buildSolutionCard("✅ Nettoyer avec un produit enzymatique", "Élimine les odeurs sans attirer le chien au même endroit."),
              _buildSolutionCard("✅ Surveiller la santé", "Si les accidents persistent, consultez un vétérinaire."),
              SizedBox(height: 20),

              // 🚨 Erreurs à éviter
              Text("Erreurs courantes à éviter", style: _titleStyle),
              SizedBox(height: 10),
              _buildAdviceCard("📌 Punir après l’accident", "Le chien ne comprendra pas et cela peut créer de la peur."),
              _buildAdviceCard("📌 Nettoyer devant lui", "Il peut assimiler cela à un jeu et recommencer."),
              _buildAdviceCard("📌 Attendre trop longtemps", "Un chiot ne peut pas se retenir plus de quelques heures."),
              _buildAdviceCard("📌 Utiliser de l’eau de Javel", "Cela attire le chien au même endroit."),
              SizedBox(height: 20),

              // 📊 Tableau des temps de retenue des chiots
              Text("Temps de retenue des chiots selon l’âge", style: _titleStyle),
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

  // 📊 Tableau interactif des temps de retenue
  Widget _buildTable() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Table(
          border: TableBorder.all(color: Colors.grey.shade300),
          columnWidths: {
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(2),
          },
          children: [
            _buildTableRow("Âge du chiot", "Durée maximale de retenue", isHeader: true),
            _buildTableRow("2 mois", "2 heures"),
            _buildTableRow("3 mois", "3 heures"),
            _buildTableRow("4 mois", "4 heures"),
            _buildTableRow("5 mois", "5 heures"),
            _buildTableRow("6 mois et +", "6 heures (progressivement)"),
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