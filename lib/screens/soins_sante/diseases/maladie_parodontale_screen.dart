import 'package:flutter/material.dart';

class MaladieParodontaleScreen extends StatelessWidget {
  final TextStyle _titleStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  final TextStyle _sectionTitleStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle _textStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Maladie parodontale")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/soins/parodontale.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text("Maladie parodontale", style: _titleStyle),
              SizedBox(height: 10),
              Text(
                "La maladie parodontale est due à l'accumulation de tartre qui provoque gingivite et, à terme, la perte des dents.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Symptômes", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Mauvaise haleine, saignements, gencives enflées et mobilité des dents.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Traitement", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Un nettoyage dentaire professionnel ainsi qu'une hygiène bucco-dentaire régulière à la maison sont indispensables.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Conseils pratiques", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Brossez régulièrement les dents de votre chien et effectuez des contrôles réguliers chez le vétérinaire.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Erreurs à éviter", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Ne négligez pas l'hygiène dentaire et évitez les aliments sucrés qui favorisent la formation de plaque.",
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