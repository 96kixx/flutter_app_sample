import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/detail_model.dart';
import 'package:toonflix/models/episode_model.dart';
import 'package:toonflix/models/toon_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<ToonModel>> getTodaysToons() async {
    List<ToonModel> webtoonInstances = [];
    final url = Uri.parse("$baseUrl/$today");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webtoonInstances.add(ToonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    } else {
      throw Error();
    }
  }

  static Future<DetailModel> getToonById(String id) async {
    final url = Uri.parse("$baseUrl/$id");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return DetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<EpisodeModel>> getEpisodeById(String id) async {
    List<EpisodeModel> episodeInstances = [];
    final url = Uri.parse("$baseUrl/$id/episodes");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        episodeInstances.add(EpisodeModel.fromJson(episode));
      }
      return episodeInstances;
    }
    throw Error();
  }
}
