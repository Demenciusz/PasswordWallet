import 'package:drift/drift.dart';
import 'package:drift/web.dart';
import 'package:get_ip_address/get_ip_address.dart';

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

@DataClassName('LoginIp')
class LoginIps extends Table {
  TextColumn get addresIp => text()();
  DateTimeColumn get lastLogIn => dateTime()();
  DateTimeColumn get lastNoSucces => dateTime()();
  IntColumn get counter => integer()();
}

@DataClassName('LoginUser')
class LoginUser extends Table {
  TextColumn get userId => text()();
  DateTimeColumn get lastLogin => dateTime()();
  DateTimeColumn get lastFailedLogin => dateTime()();
}

@DriftDatabase(tables: [Users, Passwords, LoginIps])
class WDatabase extends _$WDatabase {
  WDatabase() : super(WebDatabase('database'));

  Future<int> addAddresIp(LoginIpsCompanion entry) async {
    return into(loginIps).insert(entry);
  }

  Future<LoginIp> getIpAddressByIp(String ip) async {
    final loginIp = await (select(loginIps)
          ..where(
            (tbl) => tbl.addresIp.equals(ip),
          )
          ..limit(1))
        .getSingle();
    return loginIp;
  }

  Future<void> changeLoginIpN(String ip, int counter) async {
    DateTime.now();
    await (update(loginIps)..where((tbl) => tbl.addresIp.equals(ip))).write(
      LoginIpsCompanion(
        counter: Value(counter + 1),
        lastNoSucces: Value(
          DateTime.now(),
        ),
      ),
    );
  }

  Future<void> changeLoginIpS(String ip, int counter) async {
    DateTime.now();
    await (update(loginIps)..where((tbl) => tbl.addresIp.equals(ip))).write(
      LoginIpsCompanion(
        counter: Value(0),
        lastLogIn: Value(
          DateTime.now(),
        ),
      ),
    );
  }

  Future<List<LoginIp>> getAllAddress() async {
    return select(loginIps).get();
  }

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

  Future<int> removeAllPasswords(int id) {
    return (delete(passwords)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<int> changeUserPassword({
    required int id,
    required String text,
    required String salt,
  }) async {
    return (update(users)..where((tbl) => tbl.id.equals(id)))
        .write(UsersCompanion(passwordH: Value(text), salt: Value(salt)));
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
