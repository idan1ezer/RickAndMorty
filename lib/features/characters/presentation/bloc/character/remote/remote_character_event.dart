import 'package:rick_and_morty/features/characters/domain/entities/character.dart';

abstract class RemoteCharacterEvent {
  final CharacterEntity? character;
  const RemoteCharacterEvent({this.character});
}

class GetCharacters extends RemoteCharacterEvent {
  const GetCharacters();
}

class GetSingleCharacter extends RemoteCharacterEvent {
  const GetSingleCharacter(CharacterEntity character) : super(character: character);
}