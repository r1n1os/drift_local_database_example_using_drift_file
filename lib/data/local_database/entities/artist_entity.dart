import 'package:drift/drift.dart';
import 'package:drift_local_database_example/data/local_database/app_database.dart';
import 'package:drift_local_database_example/data/local_database/entities/song_entity.dart';

/*
class ArtistTable extends Table {
  IntColumn get id => integer()();

  TextColumn? get name => text().nullable()();

  IntColumn? get age => integer().nullable()();

  TextColumn? get musicStyle => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
*/

class ArtistEntity {
  int? id;
  String? name;
  int? age;
  String? musicStyle;
  List<SongEntity>? songEntityList;

  ArtistEntity(
      {this.id, this.name, this.age, this.musicStyle, this.songEntityList});

  ArtistCompanion toCompanion() {
    return ArtistCompanion(
        id: Value(id ?? -1),
        name: Value(name ?? ''),
        musicStyle: Value(musicStyle ?? ''),
        age: Value(age ?? 0));
  }

  static Future<void> saveSingleArtistEntity(ArtistEntity artistEntity) async {
    AppDatabase db = AppDatabase();
    if (artistEntity.songEntityList != null) {
      await SongEntity.saveListOfSongsEntity(artistEntity.songEntityList ?? []);
    }
    await db.into(db.artist).insertOnConflictUpdate(artistEntity.toCompanion());
  }

  static Future<void> saveListOfArtistEntity(
      List<ArtistEntity> artistEntityList) async {
    await Future.forEach(artistEntityList, (artistEntity) {
      saveSingleArtistEntity(artistEntity);
    });
  }

  static Future<ArtistEntity?> convertTableToEntity(
      ArtistTable? artistTable) async {
    if (artistTable != null) {
      List<SongEntity>? songEntityList =
          await SongEntity.queryListOfSongsByArtistId(artistTable.id ?? -1);
      return ArtistEntity(
          id: artistTable.id,
          name: artistTable.name,
          musicStyle: artistTable.musicStyle,
          age: artistTable.age,
          songEntityList: songEntityList);
    } else {
      return null;
    }
  }

  static Future<List<ArtistEntity>> queryAllArtists() async {
    AppDatabase db = AppDatabase();
    List<ArtistEntity> artistEntityList = [];
    List<ArtistTable> artistTableList = await db.select(db.artist).get();
    await Future.forEach(artistTableList, (artistTable) async {
      ArtistEntity? tempArtistEntity = await convertTableToEntity(artistTable);
      if (tempArtistEntity != null) {
        artistEntityList.add(tempArtistEntity);
      }
    });
    return artistEntityList;
  }

  static Future<ArtistEntity?> queryArtistById(int artistId) async {
    AppDatabase db = AppDatabase();
    ArtistTable? artistTable = await (db.select(db.artist)
          ..where((tbl) => tbl.id.equals(artistId)))
        .getSingleOrNull();
    return convertTableToEntity(artistTable);
  }
}
