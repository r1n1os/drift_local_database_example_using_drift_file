// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class User extends Table with TableInfo<User, UserTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  User(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _musicStyleMeta =
      const VerificationMeta('musicStyle');
  late final GeneratedColumn<String> musicStyle = GeneratedColumn<String>(
      'music_style', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _favoriteSongMeta =
      const VerificationMeta('favoriteSong');
  late final GeneratedColumn<int> favoriteSong = GeneratedColumn<int>(
      'favorite_song', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns =>
      [id, username, musicStyle, favoriteSong];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'User';
  @override
  VerificationContext validateIntegrity(Insertable<UserTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('music_style')) {
      context.handle(
          _musicStyleMeta,
          musicStyle.isAcceptableOrUnknown(
              data['music_style']!, _musicStyleMeta));
    } else if (isInserting) {
      context.missing(_musicStyleMeta);
    }
    if (data.containsKey('favorite_song')) {
      context.handle(
          _favoriteSongMeta,
          favoriteSong.isAcceptableOrUnknown(
              data['favorite_song']!, _favoriteSongMeta));
    } else if (isInserting) {
      context.missing(_favoriteSongMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserTable(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      musicStyle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}music_style'])!,
      favoriteSong: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}favorite_song'])!,
    );
  }

  @override
  User createAlias(String alias) {
    return User(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class UserTable extends DataClass implements Insertable<UserTable> {
  final int id;
  final String username;
  final String musicStyle;
  final int favoriteSong;
  const UserTable(
      {required this.id,
      required this.username,
      required this.musicStyle,
      required this.favoriteSong});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['username'] = Variable<String>(username);
    map['music_style'] = Variable<String>(musicStyle);
    map['favorite_song'] = Variable<int>(favoriteSong);
    return map;
  }

  UserCompanion toCompanion(bool nullToAbsent) {
    return UserCompanion(
      id: Value(id),
      username: Value(username),
      musicStyle: Value(musicStyle),
      favoriteSong: Value(favoriteSong),
    );
  }

  factory UserTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserTable(
      id: serializer.fromJson<int>(json['id']),
      username: serializer.fromJson<String>(json['username']),
      musicStyle: serializer.fromJson<String>(json['music_style']),
      favoriteSong: serializer.fromJson<int>(json['favorite_song']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'username': serializer.toJson<String>(username),
      'music_style': serializer.toJson<String>(musicStyle),
      'favorite_song': serializer.toJson<int>(favoriteSong),
    };
  }

  UserTable copyWith(
          {int? id, String? username, String? musicStyle, int? favoriteSong}) =>
      UserTable(
        id: id ?? this.id,
        username: username ?? this.username,
        musicStyle: musicStyle ?? this.musicStyle,
        favoriteSong: favoriteSong ?? this.favoriteSong,
      );
  @override
  String toString() {
    return (StringBuffer('UserTable(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('musicStyle: $musicStyle, ')
          ..write('favoriteSong: $favoriteSong')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, username, musicStyle, favoriteSong);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserTable &&
          other.id == this.id &&
          other.username == this.username &&
          other.musicStyle == this.musicStyle &&
          other.favoriteSong == this.favoriteSong);
}

class UserCompanion extends UpdateCompanion<UserTable> {
  final Value<int> id;
  final Value<String> username;
  final Value<String> musicStyle;
  final Value<int> favoriteSong;
  const UserCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.musicStyle = const Value.absent(),
    this.favoriteSong = const Value.absent(),
  });
  UserCompanion.insert({
    this.id = const Value.absent(),
    required String username,
    required String musicStyle,
    required int favoriteSong,
  })  : username = Value(username),
        musicStyle = Value(musicStyle),
        favoriteSong = Value(favoriteSong);
  static Insertable<UserTable> custom({
    Expression<int>? id,
    Expression<String>? username,
    Expression<String>? musicStyle,
    Expression<int>? favoriteSong,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
      if (musicStyle != null) 'music_style': musicStyle,
      if (favoriteSong != null) 'favorite_song': favoriteSong,
    });
  }

  UserCompanion copyWith(
      {Value<int>? id,
      Value<String>? username,
      Value<String>? musicStyle,
      Value<int>? favoriteSong}) {
    return UserCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      musicStyle: musicStyle ?? this.musicStyle,
      favoriteSong: favoriteSong ?? this.favoriteSong,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (musicStyle.present) {
      map['music_style'] = Variable<String>(musicStyle.value);
    }
    if (favoriteSong.present) {
      map['favorite_song'] = Variable<int>(favoriteSong.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('musicStyle: $musicStyle, ')
          ..write('favoriteSong: $favoriteSong')
          ..write(')'))
        .toString();
  }
}

class Song extends Table with TableInfo<Song, SongTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Song(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _durationMeta =
      const VerificationMeta('duration');
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
      'duration', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [id, name, duration];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'Song';
  @override
  VerificationContext validateIntegrity(Insertable<SongTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('duration')) {
      context.handle(_durationMeta,
          duration.isAcceptableOrUnknown(data['duration']!, _durationMeta));
    } else if (isInserting) {
      context.missing(_durationMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SongTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SongTable(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      duration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration'])!,
    );
  }

  @override
  Song createAlias(String alias) {
    return Song(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class SongTable extends DataClass implements Insertable<SongTable> {
  final int id;
  final String name;
  final int duration;
  const SongTable(
      {required this.id, required this.name, required this.duration});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['duration'] = Variable<int>(duration);
    return map;
  }

  SongCompanion toCompanion(bool nullToAbsent) {
    return SongCompanion(
      id: Value(id),
      name: Value(name),
      duration: Value(duration),
    );
  }

  factory SongTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SongTable(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      duration: serializer.fromJson<int>(json['duration']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'duration': serializer.toJson<int>(duration),
    };
  }

  SongTable copyWith({int? id, String? name, int? duration}) => SongTable(
        id: id ?? this.id,
        name: name ?? this.name,
        duration: duration ?? this.duration,
      );
  @override
  String toString() {
    return (StringBuffer('SongTable(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('duration: $duration')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, duration);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SongTable &&
          other.id == this.id &&
          other.name == this.name &&
          other.duration == this.duration);
}

class SongCompanion extends UpdateCompanion<SongTable> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> duration;
  const SongCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.duration = const Value.absent(),
  });
  SongCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int duration,
  })  : name = Value(name),
        duration = Value(duration);
  static Insertable<SongTable> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? duration,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (duration != null) 'duration': duration,
    });
  }

  SongCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<int>? duration}) {
    return SongCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      duration: duration ?? this.duration,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SongCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('duration: $duration')
          ..write(')'))
        .toString();
  }
}

