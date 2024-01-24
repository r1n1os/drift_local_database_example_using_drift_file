import 'package:drift/drift.dart';
import 'package:drift_local_database_example/data/local_database/app_database.dart';
import 'package:drift_local_database_example/data/local_database/entities/song_entity.dart';
import 'package:drift_local_database_example/data/local_database/entities/playlist_with_song_entity.dart';

class PlaylistEntity {
  int? id;
  String? name;
  int? numberOfSongs;
  int? userId;
  List<SongEntity>? songEntityList;

  PlaylistEntity(
      {this.id,
      this.name,
      this.numberOfSongs,
      this.userId,
      this.songEntityList});

  PlaylistEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    numberOfSongs = json['number_of_songs'];
    userId = json['user_id'];
    if(json['songs'] != null){
      songEntityList = SongEntity.fromJsonArray(json['songs']);
    }
  }

  static Future<List<PlaylistEntity>> fromJsonArray(List jsonArray) async {
    return jsonArray.map((value) => PlaylistEntity.fromJson(value)).toList();
  }

  PlaylistCompanion toCompanion() {
    return PlaylistCompanion(
      id: Value(id ?? -1),
      name: Value(name ?? ''),
      numberOfSongs: Value(numberOfSongs ?? 0),
      userID: Value(userId ?? -1),
    );
  }

  static Future<void> saveSinglePlaylistEntity(
      PlaylistEntity playlistEntity) async {
    AppDatabase db = AppDatabase.instance();
    await db
        .into(db.playlist)
        .insertOnConflictUpdate(playlistEntity.toCompanion());
    await PlaylistWithSongEntity.cleanRelationshipBasedOnPlaylistId(playlistEntity.id ?? -1);
    if (playlistEntity.songEntityList != null) {
      await _saveSongAndRelationshipData(
          playlistEntity.songEntityList ?? [], playlistEntity.id ?? -1);
    }
  }

  static Future<void> _saveSongAndRelationshipData(
      List<SongEntity> songEntityList, int playlistId) async {
    await Future.forEach(songEntityList, (songEntity) async {
      SongEntity.saveSingleSongEntity(songEntity);
      await PlaylistWithSongEntity.saveSinglePlaylistWithSongEntity(
          PlaylistWithSongEntity(
              songId: songEntity.id, playlistId: playlistId));
    });
  }

  static Future<void> saveListOfPlaylist(
      List<PlaylistEntity> playlistEntityList) async {
    await Future.forEach(playlistEntityList, (playlistEntity) {
      saveSinglePlaylistEntity(playlistEntity);
    });
  }

  static Future<PlaylistEntity?> convertTableToEntity(
      PlaylistTable? playlistTable) async {
    if (playlistTable != null) {
      List<PlaylistWithSongEntity>? playlistWithSongEntityList =
          await _queryToGetPlaylistWithSongEntityList(playlistTable.id ?? -1);
      List<SongEntity> queriedSongEntityList = await _queryToGetSongEntityList(playlistWithSongEntityList);
      return PlaylistEntity(
          id: playlistTable.id,
          name: playlistTable.name,
          numberOfSongs: playlistTable.numberOfSongs,
          userId: playlistTable.userID,
          songEntityList: queriedSongEntityList);
    } else {
      return null;
    }
  }

  static Future<List<PlaylistWithSongEntity>?>
      _queryToGetPlaylistWithSongEntityList(int playlistId) async {
    return await PlaylistWithSongEntity.queryListOfPlaylistWithSongByPlaylistId(
        playlistId);
  }

  static Future<List<SongEntity>> _queryToGetSongEntityList(List<PlaylistWithSongEntity>? playlistWithSongEntityList) async {
     List<SongEntity> queriedSongEntityList = [];
     if(playlistWithSongEntityList != null) {
       await Future.forEach(playlistWithSongEntityList,
              (playlistWithSongEntity) async {
            SongEntity? tempSongEntity = await SongEntity.querySongById(
                playlistWithSongEntity.songId ?? -1);
            if (tempSongEntity != null) {
              queriedSongEntityList.add(tempSongEntity);
            }
          });
     }
    return queriedSongEntityList;
  }

  static Future<List<PlaylistEntity>> queryAllPlaylists() async {
    AppDatabase db = AppDatabase.instance();
    List<PlaylistEntity> playlistEntityList = [];
    List<PlaylistTable> playlistTableList = await db.select(db.playlist).get();
    await Future.forEach(playlistTableList, (playlistTable) async {
      PlaylistEntity? tempPlaylistEntity =
          await convertTableToEntity(playlistTable);
      if (tempPlaylistEntity != null) {
        playlistEntityList.add(tempPlaylistEntity);
      }
    });
    return playlistEntityList;
  }

  static Future<PlaylistEntity?> queryPlaylistById(int playlistId) async {
    AppDatabase db = AppDatabase.instance();
    PlaylistTable? playlistTable = await (db.select(db.playlist)
          ..where((tbl) => tbl.id.equals(playlistId)))
        .getSingleOrNull();
    return convertTableToEntity(playlistTable);
  }

  static Future<PlaylistEntity?> queryPlaylistByUserId(int userId) async {
    AppDatabase db = AppDatabase.instance();
    PlaylistTable? playlistTable = await (db.select(db.playlist)
          ..where((tbl) => tbl.userID.equals(userId)))
        .getSingleOrNull();
    return convertTableToEntity(playlistTable);
  }
}
