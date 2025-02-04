import 'package:flutter/material.dart';

class BainFrequenceScreen extends StatelessWidget {
  // Définition des styles de texte
  final TextStyle _titleStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  final TextStyle _subtitleStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle _textStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bain & Fréquence")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image principale
              Image.asset("assets/images/soins/bain.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              // Introduction
              Text("Bain & Fréquence", style: _titleStyle),
              SizedBox(height: 10),
              Text(
                "Le bain est une étape importante pour maintenir l'hygiène de votre chien. Cependant, il est crucial de ne pas altérer les huiles naturelles qui protègent sa peau.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              // Avantages
              Text("Avantages d'un bain régulier", style: _subtitleStyle),
              SizedBox(height: 10),
              Text(
                "Un bain bien dosé élimine les saletés et les parasites, tout en préservant les huiles protectrices. Il aide également à prévenir les infections cutanées.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              // Fréquence recommandée
              Text("Fréquence recommandée", style: _subtitleStyle),
              SizedBox(height: 10),
              Text(
                "Il est généralement recommandé de donner un bain à votre chien une fois par mois. Cette fréquence peut varier selon le type de pelage et l'activité de votre chien.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              // Conseils pratiques
              Text("Conseils pratiques", style: _subtitleStyle),
              SizedBox(height: 10),
              Text(
                "Utilisez des produits adaptés aux chiens et veillez à bien rincer pour éviter toute irritation. Séchez soigneusement votre animal pour éviter l'humidité prolongée.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              // Erreurs à éviter
              Text("Erreurs à éviter", style: _subtitleStyle),
              SizedBox(height: 10),
              Text(
                "Un bain trop fréquent peut dépouiller la peau des huiles naturelles et causer des problèmes dermatologiques. Évitez également d'utiliser des produits inadaptés ou agressifs.",
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