class Artist extends Table with TableInfo<Artist, ArtistTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Artist(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
      'age', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _musicStyleMeta =
      const VerificationMeta('musicStyle');
  late final GeneratedColumn<int> musicStyle = GeneratedColumn<int>(
      'music_style', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [id, name, age, musicStyle];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'Artist';
  @override
  VerificationContext validateIntegrity(Insertable<ArtistTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age']!, _ageMeta));
    } else if (isInserting) {
      context.missing(_ageMeta);
    }
    if (data.containsKey('music_style')) {
      context.handle(
          _musicStyleMeta,
          musicStyle.isAcceptableOrUnknown(
              data['music_style']!, _musicStyleMeta));
    } else if (isInserting) {
      context.missing(_musicStyleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ArtistTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ArtistTable(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      age: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}age'])!,
      musicStyle: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}music_style'])!,
    );
  }

  @override
  Artist createAlias(String alias) {
    return Artist(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class ArtistTable extends DataClass implements Insertable<ArtistTable> {
  final int id;
  final String name;
  final int age;
  final int musicStyle;
  const ArtistTable(
      {required this.id,
      required this.name,
      required this.age,
      required this.musicStyle});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['age'] = Variable<int>(age);
    map['music_style'] = Variable<int>(musicStyle);
    return map;
  }

  ArtistCompanion toCompanion(bool nullToAbsent) {
    return ArtistCompanion(
      id: Value(id),
      name: Value(name),
      age: Value(age),
      musicStyle: Value(musicStyle),
    );
  }

  factory ArtistTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ArtistTable(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      age: serializer.fromJson<int>(json['age']),
      musicStyle: serializer.fromJson<int>(json['music_style']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'age': serializer.toJson<int>(age),
      'music_style': serializer.toJson<int>(musicStyle),
    };
  }

  ArtistTable copyWith({int? id, String? name, int? age, int? musicStyle}) =>
      ArtistTable(
        id: id ?? this.id,
        name: name ?? this.name,
        age: age ?? this.age,
        musicStyle: musicStyle ?? this.musicStyle,
      );
  @override
  String toString() {
    return (StringBuffer('ArtistTable(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('age: $age, ')
          ..write('musicStyle: $musicStyle')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, age, musicStyle);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ArtistTable &&
          other.id == this.id &&
          other.name == this.name &&
          other.age == this.age &&
          other.musicStyle == this.musicStyle);
}

class ArtistCompanion extends UpdateCompanion<ArtistTable> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> age;
  final Value<int> musicStyle;
  const ArtistCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.age = const Value.absent(),
    this.musicStyle = const Value.absent(),
  });
  ArtistCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int age,
    required int musicStyle,
  })  : name = Value(name),
        age = Value(age),
        musicStyle = Value(musicStyle);
  static Insertable<ArtistTable> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? age,
    Expression<int>? musicStyle,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (age != null) 'age': age,
      if (musicStyle != null) 'music_style': musicStyle,
    });
  }

  ArtistCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? age,
      Value<int>? musicStyle}) {
    return ArtistCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      musicStyle: musicStyle ?? this.musicStyle,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (musicStyle.present) {
      map['music_style'] = Variable<int>(musicStyle.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArtistCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('age: $age, ')
          ..write('musicStyle: $musicStyle')
          ..write(')'))
        .toString();
  }
}

