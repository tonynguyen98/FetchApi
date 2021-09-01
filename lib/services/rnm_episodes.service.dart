import 'dart:convert';

import 'package:api_fetch/models/rnm_episodes.model.dart';
import 'package:http/http.dart' as http;

class RnmEpisodeService {
  static Future<List<RnmEpisodeModel>> fetchRnmEpiodes() async {
    final response =
        await http.get(Uri.parse('https://rickandmortyapi.com/api/episode'));

    if (response.statusCode == 200) {
      final dynamic body = json.decode(response.body);
      return List<RnmEpisodeModel>.from(
        body['results'].map(
          (rnmEpisode) => RnmEpisodeModel.fromJson(rnmEpisode),
        ),
      );
    } else {
      throw Exception('Failed to load Rick and Morty Episodes');
    }
  }
}
