import 'package:drift/drift.dart';
import 'package:drift_local_database_example/data/local_database/app_database.dart';

class PlaylistWithSongEntity {
  int? songId;
  int? playlistId;

  PlaylistWithSongEntity({this.songId, this.playlistId});

  PlaylistWithSongCompanion toCompanion() {
    return PlaylistWithSongCompanion(
      songId: Value(songId ?? -1),
      playlistId: Value(playlistId ?? -1),
    );
  }

  static Future<void> saveSinglePlaylistWithSongEntity(PlaylistWithSongEntity playlistWithSongEntity) async {
    AppDatabase db = AppDatabase.instance();
    await db.into(db.playlistWithSong).insertOnConflictUpdate(playlistWithSongEntity.toCompanion());
  }

  static Future<PlaylistWithSongEntity?> convertTableToEntity(
      PlaylistWithSongTable? playlistWithSongTable) async {
    if (playlistWithSongTable != null) {
      return PlaylistWithSongEntity(
          songId: playlistWithSongTable.songId,
          playlistId: playlistWithSongTable.playlistId);
    } else {
      return null;
    }
  }

  static Future<void> cleanRelationshipBasedOnPlaylistId(int playlistId) async {
    AppDatabase db = AppDatabase.instance();
    await (db.delete(db.playlistWithSong)
      ..where((tbl) => tbl.playlistId.equals(playlistId)))
        .go();
  }

  static Future<List<PlaylistWithSongEntity>?> queryListOfPlaylistWithSongByPlaylistId(int playlistId) async {
    AppDatabase db = AppDatabase.instance();
    List<PlaylistWithSongEntity> playlistWithSongEntityList = [];
    List<PlaylistWithSongTable>? playlistWithSongTableList = await (db.select(db.playlistWithSong)
      ..where((tbl) => tbl.playlistId.equals(playlistId)))
        .get();
    await Future.forEach(playlistWithSongTableList, (playlistWithSongTable) async {
      PlaylistWithSongEntity? tempPlaylistWithSongEntity = await convertTableToEntity(playlistWithSongTable);
      if(tempPlaylistWithSongEntity != null) {
        playlistWithSongEntityList.add(tempPlaylistWithSongEntity);
      }
    });
    return playlistWithSongEntityList;
  }
}
