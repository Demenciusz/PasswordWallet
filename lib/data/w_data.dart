import 'package:drift/drift.dart';
import 'package:drift/web.dart';

part 'w_data.g.dart';

@DataClassName('User')
class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get login => text()();
  TextColumn get passwordH => text()();
  TextColumn get salt => text()();
  BoolColumn get sha => boolean()();
}

@DataClassName('Password')
class Passwords extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().references(Users, #id)();
  TextColumn get login => text()();
  TextColumn get password => text()();
  TextColumn get web => text()();
  TextColumn get description => text()();
}

@DriftDatabase(tables: [Users, Passwords])
class WDatabase extends _$WDatabase {
  WDatabase() : super(WebDatabase('database'));

  Future<int> addUser(UsersCompanion entry) {
    return into(users).insert(entry);
  }

  Future<User> getUserByLogin(String login) async {
    final user = await (select(users)
          ..where(
            (tbl) => tbl.login.equals(login),
          )
          ..limit(1))
        .getSingle();

    return user;
  }

  Future<int> getUserCount() async {
    final list = await select(users).get();
    return list.length;
  }

  Future<int> addPassword(PasswordsCompanion entry) {
    return into(passwords).insert(entry);
  }

  Future<List<Password>> getAllUserPasswords(int userId) {
    return (select(passwords)..where((tbl) => tbl.userId.equals(userId))).get();
  }

  void removePassword(Password password) {
    return delete(passwords).where((tbl) {
      return tbl.web.equals(password.web);
    });
  }

  Future<int> removePasswordById(int id) async {
    return await (delete(passwords)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<List<User>> getAllUsers() {
    return (select(users)).get();
  }

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }
}
