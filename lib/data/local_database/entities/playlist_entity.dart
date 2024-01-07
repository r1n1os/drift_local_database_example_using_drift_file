import 'package:drift/drift.dart';
import 'package:drift_local_database_example/data/local_database/app_database.dart';

class PlaylistEntity {
  int? id;
  String? name;
  int? numberOfSongs;
  int? userId;

  PlaylistEntity(
      {this.id, this.name, this.numberOfSongs, this.userId});

  PlaylistCompanion toCompanion() {
    return PlaylistCompanion(
      id: Value(id ?? -1),
      name: Value(name ?? ''),
      numberOfSongs: Value(numberOfSongs ?? 0),
      userID: Value(userId ?? -1),
    );
  }

  static Future<void> saveSinglePlaylistEntity(PlaylistEntity playlistEntity) async {
    AppDatabase db = AppDatabase();
    await db.into(db.playlist).insertOnConflictUpdate(playlistEntity.toCompanion());
  }

  static Future<void> saveListOfPlaylist(List<PlaylistEntity> playlistEntityList) async {
    await Future.forEach(playlistEntityList, (playlistEntity) {
      saveSinglePlaylistEntity(playlistEntity);
    });
  }

  static Future<PlaylistEntity?> convertTableToEntity(PlaylistTable? playlistTable) async {
    if(playlistTable != null) {
      return PlaylistEntity(
        id: playlistTable.id,
        name: playlistTable.name,
        numberOfSongs: playlistTable.numberOfSongs,
        userId: playlistTable.userID
      );
    } else {
      return null;
    }
  }

  static Future<List<PlaylistEntity>> queryAllPlaylists() async {
    AppDatabase db = AppDatabase();
    List<PlaylistEntity> playlistEntityList = [];
    List<PlaylistTable> playlistTableList = await db.select(db.playlist).get();
    await Future.forEach(playlistTableList, (playlistTable) async {
      PlaylistEntity? tempPlaylistEntity = await convertTableToEntity(playlistTable);
      if(tempPlaylistEntity != null) {
        playlistEntityList.add(tempPlaylistEntity);
      }
    });
    return playlistEntityList;
  }

  static Future<PlaylistEntity?> queryPlaylistById(int playlistId) async {
    AppDatabase db = AppDatabase();
    PlaylistTable? playlistTable =
    await (db.select(db.playlist)..where((tbl) => tbl.id.equals(playlistId))).getSingleOrNull();
    return convertTableToEntity(playlistTable);
  }

  static Future<PlaylistEntity?> queryPlaylistByUserId(int userId) async {
    AppDatabase db = AppDatabase();
    PlaylistTable? playlistTable =
    await (db.select(db.playlist)..where((tbl) => tbl.userID.equals(userId))).getSingleOrNull();
    return convertTableToEntity(playlistTable);
  }
}
