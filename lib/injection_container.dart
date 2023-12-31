import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/features/characters/data/data_sources/remote/characters_api_service.dart';
import 'package:rick_and_morty/features/characters/domain/repositories/character_repository.dart';
import 'package:rick_and_morty/features/characters/data/repositories/character_repository_impl.dart';
import 'package:rick_and_morty/features/characters/domain/usecases/get_all_characters.dart';
import 'package:rick_and_morty/features/characters/presentation/bloc/character/remote/remote_character_bloc.dart';
import 'package:rick_and_morty/features/characters/presentation/bloc/character/remote/remote_character_event.dart';
import 'package:rick_and_morty/features/episodes/data/data_sources/remote/episodes_api_service.dart';
import 'package:rick_and_morty/features/episodes/domain/repositories/episode_repository.dart';
import 'package:rick_and_morty/features/episodes/domain/usecases/get_all_episodes.dart';
import 'package:rick_and_morty/features/episodes/presentation/bloc/episode/remote/remote_episode_bloc.dart';
import 'features/characters/domain/usecases/get_single_character.dart';
import 'features/episodes/data/repositories/episode_repository_impl.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  // Characters
  sl.registerSingleton<CharacterRemoteDataSource>(CharacterRemoteDataSource(sl()));
  sl.registerSingleton<CharacterRepository>(CharacterRepositoryImpl(sl()));
  // Episodes
  sl.registerSingleton<EpisodeRemoteDataSource>(EpisodeRemoteDataSource(sl()));
  sl.registerSingleton<EpisodeRepository>(EpisodeRepositoryImpl(sl()));

  // UseCases
  // Characters
  sl.registerSingleton<GetAllCharactersUseCase>(GetAllCharactersUseCase(sl()));
  sl.registerSingleton<GetSingleCharacterUseCase>(GetSingleCharacterUseCase(sl()));
  // Episodes
  sl.registerSingleton<GetAllEpisodesUseCase>(GetAllEpisodesUseCase(sl()));

  // Blocs
  // Characters
  sl.registerFactory<RemoteCharacterBloc>(() => RemoteCharacterBloc(sl(),sl()));
  // Episodes
  sl.registerFactory<RemoteEpisodesBloc>(() => RemoteEpisodesBloc(sl()));
}
