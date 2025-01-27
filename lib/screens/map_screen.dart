import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../models/dog.dart';
import 'dog_details_screen.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Map<String, LatLng> countryCoordinates = {
    "France": LatLng(46.603354, 1.888334),
    "Belgique": LatLng(50.850346, 4.351721),
    "États-Unis": LatLng(37.09024, -95.712891),
    "USA": LatLng(37.09024, -95.712891),
    "Canada": LatLng(56.130366, -106.346771),
    "Royaume-Uni": LatLng(55.378051, -3.435973),
    "Thaïlande": LatLng(15.870032, 100.992541),
    "Chine": LatLng(35.86166, 104.195397),
    "Allemagne": LatLng(51.165691, 10.451526),
    "Italie": LatLng(41.87194, 12.56738),
    "Espagne": LatLng(40.463667, -3.74922),
    "Portugal": LatLng(39.399872, -8.224454),
    "Japon": LatLng(36.204824, 138.252924),
    "Russie": LatLng(61.52401, 105.318756),
    "Suisse": LatLng(46.818188, 8.227512),
    "Suède": LatLng(60.128161, 18.643501),
    "Finlande": LatLng(61.92411, 25.748151),
    "Irlande": LatLng(53.41291, -8.24389),
    "Argentine": LatLng(-38.416097, -63.616672),
    "Australie": LatLng(-25.274398, 133.775136),
    "Autriche": LatLng(47.516231, 14.550072),
    "Brésil": LatLng(-14.235004, -51.92528),
    "Croatie": LatLng(45.1, 15.2),
    "Danemark": LatLng(56.26392, 9.501785),
    "Écosse": LatLng(56.490671, -4.202646),
    "Hongrie": LatLng(47.162494, 19.503304),
    "Inde": LatLng(20.593684, 78.96288),
    "Islande": LatLng(64.963051, -19.020835),
    "Mexique": LatLng(23.634501, -102.552784),
    "Norvège": LatLng(60.472024, 8.468946),
    "Pays-Bas": LatLng(52.132633, 5.291266),
    "Pologne": LatLng(51.919438, 19.145136),
    "République Tchèque": LatLng(49.817492, 15.472962),
    "Serbie": LatLng(44.016521, 21.005859),
    "Slovaquie": LatLng(48.669026, 19.699024),
    "Slovénie": LatLng(46.151241, 14.995463),
    "Afrique du Sud": LatLng(-30.559482, 22.937506),
    "Ukraine": LatLng(48.379433, 31.16558),
    "Vietnam": LatLng(14.058324, 108.277199),
    "Yémen": LatLng(15.552727, 48.516388),
    "Roumanie": LatLng(45.9432, 24.9668),
    "Taïwan": LatLng(23.6978, 120.9605),
    "Corée du Nord": LatLng(40.3399, 127.5101),
    "Bosnie-Herzégovine": LatLng(43.9159, 17.6791),
    "Guatemala": LatLng(15.7835, -90.2308),
    "Kazakhstan": LatLng(48.0196, 66.9237),
    "Afghanistan": LatLng(33.9391, 67.7100),
    "Tibet": LatLng(30.1534, 88.7879),
    "Israël": LatLng(31.0461, 34.8516),
    "Groenland": LatLng(71.7069, -42.6043),
    "Colombie": LatLng(4.5709, -74.2973),
    "Uruguay": LatLng(-32.5228, -55.7658),
    "Cuba": LatLng(21.5218, -77.7812),
    "Madagascar": LatLng(-18.7669, 46.8691),
    "Maroc": LatLng(31.7917, -7.0926),
    "Pérou": LatLng(-9.1899, -75.0152),
    "Mali": LatLng(17.5707, -3.9962),
    "Turquie": LatLng(38.9637, 35.2433),
    "Indonésie": LatLng(-0.7893, 113.9213),
    "Égypte": LatLng(26.8206, 30.8025),
    "Népal": LatLng(28.3949, 84.1240),
    "Corée du Sud": LatLng(35.9078, 127.7669),
    "Estonie": LatLng(58.5953, 25.0136),
    "Russie (Yakoutie)": LatLng(66.7613, 124.1238),
    "États-Unis (Louisiane)": LatLng(30.9843, -91.9623),
    "Tchéquie": LatLng(49.8175, 15.4729),
    "Macédoine du Nord": LatLng(41.6086, 21.7453),
    "République Démocratique du Congo": LatLng(-4.0383, 21.7587),
    "Malte": LatLng(35.8997, 14.5146),
    "Monténégro": LatLng(42.7087, 19.3744),
    "Grèce": LatLng(39.0742, 21.8243),
    "Afrique du Nord": LatLng(26.8206, 15.8033), // Approximation
    "Moyen-Orient": LatLng(29.2985, 42.5512), // Approximation
    "Asie Centrale": LatLng(41.3775, 63.3145)
  };

  Map<String, List<Dog>> dogsByCountry = {};
  List<Marker> markers = [];

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

    // Fonction pour récupérer uniquement le premier pays
    String getFirstCountry(String country) {
      return country.split(RegExp(r' et | / |, '))[0];    }

    for (var entry in data.entries) {
      Dog dog = Dog.fromJson(entry.key, entry.value);
      print("\n🐶 Traitement du chien: ${dog.name}, Origine: ${dog.origin}");

      for (String country in dog.origin.split(", ")) {
        // Correction de la République tchèque
        String updatedCountry = (country == "République tchèque") ? "Tchéquie" : country;

        // Prendre le premier pays si plusieurs sont mentionnés
        updatedCountry = getFirstCountry(updatedCountry);

        if (!countryCoordinates.containsKey(updatedCountry)) {
          print("⚠️ Pays inconnu dans countryCoordinates: $updatedCountry");
          continue;
        }

        tempDogsByCountry.putIfAbsent(updatedCountry, () => []).add(dog);
        print("✅ Ajouté au pays: $updatedCountry");
      }
    }

    setState(() {
      dogsByCountry = tempDogsByCountry;
      _generateMarkers();
    });
  }




  void _generateMarkers() {
    print("\n📍 Génération des marqueurs...");
    markers = dogsByCountry.entries.map((entry) {
      print("📌 Pays: ${entry.key}, Nombre de chiens: ${entry.value.length}");
      return Marker(
        point: countryCoordinates[entry.key]!,
        width: 40,
        height: 40,
        builder: (ctx) => GestureDetector(
          onTap: () {
            print("🖱️ Clic sur ${entry.key}");
            _showDogsModal(entry.key);
          },
          child: Icon(Icons.location_pin, color: Colors.red, size: 40),
        ),
      );
    }).toList();
  }

  void _showDogsModal(String country) {
    print("📖 Affichage des chiens pour $country");
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (context, scrollController) {
            return Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    "Races de chiens en $country",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: dogsByCountry[country]?.length ?? 0,
                      itemBuilder: (context, index) {
                        final dog = dogsByCountry[country]![index];
                        print("🐕 ${dog.name} affiché");
                        return ListTile(
                          leading: SizedBox(
                            width: 50,
                            height: 50,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(dog.photoUrl, fit: BoxFit.cover),
                            ),
                          ),
                          title: Text(dog.name),
                          onTap: () {
                            Navigator.pop(context);
                            _goToDogDetail(dog);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _goToDogDetail(Dog dog) {
    print("📜 Navigation vers la fiche de ${dog.name}");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DogDetailsScreen(dog: dog),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Carte des Races")),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              center: LatLng(20, 0),
              zoom: 2.5,
              maxZoom: 6.0,
            ),
            children: [
              TileLayer(
                urlTemplate: "https://{s}.basemaps.cartocdn.com/rastertiles/voyager/{z}/{x}/{y}{r}.png",
                subdomains: ['a', 'b', 'c', 'd'],
                userAgentPackageName: 'com.example.app',
              ),
              MarkerClusterLayerWidget(
                options: MarkerClusterLayerOptions(
                  maxClusterRadius: 60,
                  size: Size(50, 50),
                  markers: markers,
                  builder: (context, markers) => Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue.withOpacity(0.8),
                    ),
                    child: Center(
                      child: Text(
                        markers.length.toString(),
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
