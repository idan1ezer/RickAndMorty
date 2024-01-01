import 'package:floor/floor.dart';
import 'package:rick_and_morty/features/characters/domain/entities/character.dart';

@Entity(tableName: 'character', primaryKeys: ['id'])
class CharacterModel extends CharacterEntity {
  final String? location;

  // final List<String>? episodes;
  final String? episodes;
  final String? createdAt;

  const CharacterModel({
    required int? id,
    required String? name,
    required String? status,
    required String? species,
    required String? type,
    required String? gender,
    required String? origin,
    required String? imageUrl,
    this.location,
    this.episodes,
    this.createdAt,
  }) : super(
          id: id,
          name: name,
          status: status,
          species: species,
          type: type,
          gender: gender,
          origin: origin,
          imageUrl: imageUrl,
        );

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    String episodesToList = json['episode'].toString();
    episodesToList.substring(1, episodesToList.length - 1);
    return CharacterModel(
      id: json['id'] ?? -1,
      name: json['name'] ?? "Unknown",
      status: json['status'] ?? "Unknown",
      species: json['species'] ?? "Unknown",
      type: json['type'] ?? "Unknown",
      gender: json['gender'] ?? "Unknown",
      origin: json['origin']['name'] ?? "Unknown",
      location: json['location']['name'] ?? "Unknown",
      imageUrl: json['image'] ?? "",
      // episodes: episodesToList.split(', '),
      episodes: episodesToList,
      createdAt: json['created'] ?? "",
    );
  }

  CharacterEntity toEntity() => CharacterEntity(
        id: id,
        name: name,
        status: status,
        species: species,
        type: type,
        gender: gender,
        origin: origin,
        imageUrl: imageUrl,
      );

  factory CharacterModel.fromEntity(CharacterEntity entity) {
    return CharacterModel(
      id: entity.id,
      name: entity.name,
      status: entity.status,
      species: entity.species,
      type: entity.type,
      gender: entity.gender,
      origin: entity.origin,
      imageUrl: entity.imageUrl,
    );
  }
}
