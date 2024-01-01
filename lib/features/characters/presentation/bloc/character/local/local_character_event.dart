import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/features/characters/domain/entities/character.dart';

abstract class LocalCharacterEvent extends Equatable{
  final CharacterEntity? character;
  const LocalCharacterEvent({this.character});

  @override
  List<Object> get props => [character!];
}


class GetSavedCharacters extends LocalCharacterEvent {
  const GetSavedCharacters();
}

class RemoveCharacter extends LocalCharacterEvent {
  const RemoveCharacter(CharacterEntity character) : super(character: character);
}

class SaveCharacter extends LocalCharacterEvent {
  const SaveCharacter(CharacterEntity character) : super(character: character);
}