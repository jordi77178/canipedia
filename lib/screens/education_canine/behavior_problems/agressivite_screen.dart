import 'package:flutter/material.dart';

class AgressiviteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Comprendre et gérer l'agressivité")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 🖼️ Image principale
              Image.asset("assets/images/education/aggressivite.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),

              // 📌 Introduction
              Text("Pourquoi un chien devient-il agressif ?", style: _titleStyle),
              SizedBox(height: 10),
              Text(
                "L'agressivité canine peut être causée par la peur, la frustration, la défense d'un territoire ou encore un problème médical. \n\n"
                    "Il est essentiel d'identifier la cause pour choisir la bonne méthode d'éducation et éviter les accidents.",
                style: _textStyle,
              ),
              SizedBox(height: 20),

              // 🔥 Types d’agressivité avec solutions adaptées
              Text("Types d'agressivité et solutions adaptées", style: _titleStyle),
              SizedBox(height: 10),
              _buildAggressionType(
                  "😨 Agressivité par peur",
                  "Un chien non socialisé peut attaquer par crainte.",
                  "✔ Habituez-le progressivement aux stimuli stressants.\n"
                      "✔ Ne forcez jamais un chien à affronter directement sa peur.\n"
                      "✔ Associez les nouvelles expériences à des récompenses positives.\n",
                  "Exemple : Votre chien aboie sur les inconnus. Faites-le rencontrer des personnes en douceur avec des friandises."),
              _buildAggressionType(
                  "🏡 Agressivité territoriale",
                  "Certains chiens protègent leur maison de façon excessive.",
                  "✔ Travaillez le contrôle aux entrées de la maison.\n"
                      "✔ Désensibilisez-le à la présence d’invités avec des exercices.\n"
                      "✔ Assurez-vous qu’il ait assez de stimulation mentale et physique.\n",
                  "Exemple : Un chien qui grogne sur le facteur peut apprendre à associer sa venue à quelque chose de positif, comme un jeu ou une récompense."),
              _buildAggressionType(
                  "🥩 Agressivité possessive",
                  "Le chien protège ses ressources (nourriture, jouets).",
                  "✔ Pratiquez les échanges positifs : offrez une friandise lorsqu'il laisse un objet.\n"
                      "✔ Habituez-le dès petit à donner spontanément ses jouets.\n"
                      "✔ Ne retirez pas brutalement un objet de sa gueule, cela renforce la défense.\n",
                  "Exemple : Quand vous approchez pendant qu’il mange, lancez une friandise appétissante pour qu'il associe votre présence à une récompense."),
              _buildAggressionType(
                  "Agressivité maternelle 🍼",
                  "Une chienne peut devenir protectrice envers ses chiots et se montrer agressive si elle perçoit une menace.",
                  "✔ Ne pas toucher les chiots sans que la mère soit rassurée.\n"
                      "✔ Habituer la chienne progressivement à des interactions humaines.\n"
                      "✔ Offrir un environnement calme et sécurisé.\n",
                  "Exemple : Ne pas déranger une chienne qui allaite et lui parler calmement avant d’interagir avec ses chiots."),
              _buildAggressionType(
                  "Agressivité liée à la douleur 🤕",
                  "Un chien blessé ou malade peut devenir agressif par réflexe de défense.",
                  "✔ Manipuler doucement un chien souffrant et consulter un vétérinaire.\n"
                      "✔ Utiliser une muselière si nécessaire pour examiner un chien blessé.\n"
                      ,
                  "Exemple : Un chien qui grogne lorsqu’on touche sa patte peut avoir une blessure invisible."),


              SizedBox(height: 20),

              // 🚨 Erreurs à éviter
              Text("Les erreurs à éviter", style: _titleStyle),
              SizedBox(height: 10),
              _buildAdviceCard("📌 Punir un chien qui grogne", "Un chien qui grogne exprime un malaise. L’empêcher de le faire pourrait le pousser à mordre sans prévenir."),
              _buildAdviceCard("📌 Ignorer les signaux de stress", "Un chien stressé peut bâiller, détourner la tête ou lécher son museau. Si ces signaux sont ignorés, il peut passer à une réaction plus forte."),
              _buildAdviceCard("📌 Forcer une interaction", "Un chien qui ne veut pas être touché ne doit pas être contraint. Respecter ses signaux réduit son stress et son agressivité."),
              SizedBox(height: 20),
              Text("Comment réagir en cas d'agression ?", style: _titleStyle),
              SizedBox(height: 10),
              _buildReactionCard("📌 Rester calme", "Évitez de crier ou de gesticuler. Un chien réagit mieux à une posture détendue."),
              _buildReactionCard("📌 Ne pas fixer dans les yeux", "Le contact visuel direct peut être perçu comme une menace."),
              _buildReactionCard("📌 Ne pas tourner le dos brusquement", "Un chien excité pourrait poursuivre et attaquer."),
              _buildReactionCard("📌 Éviter de courir", "Cela peut déclencher un instinct de poursuite."),
              _buildReactionCard("📌 Se retirer lentement", "Reculez doucement sans mouvement brusque."),
            ],
          ),
        ),
      ),
    );
  }

  // 📌 Widget pour afficher un type d'agressivité avec solutions et exemple
  Widget _buildAggressionType(String title, String description, String solutions, String example) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        leading: Icon(Icons.warning, color: Colors.orange),
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
                Text(solutions, style: _textStyle),
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

  // 🚨 Widget pour afficher une réaction face à une crise
  Widget _buildReactionCard(String title, String description) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(Icons.warning_amber_rounded, color: Colors.deepOrange),
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
