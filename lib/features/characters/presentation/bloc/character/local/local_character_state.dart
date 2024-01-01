import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/features/characters/domain/entities/character.dart';

abstract class LocalCharacterState extends Equatable {
  final List<CharacterEntity> ? characters;

  const LocalCharacterState({this.characters});

  @override
  List<Object> get props => [characters!];
}

class LocalCharacterLoading extends LocalCharacterState {
  const LocalCharacterLoading();
}

class LocalCharacterDone extends LocalCharacterState {
  const LocalCharacterDone(List<CharacterEntity> characters) : super(characters: characters);
}