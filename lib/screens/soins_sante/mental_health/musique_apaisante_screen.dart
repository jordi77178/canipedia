import 'package:flutter/material.dart';

class MusiqueApaisanteScreen extends StatelessWidget {
  final TextStyle _titleStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  final TextStyle _sectionTitleStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle _textStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Musique et sons apaisants")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/soins/music.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text("Musique et sons apaisants", style: _titleStyle),
              SizedBox(height: 10),
              Text(
                "La musique relaxante et certains sons apaisants peuvent réduire l'anxiété de votre chien et créer une ambiance sereine.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Avantages", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Réduction du stress, amélioration du sommeil et création d'un environnement calme.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Conseils pratiques", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Testez différentes playlists et ajustez le volume pour trouver le meilleur équilibre.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Erreurs à éviter", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Évitez les sons trop forts ou trop agressifs et ne jouez pas de musique en continu sans pause.",
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