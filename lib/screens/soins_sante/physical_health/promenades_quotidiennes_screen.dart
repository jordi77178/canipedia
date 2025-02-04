import 'package:flutter/material.dart';

class PromenadesQuotidiennesScreen extends StatelessWidget {
  final TextStyle _titleStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  final TextStyle _sectionTitleStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle _textStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Promenades quotidiennes")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image principale
              Image.asset("assets/images/soins/promenade.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text("Promenades quotidiennes", style: _titleStyle),
              SizedBox(height: 10),
              Text(
                "Les promenades quotidiennes sont essentielles pour la santé physique et mentale de votre chien. Elles stimulent l'activité physique, favorisent l'exploration et améliorent la socialisation.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Avantages", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Amélioration de la digestion, régulation du poids et stimulation mentale.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Conseils pratiques", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Variez les itinéraires et adaptez la durée en fonction de l'âge et de l'état de santé de votre chien.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Erreurs à éviter", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Ne forcez pas votre chien à marcher au-delà de ses capacités et évitez les promenades sous des conditions extrêmes.",
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