class Playlist extends Table with TableInfo<Playlist, PlaylistTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Playlist(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _numberOfSongsMeta =
      const VerificationMeta('numberOfSongs');
  late final GeneratedColumn<int> numberOfSongs = GeneratedColumn<int>(
      'number_of_songs', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [id, name, numberOfSongs];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'Playlist';
  @override
  VerificationContext validateIntegrity(Insertable<PlaylistTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('number_of_songs')) {
      context.handle(
          _numberOfSongsMeta,
          numberOfSongs.isAcceptableOrUnknown(
              data['number_of_songs']!, _numberOfSongsMeta));
    } else if (isInserting) {
      context.missing(_numberOfSongsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlaylistTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlaylistTable(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      numberOfSongs: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}number_of_songs'])!,
    );
  }

  @override
  Playlist createAlias(String alias) {
    return Playlist(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class PlaylistTable extends DataClass implements Insertable<PlaylistTable> {
  final int id;
  final String name;
  final int numberOfSongs;
  const PlaylistTable(
      {required this.id, required this.name, required this.numberOfSongs});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['number_of_songs'] = Variable<int>(numberOfSongs);
    return map;
  }

  PlaylistCompanion toCompanion(bool nullToAbsent) {
    return PlaylistCompanion(
      id: Value(id),
      name: Value(name),
      numberOfSongs: Value(numberOfSongs),
    );
  }

  factory PlaylistTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlaylistTable(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      numberOfSongs: serializer.fromJson<int>(json['number_of_songs']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'number_of_songs': serializer.toJson<int>(numberOfSongs),
    };
  }

  PlaylistTable copyWith({int? id, String? name, int? numberOfSongs}) =>
      PlaylistTable(
        id: id ?? this.id,
        name: name ?? this.name,
        numberOfSongs: numberOfSongs ?? this.numberOfSongs,
      );
  @override
  String toString() {
    return (StringBuffer('PlaylistTable(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('numberOfSongs: $numberOfSongs')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, numberOfSongs);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlaylistTable &&
          other.id == this.id &&
          other.name == this.name &&
          other.numberOfSongs == this.numberOfSongs);
}

class PlaylistCompanion extends UpdateCompanion<PlaylistTable> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> numberOfSongs;
  const PlaylistCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.numberOfSongs = const Value.absent(),
  });
  PlaylistCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int numberOfSongs,
  })  : name = Value(name),
        numberOfSongs = Value(numberOfSongs);
  static Insertable<PlaylistTable> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? numberOfSongs,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (numberOfSongs != null) 'number_of_songs': numberOfSongs,
    });
  }

  PlaylistCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<int>? numberOfSongs}) {
    return PlaylistCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      numberOfSongs: numberOfSongs ?? this.numberOfSongs,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (numberOfSongs.present) {
      map['number_of_songs'] = Variable<int>(numberOfSongs.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlaylistCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('numberOfSongs: $numberOfSongs')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final User user = User(this);
  late final Song song = Song(this);
  late final Artist artist = Artist(this);
  late final Playlist playlist = Playlist(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [user, song, artist, playlist];
}
