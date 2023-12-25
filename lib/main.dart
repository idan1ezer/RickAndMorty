import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/characters/presentation/bloc/character/remote/remote_character_bloc.dart';
import 'package:rick_and_morty/features/characters/presentation/bloc/character/remote/remote_character_event.dart';
import 'package:rick_and_morty/injection_container.dart';

import 'config/theme/app_themes.dart';
import 'features/characters/presentation/pages/characters_screen.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteCharacterBloc>(
      create: (context) => sl()..add(const GetCharacters()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: const CharacterScreen(),
      ),
    );
  }
}

