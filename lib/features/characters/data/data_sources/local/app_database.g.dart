// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorApplicationDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$ApplicationDatabaseBuilder databaseBuilder(String name) =>
      _$ApplicationDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$ApplicationDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$ApplicationDatabaseBuilder(null);
}

class _$ApplicationDatabaseBuilder {
  _$ApplicationDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$ApplicationDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$ApplicationDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<ApplicationDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$ApplicationDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$ApplicationDatabase extends ApplicationDatabase {
  _$ApplicationDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CharacterDao? _characterDAOInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `character` (`location` TEXT, `episodes` TEXT, `createdAt` TEXT, `id` INTEGER, `name` TEXT, `status` TEXT, `species` TEXT, `type` TEXT, `gender` TEXT, `origin` TEXT, `imageUrl` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CharacterDao get characterDAO {
    return _characterDAOInstance ??= _$CharacterDao(database, changeListener);
  }
}

class _$CharacterDao extends CharacterDao {
  _$CharacterDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _characterModelInsertionAdapter = InsertionAdapter(
            database,
            'character',
            (CharacterModel item) => <String, Object?>{
                  'location': item.location,
                  'episodes': item.episodes,
                  'createdAt': item.createdAt,
                  'id': item.id,
                  'name': item.name,
                  'status': item.status,
                  'species': item.species,
                  'type': item.type,
                  'gender': item.gender,
                  'origin': item.origin,
                  'imageUrl': item.imageUrl
                }),
        _characterModelDeletionAdapter = DeletionAdapter(
            database,
            'character',
            ['id'],
            (CharacterModel item) => <String, Object?>{
                  'location': item.location,
                  'episodes': item.episodes,
                  'createdAt': item.createdAt,
                  'id': item.id,
                  'name': item.name,
                  'status': item.status,
                  'species': item.species,
                  'type': item.type,
                  'gender': item.gender,
                  'origin': item.origin,
                  'imageUrl': item.imageUrl
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CharacterModel> _characterModelInsertionAdapter;

  final DeletionAdapter<CharacterModel> _characterModelDeletionAdapter;

  @override
  Future<List<CharacterModel>> getCharacters() async {
    return _queryAdapter.queryList('SELECT * FROM character',
        mapper: (Map<String, Object?> row) => CharacterModel(
            id: row['id'] as int?,
            name: row['name'] as String?,
            status: row['status'] as String?,
            species: row['species'] as String?,
            type: row['type'] as String?,
            gender: row['gender'] as String?,
            origin: row['origin'] as String?,
            imageUrl: row['imageUrl'] as String?,
            location: row['location'] as String?,
            episodes: row['episodes'] as String?,
            createdAt: row['createdAt'] as String?));
  }

  @override
  Future<void> insertCharacter(CharacterModel character) async {
    await _characterModelInsertionAdapter.insert(
        character, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteCharacter(CharacterModel character) async {
    await _characterModelDeletionAdapter.delete(character);
  }
}
