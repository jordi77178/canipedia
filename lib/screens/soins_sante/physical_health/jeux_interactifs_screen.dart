import 'package:flutter/material.dart';

class JeuxInteractifsScreen extends StatelessWidget {
  final TextStyle _titleStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  final TextStyle _sectionTitleStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle _textStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Jeux interactifs")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/soins/tircorde.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text("Jeux interactifs", style: _titleStyle),
              SizedBox(height: 10),
              Text(
                "Les jeux interactifs renforcent le lien entre vous et votre chien tout en stimulant son intelligence. Ils permettent également de dépenser son énergie de manière ludique.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Avantages", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Amélioration de la réactivité, développement des compétences cognitives et renforcement du lien social.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Conseils pratiques", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Variez les jeux et assurez-vous que l’activité reste amusante pour éviter la frustration.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Erreurs à éviter", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Évitez les jeux trop exigeants physiquement ou mentalement, qui pourraient décourager votre chien.",
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