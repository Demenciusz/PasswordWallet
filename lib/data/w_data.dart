import 'package:drift/drift.dart';
import 'package:drift/web.dart';

part 'w_data.g.dart';

@DataClassName('User')
class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get login => text()();
  TextColumn get passwordH => text()();
  TextColumn get salt => text()();
}

@DataClassName('Password')
class Passwords extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get login => text()();
  TextColumn get password => text()();
  TextColumn get web => text()();
  TextColumn get description => text()();
}

@DriftDatabase(tables: [Users, Passwords])
class WDatabase extends _$WDatabase {
  WDatabase() : super(WebDatabase('database'));
}
