import 'package:drift_local_database_example/data/local_database/entities/artist_entity.dart';
import 'package:drift_local_database_example/data/local_database/entities/user_entity.dart';
import 'package:drift_local_database_example/utils/data_source.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    _parseData();
    super.initState();
  }

  void _parseData() async {
    List<UserEntity> userEntityList = await UserEntity.fromJsonArray(DataSource.usersDataSource['Users']);
    List<ArtistEntity> artistEntityList = await ArtistEntity.fromJsonArray(DataSource.artistDataSource['Artists']);
    await _saveDataIntoLocalDatabase(userEntityList, artistEntityList);
    await _retrieveDataFromLocalDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  Future<void> _saveDataIntoLocalDatabase(List<UserEntity> userEntityList,  List<ArtistEntity> artistEntityList) async {
    await UserEntity.saveListOfUserEntity(userEntityList);
    await ArtistEntity.saveListOfArtistEntity(artistEntityList);
  }

  Future<void> _retrieveDataFromLocalDatabase() async {
    List<UserEntity> userEntityList =  await UserEntity.queryAllUsers();
    List<ArtistEntity> artistEntityList = await ArtistEntity.queryAllArtists();
    if (kDebugMode) {
      print("Queried users: $userEntityList");
      print("Queried artist: $artistEntityList");
    }
  }
}
