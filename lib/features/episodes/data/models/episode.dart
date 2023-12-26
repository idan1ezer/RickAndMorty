import 'package:rick_and_morty/features/episodes/domain/entities/episode.dart';

class EpisodeModel extends EpisodeEntity {
  final String? url;
  final String? createdAt;

  const EpisodeModel({
    required int? id,
    required String? name,
    required String? airDate,
    required String? episode,
    required List<String>? characters,
    this.url,
    this.createdAt,
  }) : super(
          id: id,
          name: name,
          airDate: airDate,
          episode: episode,
          characters: characters,
        );

  factory EpisodeModel.fromJson(Map<String, dynamic> json) {
    String charactersToList = json['characters'].toString();
    charactersToList.substring(1, charactersToList.length - 1);
    return EpisodeModel(
      id: json['id'] ?? -1,
      name: json['name'] ?? "Unknown",
      airDate: json['airDate'] ?? "Unknown",
      episode: json['episode'] ?? "Unknown",
      characters: charactersToList.split(', '),
    );
  }

  EpisodeEntity toEntity() => EpisodeEntity(
        id: id,
        name: name,
        airDate: airDate,
        episode: episode,
        characters: characters,
      );
}
