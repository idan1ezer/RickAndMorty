import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/character.dart';

abstract class RemoteCharacterState extends Equatable {
  final List<CharacterEntity>? characters;
  final DioException? exception;

  const RemoteCharacterState({this.characters, this.exception});

  @override
  List<Object> get props => [characters!, exception!];
}

class RemoteCharacterLoading extends RemoteCharacterState {
  const RemoteCharacterLoading();
}

class RemoteCharacterDone extends RemoteCharacterState {
  const RemoteCharacterDone(List<CharacterEntity> characters) : super (characters: characters);
}

class RemoteCharacterException extends RemoteCharacterState {
  const RemoteCharacterException(DioException exception) : super (exception: exception);
}