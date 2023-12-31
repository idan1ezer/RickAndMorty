import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/characters/domain/entities/character.dart';
import 'package:rick_and_morty/features/characters/presentation/pages/characters_screen.dart';

import '../../features/characters/presentation/pages/character_detail_screen.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const CharacterScreen());

      case '/CharacterDetails':
        return _materialRoute(CharacterDetailsScreen(character: settings.arguments as CharacterEntity));

      default:
        return _materialRoute(const CharacterScreen());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}