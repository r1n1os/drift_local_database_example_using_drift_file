import 'package:drift/drift.dart';
import 'package:drift_local_database_example/data/local_database/app_database.dart';

class SongEntity {
  int? id;
  String? name;
  int? duration;
  int? artistId;

  SongEntity({this.id, this.name, this.duration, this.artistId});

  SongCompanion toCompanion() {
    return SongCompanion(
        id: Value(id ?? -1),
        name: Value(name ?? ''),
        duration: Value(duration ?? 0),
        artistId: Value(artistId ?? 0)
    );
  }

  static Future<void> saveSingleSongEntity(SongEntity songEntity) async {
    AppDatabase db = AppDatabase();
    await db.into(db.song).insertOnConflictUpdate(songEntity.toCompanion());
  }

  static Future<void> saveListOfSongsEntity(
      List<SongEntity> songEntityList) async {
    await Future.forEach(songEntityList, (songEntity) {
      saveSingleSongEntity(songEntity);
    });
  }

  static Future<SongEntity?> convertTableToEntity(SongTable? songTable) async {
    if(songTable != null) {
      return SongEntity(
          id: songTable.id,
          name: songTable.name,
          duration: songTable.duration,
          artistId: songTable.artistId);
    } else {
      return null;
    }
  }

  static Future<List<SongEntity>> queryAllSongs() async {
    AppDatabase db = AppDatabase();
    List<SongEntity> songEntityList = [];
    List<SongTable> songTableList = await db.select(db.song).get();
    await Future.forEach(songTableList, (songTable) async {
      SongEntity? tempSongEntity = await convertTableToEntity(songTable);
      if(tempSongEntity != null) {
        songEntityList.add(tempSongEntity);
      }
    });
    return songEntityList;
  }

  static Future<SongEntity?> querySongById(int songId) async {
    AppDatabase db = AppDatabase();
    SongTable? songTable =
    await (db.select(db.song)..where((tbl) => tbl.id.equals(songId))).getSingleOrNull();
    return convertTableToEntity(songTable);
  }

  static Future<List<SongEntity>> queryListOfSongsByArtistId(int artistId) async {
    AppDatabase db = AppDatabase();
    List<SongEntity> songEntityList = [];
    List<SongTable>? songTableList =
    await (db.select(db.song)..where((tbl) => tbl.artistId.equals(artistId))).get();
    await Future.forEach(songTableList, (songTable) async {
      SongEntity? tempSongEntity = await convertTableToEntity(songTable);
      if(tempSongEntity != null) {
        songEntityList.add(tempSongEntity);
      }
    });
    return songEntityList;
  }
}
