import 'package:flutter/material.dart';
import '../services/image_service.dart';
import 'detail_race_screen.dart'; // ✅ Ajout de l’import


class EncyclopedieScreen extends StatefulWidget {
  final List<Map<String, dynamic>> raceData;

  EncyclopedieScreen({required this.raceData});

  @override
  _EncyclopedieScreenState createState() => _EncyclopedieScreenState();
}

class _EncyclopedieScreenState extends State<EncyclopedieScreen> {
  Map<String, String?> imagesCache = {}; // ✅ Stocke les images en cache pour éviter les rechargements

  @override
  void initState() {
    super.initState();
    prefetchImages();
  }

  void prefetchImages() async {
    for (var race in widget.raceData) {
      final raceName = race['name'];
      final imageUrl = race['data']['photo_url'];
      imagesCache[raceName] = await ImageService.fetchImage(raceName, imageUrl);
    }
    setState(() {}); // ✅ Mise à jour de l'UI après le chargement des images
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Encyclopédie des Chiens'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: ListView.builder(
        itemCount: widget.raceData.length,
        itemBuilder: (context, index) {
          final race = widget.raceData[index];
          final raceName = race['name'];
          final imageUrl = imagesCache[raceName];

          return Card(
            margin: EdgeInsets.all(10),
            elevation: 5,
            child: ListTile(
              leading: imageUrl == null
                  ? CircularProgressIndicator() // 🔄 Chargement
                  : Image.network(imageUrl, width: 60, height: 60, fit: BoxFit.cover, errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.image_not_supported, color: Colors.red);
              }),
              title: Text(raceName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailRaceScreen(race: race),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}