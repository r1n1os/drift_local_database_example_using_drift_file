import 'package:drift/drift.dart';
import 'package:drift_local_database_example/data/local_database/app_database.dart';
import 'package:drift_local_database_example/data/local_database/entities/playlist_entity.dart';

class UserEntity {
  int? id;
  String? username;
  String? musicStyle;
  String? favoriteSongName;
  PlaylistEntity? playlistEntity;

  UserEntity(
      {this.id,
      this.username,
      this.musicStyle,
      this.favoriteSongName,
      this.playlistEntity});

  UserCompanion toCompanion() {
    return UserCompanion(
      id: Value(id ?? -1),
      username: Value(username ?? ''),
      musicStyle: Value(musicStyle ?? ''),
      favoriteSongName: Value(favoriteSongName ?? ''),
    );
  }

  static Future<void> saveSingleUserEntity(UserEntity userEntity) async {
    AppDatabase db = AppDatabase();
    if (userEntity.playlistEntity != null) {
      await PlaylistEntity.saveSinglePlaylistEntity(userEntity.playlistEntity!);
    }
    await db.into(db.user).insertOnConflictUpdate(userEntity.toCompanion());
  }

  static Future<void> saveListOfUserEntity(
      List<UserEntity> userEntityList) async {
    await Future.forEach(userEntityList, (userEntity) {
      saveSingleUserEntity(userEntity);
    });
  }

  static Future<UserEntity?> convertTableToEntity(UserTable? userTable) async {
    if(userTable != null) {
      PlaylistEntity? playlistEntity =
      await PlaylistEntity.queryPlaylistByUserId(userTable.id);
      return UserEntity(
          id: userTable.id,
          username: userTable.username,
          musicStyle: userTable.musicStyle,
          favoriteSongName: userTable.favoriteSongName,
          playlistEntity: playlistEntity);
    } else {
      return null;
    }
  }

  static Future<List<UserEntity>> queryAllUsers() async {
    AppDatabase db = AppDatabase();
    List<UserEntity> userEntityList = [];
    List<UserTable> userTableList = await db.select(db.user).get();
    await Future.forEach(userTableList, (userTable) async {
      UserEntity? tempUserEntity = await convertTableToEntity(userTable);
      if(tempUserEntity != null) {
        userEntityList.add(tempUserEntity);
      }
    });
    return userEntityList;
  }

  static Future<UserEntity?> queryUserById(int userId) async {
    AppDatabase db = AppDatabase();
    UserTable? userTable =
        await (db.select(db.user)..where((tbl) => tbl.id.equals(userId))).getSingleOrNull();
    return convertTableToEntity(userTable);
  }
}
