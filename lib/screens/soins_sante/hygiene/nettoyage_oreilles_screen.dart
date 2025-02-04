import 'package:flutter/material.dart';

class NettoyageOreillesScreen extends StatelessWidget {
  final TextStyle _titleStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  final TextStyle _subtitleStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle _textStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Nettoyage des oreilles")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/soins/soinoreille.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text("Nettoyage des oreilles", style: _titleStyle),
              SizedBox(height: 10),
              Text(
                "Le nettoyage régulier des oreilles permet d'éliminer l'excès de cérumen et de prévenir les otites. Il est important de procéder avec douceur pour éviter toute irritation.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Fréquence recommandée", style: _subtitleStyle),
              SizedBox(height: 10),
              Text(
                "Il est conseillé de nettoyer les oreilles toutes les 2 semaines, en veillant à ne pas insérer d'objet dans le conduit auditif.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Conseils pratiques", style: _subtitleStyle),
              SizedBox(height: 10),
              Text(
                "Utilisez un nettoyant auriculaire formulé pour les chiens. Soyez attentif aux signes d'irritation et arrêtez si votre animal semble inconfortable.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Erreurs à éviter", style: _subtitleStyle),
              SizedBox(height: 10),
              Text(
                "N'utilisez pas de cotons-tiges et évitez de forcer le nettoyage. En cas d'inflammation, consultez un vétérinaire.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}