import 'dart:convert';
import 'package:http/http.dart' as http;

class ImageService {
  static Map<String, String?> _imageCache = {}; // ✅ Mémoire cache des images

  static Future<void> prefetchImages(List<Map<String, dynamic>> raceData) async {
    int imagesTrouvees = 0;

    for (var race in raceData) {
      final raceName = race['name'];
      final imageUrl = race['data']['photo_url'];

      if (_imageCache.containsKey(raceName)) continue;

      String? fetchedImage = await fetchImage(raceName, imageUrl);
      if (fetchedImage != null) {
        imagesTrouvees++;
        _imageCache[raceName] = fetchedImage;
      }
    }

    print("✅ Préchargement terminé: $imagesTrouvees images trouvées !");
  }

  static Future<String?> fetchImage(String raceName, String? imageUrl) async {
    if (_imageCache.containsKey(raceName)) return _imageCache[raceName];

    // Vérifie si l'image est LOCALE ou DISTANTE
    if (imageUrl != null && imageUrl.isNotEmpty) {
      if (!imageUrl.startsWith('http')) {
        print("📌 Image locale détectée : $imageUrl (on l'utilise directement)");
        return imageUrl;
      }

      // Vérifie si l'URL de l'image est valide
      try {
        final response = await http.head(Uri.parse(imageUrl));
        if (response.statusCode == 200) {
          return imageUrl;
        }
      } catch (e) {
        print("❌ Erreur vérification URL image: $e");
      }
    }

    // 🔍 Recherche alternative si l'image de base n'est pas valide
    List<Future<String?>> sources = [
      fetchFromWiki(raceName),
      fetchFromDogApi(raceName),
      fetchFromGoogleSearch(raceName),
      fetchFromBingSearch(raceName),
      fetchFromPixabay(raceName),
      fetchFromUnsplash(raceName),
    ];

    for (var source in sources) {
      try {
        String? image = await source;
        if (image != null) {
          _imageCache[raceName] = image;
          return image;
        }
      } catch (e) {
        print("❌ Erreur récupération image: $e");
      }
    }

    return null;
  }

  static Future<String?> fetchFromWiki(String raceName) async {
    try {
      final response = await http.get(
        Uri.parse('https://en.wikipedia.org/w/api.php?action=query&titles=$raceName&prop=pageimages&format=json&pithumbsize=500'),
      ).timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        var pages = data['query']['pages'];
        var firstPage = pages.values.first;
        if (firstPage.containsKey('thumbnail')) {
          return firstPage['thumbnail']['source'];
        }
      }
    } catch (_) {}
    return null;
  }

  static Future<String?> fetchFromDogApi(String raceName) async {
    try {
      final response = await http.get(
        Uri.parse('https://dog.ceo/api/breed/${raceName.toLowerCase().replaceAll(" ", "/")}/images/random'),
      ).timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['message'];
      }
    } catch (_) {}
    return null;
  }

  static Future<String?> fetchFromGoogleSearch(String raceName) async {
    try {
      final response = await http.get(
        Uri.parse('https://www.googleapis.com/customsearch/v1?q=${Uri.encodeComponent("$raceName dog")}&searchType=image&key=VOTRE_CLE_GOOGLE&cx=VOTRE_ID_CUSTOM_SEARCH'),
      ).timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['items'] != null && data['items'].isNotEmpty) {
          return data['items'][0]['link'];
        }
      }
    } catch (e) {
      print("❌ Erreur Google Search: $e");
    }
    return null;
  }

  static Future<String?> fetchFromBingSearch(String raceName) async {
    try {
      final response = await http.get(
        Uri.parse('https://api.bing.microsoft.com/v7.0/images/search?q=${Uri.encodeComponent("$raceName dog")}&count=1'),
        headers: {'Ocp-Apim-Subscription-Key': 'VOTRE_CLE_BING'},
      ).timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['value'] != null && data['value'].isNotEmpty) {
          return data['value'][0]['contentUrl'];
        }
      }
    } catch (e) {
      print("❌ Erreur Bing Search: $e");
    }
    return null;
  }

  static Future<String?> fetchFromPixabay(String raceName) async {
    try {
      final response = await http.get(
        Uri.parse('https://pixabay.com/api/?key=VOTRE_CLE_PIXABAY&q=${Uri.encodeComponent("$raceName dog")}&image_type=photo'),
      ).timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['hits'] != null && data['hits'].isNotEmpty) {
          return data['hits'][0]['largeImageURL'];
        }
      }
    } catch (e) {
      print("❌ Erreur Pixabay: $e");
    }
    return null;
  }

  static Future<String?> fetchFromUnsplash(String raceName) async {
    try {
      final response = await http.get(
        Uri.parse('https://api.unsplash.com/search/photos?query=${Uri.encodeComponent("$raceName dog")}&client_id=VOTRE_CLE_UNSPLASH'),
      ).timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['results'] != null && data['results'].isNotEmpty) {
          return data['results'][0]['urls']['regular'];
        }
      }
    } catch (e) {
      print("❌ Erreur Unsplash: $e");
    }
    return null;
  }
}