import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import '../../../../domain/entities/episode.dart';

abstract class RemoteEpisodeState extends Equatable {
  final List<EpisodeEntity>? episodes;
  final DioException? exception;

  const RemoteEpisodeState({this.episodes, this.exception});

  @override
  List<Object> get props => [episodes!, exception!];
}

class RemoteEpisodeLoading extends RemoteEpisodeState {
  const RemoteEpisodeLoading();
}

class RemoteEpisodeDone extends RemoteEpisodeState {
  const RemoteEpisodeDone(List<EpisodeEntity> episodes) : super (episodes: episodes);
}

class RemoteEpisodeException extends RemoteEpisodeState {
  const RemoteEpisodeException(DioException exception) : super (exception: exception);
}