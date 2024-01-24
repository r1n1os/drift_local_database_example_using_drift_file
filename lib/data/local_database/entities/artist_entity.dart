import 'package:drift/drift.dart';
import 'package:drift_local_database_example/data/local_database/app_database.dart';
import 'package:drift_local_database_example/data/local_database/entities/song_entity.dart';

class ArtistEntity {
  int? id;
  String? name;
  int? age;
  String? musicStyle;
  List<SongEntity>? songEntityList;

  ArtistEntity(
      {this.id, this.name, this.age, this.musicStyle, this.songEntityList});

  ArtistEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
    musicStyle = json['music_style'];
    if (json['songs'] != null) {
      songEntityList = SongEntity.fromJsonArray(json['songs']);
    }
  }

  static Future<List<ArtistEntity>> fromJsonArray(List jsonArray) async {
    return jsonArray.map((value) => ArtistEntity.fromJson(value)).toList();
  }

  ArtistCompanion toCompanion() {
    return ArtistCompanion(
        id: Value(id ?? -1),
        name: Value(name ?? ''),
        musicStyle: Value(musicStyle ?? ''),
        age: Value(age ?? 0));
  }

  static Future<void> saveSingleArtistEntity(ArtistEntity artistEntity) async {
    AppDatabase db = AppDatabase.instance();
    await db.into(db.artist).insertOnConflictUpdate(artistEntity.toCompanion());
    if (artistEntity.songEntityList != null) {
      await SongEntity.saveListOfSongsEntity(artistEntity.songEntityList ?? []);
    }
  }

  static Future<void> saveListOfArtistEntity(
      List<ArtistEntity> artistEntityList) async {
    await Future.forEach(artistEntityList, (artistEntity) async {
      await saveSingleArtistEntity(artistEntity);
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
    AppDatabase db = AppDatabase.instance();
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
    AppDatabase db = AppDatabase.instance();
    ArtistTable? artistTable = await (db.select(db.artist)
          ..where((tbl) => tbl.id.equals(artistId)))
        .getSingleOrNull();
    return convertTableToEntity(artistTable);
  }
}
