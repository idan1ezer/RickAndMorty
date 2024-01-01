import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/characters/presentation/bloc/character/remote/remote_character_bloc.dart';
import 'package:rick_and_morty/features/characters/presentation/bloc/character/remote/remote_character_event.dart';
import 'package:rick_and_morty/features/episodes/presentation/bloc/episode/remote/remote_episode_bloc.dart';
import 'package:rick_and_morty/features/episodes/presentation/bloc/episode/remote/remote_episode_event.dart';
import 'package:rick_and_morty/features/episodes/presentation/pages/episodes_screen.dart';
import 'package:rick_and_morty/injection_container.dart';

import 'config/routes/app_routes.dart';
import 'config/theme/app_themes.dart';
import 'features/characters/presentation/pages/character_list/characters_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<RemoteCharacterBloc>(
              create: (context) => sl()..add(const GetCharacters()),
          ),
          BlocProvider<RemoteEpisodesBloc>(
            create: (context) => sl()..add(const GetEpisodes()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme(),
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          home: const CharacterScreen(),
        ),
    );
    // return BlocProvider<RemoteCharacterBloc>(
    //   create: (context) => sl()..add(const GetCharacters()),
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     theme: theme(),
    //     home: const CharacterScreen(),
    //   ),
    // );
  }
}

