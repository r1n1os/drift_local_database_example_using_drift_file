import 'package:drift/drift.dart';


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
}