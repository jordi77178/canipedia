import 'package:flutter/material.dart';
import 'package:country_flags/country_flags.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/dog.dart';
import '/screens/utils/webview_screen.dart';

class DogDetailsScreen extends StatelessWidget {
  final Dog dog;

  const DogDetailsScreen({required this.dog, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(dog.name)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🖼️ Image principale
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(dog.photoUrl, height: 250, width: double.infinity, fit: BoxFit.cover),
            ),
            SizedBox(height: 20),

            // 🌍 Pays d'origine avec drapeaux
            _buildFlagRow(),
            SizedBox(height: 10),

            // 📖 Description
            _buildCard("Description", dog.description, Icons.info),

            // 📏 Taille
            _buildCard("Taille", "${dog.tailleMin} cm - ${dog.tailleMax} cm", Icons.height),

            // ⚖️ Poids
            _buildCard("Poids", "${dog.poidsMin} kg - ${dog.poidsMax} kg", Icons.fitness_center),

            // ⏳ Espérance de vie
            _buildCard("Espérance de vie", "${dog.esperanceVie} ans", Icons.favorite),

            // 🎨 Couleurs
            _buildCard("Couleurs", dog.couleurs.join(", "), Icons.palette),

            // 📚 Histoire
            _buildCard("Histoire", dog.histoire, Icons.history),

            // 🧠 Caractère
            _buildCard("Caractère", dog.caractere, Icons.psychology),

            // 🎯 Utilité
            _buildCard("Utilité", dog.utilite, Icons.handyman),

            // 🏃‍♂️ Niveau d'activité
            _buildCard("Niveau d'activité", dog.niveauActivite, Icons.directions_run),

            // ✂️ Entretien
            _buildCard("Entretien", dog.entretien, Icons.cut),

            // 🏥 Santé
            _buildCard("Santé", dog.sante, Icons.local_hospital),

            // 🎬 Apparitions médiatiques

            // 🔗 Lien Wikipedia
            _buildWikiCard(context),
          ],
        ),
      ),
    );
  }

  // 🌍 Drapeaux
  Widget _buildFlagRow() {
    return Wrap(
      spacing: 8,
      children: dog.flags.map((flag) {
        return CountryFlag.fromCountryCode(flag.toUpperCase(), height: 30, width: 45);
      }).toList(),
    );
  }

  // 📖 Cartes d'information
  Widget _buildCard(String title, String content, IconData icon) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text(content, style: TextStyle(fontSize: 16)),
      ),
    );
  }

  // 🎬 Apparitions médiatiques

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }


  // 🔗 Lien Wikipedia
  Widget _buildWikiCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebViewScreen(url: dog.wikiUrl),
          ),
        );
      },
      child: Card(
        color: Colors.blue.shade50,
        elevation: 5,
        margin: EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          leading: Icon(Icons.link, color: Colors.blue),
          title: Text("Voir sur Wikipedia", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
          trailing: Icon(Icons.open_in_new, color: Colors.blue),
        ),
      ),
    );
  }}