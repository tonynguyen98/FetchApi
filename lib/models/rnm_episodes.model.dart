import 'package:flutter/material.dart';

class RnmEpisodeModel {
  int id;
  String name;
  String airDate;
  String episode;
  List<dynamic> characters;
  String url;
  String created;

  RnmEpisodeModel(
      {@required this.id,
      @required this.name,
      @required this.airDate,
      @required this.episode,
      @required this.characters,
      @required this.url,
      @required this.created});

  factory RnmEpisodeModel.fromJson(Map<String, dynamic> json) {
    return RnmEpisodeModel(
        id: json['id'],
        name: json['name'],
        airDate: json['air_date'],
        episode: json['episode'],
        characters: json['characters'],
        url: json['url'],
        created: json['created']);
  }
}
