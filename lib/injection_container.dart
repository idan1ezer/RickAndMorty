import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/features/characters/data/data_sources/remote/characters_api_service.dart';
import 'package:rick_and_morty/features/characters/domain/repositories/character_repository.dart';
import 'package:rick_and_morty/features/characters/data/repositories/character_repository_impl.dart';
import 'package:rick_and_morty/features/characters/domain/usecases/get_all_characters.dart';
import 'package:rick_and_morty/features/characters/presentation/bloc/character/remote/remote_character_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<CharacterRemoteDataSource>(CharacterRemoteDataSource(sl()));
  sl.registerSingleton<CharacterRepository>(CharacterRepositoryImpl(sl()));

  //UseCases
  sl.registerSingleton<GetAllCharactersUseCase>(GetAllCharactersUseCase(sl()));

  //Blocs
  sl.registerFactory<RemoteCharacterBloc>(() => RemoteCharacterBloc(sl()));
}
