import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/characters/domain/entities/character.dart';
import 'package:rick_and_morty/features/characters/presentation/bloc/character/remote/remote_character_bloc.dart';
import 'package:rick_and_morty/features/characters/presentation/bloc/character/remote/remote_character_event.dart';

import '../../../../injection_container.dart';
import '../bloc/character/remote/remote_character_state.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final CharacterEntity? character;

  const CharacterDetailsScreen({Key? key, this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteCharacterBloc>(
      create: (context) => sl()..add(GetSingleCharacter(character!)),
      child: Scaffold(
        appBar: _buildAppbar(context),
        body: _buildCharacterDetail(),
      ),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (context) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _onBackButtonTapped(context),
          child: const Icon(Icons.chevron_left, color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildCharacterDetail() {
    return Column(
      children: [
        // Title
        Text(
          character!.name!,
          style: const TextStyle(fontFamily: 'Butler', fontSize: 24, fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.maxFinite,
          height: 400,
          margin: const EdgeInsets.only(top: 8),
          child: Image.network(character!.imageUrl!, fit: BoxFit.cover),
        ),
        const SizedBox(height: 14),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Status
              Row(
                children: [
                  const Icon(Icons.monitor_heart, size: 16),
                  const SizedBox(width: 6),
                  Text(
                    "Status: ${character!.status!}",
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Origin
              Row(
                children: [
                  const Icon(Icons.trip_origin, size: 16),
                  const SizedBox(width: 6),
                  Text(
                    "Origin: ${character!.origin!}",
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Species
              Row(
                children: [
                  const Icon(Icons.merge_type, size: 16),
                  const SizedBox(width: 6),
                  Text(
                    "Species: ${character!.species!}",
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Gender
              Row(
                children: [
                  const Icon(Icons.person, size: 16),
                  const SizedBox(width: 6),
                  Text(
                    "Gender: ${character!.gender!}",
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ],
    );
  }

  void _onBackButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }
}
