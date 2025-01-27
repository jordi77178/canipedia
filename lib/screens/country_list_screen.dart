import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:country_flags/country_flags.dart';
import '../models/dog.dart';
import 'dog_details_screen.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:ui';  // Ajouté pour ImageFilter
import 'package:diacritic/diacritic.dart'; // Pour normaliser les accents


class CountryListScreen extends StatefulWidget {
  @override
  _CountryListScreenState createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {
  Map<String, List<Dog>> dogsByCountry = {};
  String searchQuery = "";


  final Map<String, String> countryCodes = {
    "France": "fr", "Belgique": "be", "États-Unis": "us", "Canada": "ca", "Royaume-Uni": "gb",
    "Allemagne": "de", "Italie": "it", "Espagne": "es", "Portugal": "pt", "Japon": "jp",
    "Russie": "ru", "Suisse": "ch", "Suède": "se", "Finlande": "fi", "Irlande": "ie",
    "Argentine": "ar", "Australie": "au", "Brésil": "br", "Chine": "cn", "Danemark": "dk",
    "Hongrie": "hu", "Mexique": "mx", "Pays-Bas": "nl", "Pologne": "pl", "Tchéquie": "cz",
    "Serbie": "rs", "Afrique du Sud": "za", "Roumanie": "ro", "Israël": "il", "Maroc": "ma",
    "Turquie": "tr", "Thaïlande": "th", "Norvège": "no", "Grèce": "gr", "Mali": "ml",
    "Madagascar": "mg", "République Démocratique du Congo": "cd", "Uruguay": "uy", "Colombie": "co",
    "Cuba": "cu", "Guatemala": "gt", "Kazakhstan": "kz", "Tibet": "cn", "Corée du Sud": "kr",
    "Corée du Nord": "kp", "Arabie Saoudite": "sa", "Émirats Arabes Unis": "ae", "Iran": "ir",
    "Afghanistan": "af", "Nouvelle-Zélande": "nz", "Autriche": "at", "Malte": "mt", "Slovaquie": "sk",
    "Croatie": "hr", "Bosnie-Herzégovine": "ba", "Slovénie": "si", "Monténégro": "me", "Islande": "is",
    "Pérou": "pe", "Asie Centrale": "kz", "Indonésie": "id", "Estonie": "ee", "Égypte": "eg",
    "Népal": "np", "Inde": "in", "États-Unis (Louisiane)": "us", "Taïwan": "tw",
    "Russie (Yakoutie)": "ru", "Groenland": "gl", "Écosse": "gb-sct", "Moyen-Orient": "ae",
    "Macédoine du Nord": "mk", "Afrique du Nord": "dz", "Bosnie-Herzégovine et Croatie": "ba"
  };

  final Map<String, List<String>> continents = {
    "Afrique": ["Afrique du Sud", "Maroc", "Égypte", "Mali", "Madagascar", "République Démocratique du Congo", "Afrique du Nord"],
    "Amérique": ["États-Unis", "Canada", "Brésil", "Argentine", "Uruguay", "Colombie", "Cuba", "Guatemala", "Pérou"],
    "Asie": ["Chine", "Japon", "Corée du Sud", "Corée du Nord", "Thaïlande", "Inde", "Kazakhstan", "Tibet", "Népal", "Taïwan"],
    "Europe": [
      "France", "Belgique", "Allemagne", "Italie", "Espagne", "Royaume-Uni", "Suisse", "Norvège",
      "Autriche", "Malte", "Slovaquie", "Croatie", "Bosnie-Herzégovine", "Slovénie", "Monténégro",
      "Islande", "Estonie", "Tchéquie", "Écosse", "Macédoine du Nord", "Bosnie-Herzégovine et Croatie"
    ],
    "Océanie": ["Australie", "Nouvelle-Zélande"],
    "Moyen-Orient": ["Israël", "Turquie", "Émirats Arabes Unis", "Arabie Saoudite", "Iran", "Afghanistan"]
  };

  @override
  void initState() {
    super.initState();
    _loadDogs();
  }

  Future<void> _loadDogs() async {
    print("📥 Chargement des données JSON...");
    final String response = await rootBundle.loadString('assets/data/bdchiens.json');
    final Map<String, dynamic> data = json.decode(response);
    print("✅ Données chargées avec succès.");

    Map<String, List<Dog>> tempDogsByCountry = {};
    Set<String> missingCountries = {};
    Map<String, List<String>> dogsByMissingCountry = {};

    for (var entry in data.entries) {
      Dog dog = Dog.fromJson(entry.key, entry.value);

      for (String country in dog.origin.split(", ")) {
        // 🔥 Correction automatique des noms de pays
        if (country == "République tchèque") country = "Tchéquie";

        if (!countryCodes.containsKey(country)) {
          missingCountries.add(country);
          dogsByMissingCountry.putIfAbsent(country, () => []).add(dog.name);
          continue;
        }
        tempDogsByCountry.putIfAbsent(country, () => []).add(dog);
      }
    }

    // 🚨 Log des pays non reconnus
    if (missingCountries.isNotEmpty) {
      print("\n🚨 PAYS NON RECONNUS 🚨");
      for (String country in missingCountries) {
        print("❌ $country - Races: ${dogsByMissingCountry[country]?.join(', ')}");
      }
    }

    setState(() {
      dogsByCountry = tempDogsByCountry;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("🌎 Chiens par Pays", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
        backgroundColor: Colors.white,
        elevation: 2,
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              children: continents.entries.map((entry) {
                String continent = entry.key;
                List<String> countries = entry.value
                    .where((c) => dogsByCountry.containsKey(c) && c.toLowerCase().contains(searchQuery.toLowerCase()))
                    .toList()
                  ..sort();

                if (countries.isEmpty) return SizedBox.shrink();

                return _buildContinentSection(continent, countries);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔍 Barre de recherche pour filtrer les pays
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Rechercher un pays...",
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          filled: true,
          fillColor: Colors.grey.shade100,
        ),
        onChanged: (query) => setState(() => searchQuery = query),
      ).animate().fade(duration: 500.ms).slideY(begin: -0.2),
    );
  }

  /// 🗺 Section par continent avec effet de slide
  Widget _buildContinentSection(String continent, List<String> countries) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            continent,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
          ).animate().fade(duration: 600.ms).slideX(begin: -0.2),
        ),
        ...countries.map((country) => _buildCountryCard(country)).toList(),
      ],
    );
  }

  /// 🇫🇷 Carte stylisée pour chaque pays avec animation
  Widget _buildCountryCard(String country) {
    return GestureDetector(
      onTap: () => _showDogsModal(context, country, dogsByCountry),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
          ),
          child: Row(
            children: [
              countryCodes.containsKey(country)
                  ? CountryFlag.fromCountryCode(countryCodes[country]!, height: 40, width: 60, borderRadius: 4)
                  : Icon(Icons.flag, size: 40, color: Colors.grey),
              SizedBox(width: 16),
              Expanded(
                child: Text(
                  country,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black87),
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 20, color: Colors.grey.shade600),
            ],
          ),
        ),
      ),
    ).animate().fade(duration: 1000.ms).slideX(begin: 0.6);
  }

  /// 🐶 Affichage des races disponibles pour un pays
  void _showDogsModal(BuildContext context, String country, Map<String, List<Dog>> dogsByCountry) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent, // Rendu moderne
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.6,
          minChildSize: 0.4,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Effet flou
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 2),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Barre de fermeture
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "🐶 Races en $country",
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            icon: Icon(Icons.close, size: 28, color: Colors.grey[700]),
                            onPressed: () => Navigator.pop(context),
                          ).animate().rotate(duration: 600.ms),
                        ],
                      ),
                      Divider(),
                      SizedBox(height: 10),
                      Expanded(
                        child: ListView.builder(
                          controller: scrollController,
                          itemCount: dogsByCountry[country]?.length ?? 0,
                          itemBuilder: (context, index) {
                            // 🌟 Trie les races par ordre alphabétique en supprimant les accents
                            List<Dog> sortedDogs = (dogsByCountry[country] ?? []).toList()
                              ..sort((a, b) => removeDiacritics(a.name).compareTo(removeDiacritics(b.name)));

                            // ✅ Utilise la liste triée
                            final dog = sortedDogs[index];


                            return GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => DogDetailsScreen(dog: dog)),
                              ),
                              child: Card(
                                elevation: 6,
                                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    gradient: LinearGradient(
                                      colors: [Colors.grey[100]!, Colors.white],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  child: ListTile(
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        dog.photoUrl,
                                        width: 60,
                                        height: 60,
                                        fit: BoxFit.cover,
                                      ),
                                    ).animate().fade(duration: 700.ms).scaleXY(begin: 0.9, end: 1),
                                    title: Text(
                                      dog.name,
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                      dog.origin,
                                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                                    ),
                                    trailing: Icon(Icons.arrow_forward_ios, size: 20, color: Colors.grey),
                                  ),
                                ),
                              ).animate().fade(duration: 500.ms).slideX(begin: 0.1),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );

  }

}
