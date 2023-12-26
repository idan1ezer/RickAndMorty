import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../domain/entities/character.dart';


class CharacterWidget extends StatelessWidget {
  final CharacterEntity? character;
  final bool? isRemovable;
  final void Function(CharacterEntity character)? onRemove;
  final void Function(CharacterEntity character)? onCharacterPressed;

  const CharacterWidget({
    Key ? key,
    this.character,
    this.onCharacterPressed,
    this.isRemovable = false,
    this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      // onTap: _onTap,
      child: Container(
        padding: const EdgeInsetsDirectional.only(start: 14, end: 14, bottom: 7, top: 7),
        height: MediaQuery
            .of(context)
            .size
            .width / 2.2,
        child: Row(
          children: [
            _buildImage(context),
            _buildTitleAndDescription(),
            // _buildRemovableArea(),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: character!.imageUrl!,
        imageBuilder: (context, imageProvider) =>
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 14),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 3,
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.08),
                      image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover
                      )
                  ),
                ),
              ),
            ),
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 14),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 3,
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.08),
                  ),
                  child: const CupertinoActivityIndicator(),
                ),
              ),
            ),
        errorWidget: (context, url, error) =>
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 14),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 3,
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.08),
                  ),
                  child: const Icon(Icons.error),
                ),
              ),
            )
    );
  }

  Widget _buildTitleAndDescription() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              character!.name ?? '',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontFamily: 'Butler',
                fontWeight: FontWeight.w900,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),

            // Description
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  character!.status ?? '',
                  maxLines: 2,
                ),
              ),
            ),

            // Datetime
            Row(
              children: [
                const Icon(Icons.timeline_outlined, size: 16),
                const SizedBox(width: 4),
                Text(
                  character!.origin!,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}