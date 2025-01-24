class Dog {
  final String name; // ✅ Ajout du nom de la race (clé du JSON)
  final List<String> flags; // ✅ Déjà une liste, mais peut être null
  final String wikiUrl;
  final String origin;
  final int tailleMin;
  final int tailleMax;
  final int poidsMin;
  final int poidsMax;
  final int esperanceVie;
  final List<String> couleurs;
  final String groupe;
  final String description;
  final String photoUrl;
  final String histoire;
  final String caractere;
  final String utilite;
  final String niveauActivite;
  final String entretien;
  final String sante;

  Dog({
    required this.name,  // ✅ On stocke le nom de la race
    required this.wikiUrl,
    required this.flags,
    required this.origin,
    required this.tailleMin,
    required this.tailleMax,
    required this.poidsMin,
    required this.poidsMax,
    required this.esperanceVie,
    required this.couleurs,
    required this.groupe,
    required this.description,
    required this.photoUrl,
    required this.histoire,
    required this.caractere,
    required this.utilite,
    required this.niveauActivite,
    required this.entretien,
    required this.sante,
  });

  factory Dog.fromJson(String name, Map<String, dynamic> json) {
    return Dog(
      name: name, // ✅ Utilisation de la clé JSON comme nom de la race
      wikiUrl: json['wiki_url'],
      flags: (json['drapeau'] as String?)?.split(',').map((e) => e.trim()).toList() ?? [],
      origin: json['origine'],
      tailleMin: (json['taille_min'] as num).toInt(),
      tailleMax: (json['taille_max'] as num).toInt(),
      poidsMin: (json['poids_min'] as num).toInt(),
      poidsMax: (json['poids_max'] as num).toInt(),
      esperanceVie: (json['esperance_vie'] as num).toInt(),
      couleurs: List<String>.from(json['couleurs']),
      groupe: json['groupe'],
      description: json['description'],
      photoUrl: json['photo_url'],
      histoire: json['histoire'],
      caractere: json['caractere'],
      utilite: json['utilite'],
      niveauActivite: json['niveau_d_activite'],
      entretien: json['entretien'],
      sante: json['sante'],
    );
  }
}