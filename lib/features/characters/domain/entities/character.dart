import 'package:equatable/equatable.dart';

class CharacterEntity extends Equatable {
  final int? id;
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final String? origin;
  final String? imageUrl;

  const CharacterEntity({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.imageUrl,
  });

  @override
  List<Object?> get props {
    return [
      id,
      name,
      status,
      species,
      type,
      gender,
      origin,
      imageUrl,
    ];
  }
}
