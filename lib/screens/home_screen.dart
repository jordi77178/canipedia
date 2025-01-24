import 'package:flutter/material.dart';
import '../services/dog_service.dart';
import '../widgets/dog_card.dart';
import '/models/dog.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Dog>> _dogsFuture;
  List<Dog> _allDogs = [];
  List<Dog> _filteredDogs = [];
  String _searchQuery = '';
  String? _selectedGroup = "Tous les groupes";
  String? _selectedSize;
  final TextEditingController _searchController = TextEditingController();

  final Map<String, String> sizeCategories = {
    "Petits": "Moins de 30 cm",
    "Moyens": "30-50 cm",
    "Grands": "50-70 cm",
    "Très grands": "Plus de 70 cm",
    "Taille inconnue": "Non renseigné"
  };

  @override
  void initState() {
    super.initState();
    _dogsFuture = DogService.loadDogs().then((dogs) {
      setState(() {
        _allDogs = _sortDogs(dogs);
        _filteredDogs = _allDogs;
      });
      return dogs;
    });
  }

  List<Dog> _sortDogs(List<Dog> dogs) {
    return dogs..sort((a, b) => _normalize(a.name).compareTo(_normalize(b.name)));
  }

  String _normalize(String name) {
    return name.toUpperCase().replaceAll(RegExp(r'[ÉÈÊË]'), 'E');
  }

  void _filterDogs() {
    setState(() {
      _filteredDogs = _allDogs.where((dog) {
        final matchesSearch = _normalize(dog.name).contains(_normalize(_searchQuery));
        final matchesGroup = _selectedGroup == "Tous les groupes" || dog.groupe == _selectedGroup;
        final matchesSize = _selectedSize == null || _selectedSize == "Toutes les tailles" || _isSizeMatch(dog, _selectedSize!);

        return matchesSearch && matchesGroup && matchesSize;
      }).toList();
    });
  }

  bool _isSizeMatch(Dog dog, String sizeCategory) {
    if (dog.tailleMin == 0 || dog.tailleMax == 0) return sizeCategory == "Taille inconnue";

    switch (sizeCategory) {
      case "Petits":
        return dog.tailleMax < 30;
      case "Moyens":
        return dog.tailleMin >= 30 && dog.tailleMax <= 50;
      case "Grands":
        return dog.tailleMin >= 50 && dog.tailleMax <= 70;
      case "Très grands":
        return dog.tailleMin > 70;
      default:
        return false;
    }
  }

  void _showFilterModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // ✅ Scrollable pour éviter l’overflow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Filtres", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),

                // Filtre par groupe
                DropdownButtonFormField<String>(
                  value: _selectedGroup,
                  isExpanded: true, // ✅ Évite les débordements horizontaux
                  decoration: InputDecoration(
                    labelText: "Filtrer par groupe",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  items: () {
                    List<String> sortedGroups = _allDogs
                        .map((dog) => dog.groupe)
                        .toSet()
                        .where((group) => group.isNotEmpty)
                        .toList();

                    sortedGroups.sort();

                    return [
                      DropdownMenuItem(
                        value: "Tous les groupes",
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text("Tous les groupes", overflow: TextOverflow.ellipsis),
                        ),
                      ),
                      ...sortedGroups.map((group) => DropdownMenuItem(
                        value: group,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(group, overflow: TextOverflow.ellipsis),
                        ),
                      )),
                    ];
                  }(),
                  onChanged: (value) {
                    setState(() {
                      _selectedGroup = value;
                      _filterDogs();
                    });
                  },
                ),
                SizedBox(height: 20),

                // Filtre par taille
                DropdownButtonFormField<String>(
                  value: _selectedSize,
                  decoration: InputDecoration(
                    labelText: "Filtrer par taille",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  items: [
                    DropdownMenuItem(value: "Toutes les tailles", child: Text("Toutes les tailles")),
                    ...sizeCategories.keys
                        .where((size) => size != "Taille inconnue") // 📌 Supprime "Taille inconnue"
                        .map((size) => DropdownMenuItem(
                      value: size,
                      child: Text(size),
                    )),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedSize = value;
                      _filterDogs();
                    });
                  },
                ),
                SizedBox(height: 20),

                // Bouton Appliquer
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _filterDogs();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  ),
                  child: Text("Appliquer", style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Canipédia"),
        actions: [
          IconButton(
            icon: Icon(Icons.quiz),
            onPressed: () => Navigator.pushNamed(context, '/quiz'),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // 📌 Barre de recherche stylée avec bouton filtre
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Expanded(
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _searchController,
                        onChanged: (query) {
                          _searchQuery = query;
                          _filterDogs();
                        },
                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                          hintText: "Rechercher une race...",
                          hintStyle: TextStyle(color: Colors.grey[500], fontSize: 16),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),

                  // Icône de filtre
                  IconButton(
                    icon: Icon(Icons.filter_list, size: 28, color: Colors.blue),
                    onPressed: _showFilterModal,
                  ),
                ],
              ),
            ),

            Expanded(
              child: FutureBuilder<List<Dog>>(
                future: _dogsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Erreur de chargement des données"));
                  } else if (_filteredDogs.isEmpty) {
                    return Center(child: Text("Aucune race trouvée"));
                  }

                  return ListView.builder(
                    padding: EdgeInsets.only(bottom: 20),
                    itemCount: _filteredDogs.length,
                    itemBuilder: (context, index) {
                      return DogCard(dog: _filteredDogs[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}