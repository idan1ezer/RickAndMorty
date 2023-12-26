import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/episodes/domain/entities/episode.dart';

class EpisodeWidget extends StatefulWidget {
  // const EpisodeWidget({super.key, this.episode, this.isLiked});
  const EpisodeWidget({super.key, this.episode});

  final EpisodeEntity? episode;
  // final bool? isLiked;

  @override
  State<EpisodeWidget> createState() => _EpisodeWidgetState();
}

class _EpisodeWidgetState extends State<EpisodeWidget> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("${widget.episode!.episode} - ${widget.episode!.name}"),
      subtitle: Text("${widget.episode!.airDate}"),
      // trailing: Icon(isLiked ? Icons.favorite_rounded : Icons.favorite_border_rounded),
      trailing: IconButton(
        icon: Icon(isLiked ? Icons.favorite_rounded : Icons.favorite_border_rounded, color: Colors.red,),
        onPressed: () => setState(() {
          isLiked = !isLiked;
        }),
      ),
    );
  }

}