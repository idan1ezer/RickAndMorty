import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/characters/domain/entities/character.dart';
import 'package:rick_and_morty/features/characters/presentation/pages/character_list/characters_screen.dart';
import 'package:rick_and_morty/features/characters/presentation/pages/saved_character/saved_character_screen.dart';

import '../../features/characters/presentation/pages/character_detail/character_detail_screen.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const CharacterScreen());

      case '/CharacterDetails':
        return _materialRoute(CharacterDetailsScreen(character: settings.arguments as CharacterEntity));

      case '/SavedCharacters':
        return _materialRoute(const SavedCharacterScreen());

      default:
        return _materialRoute(const CharacterScreen());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}