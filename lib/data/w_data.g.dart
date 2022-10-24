// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'w_data.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class User extends DataClass implements Insertable<User> {
  final int id;
  final String login;
  final String passwordH;
  final String salt;
  final bool sha;
  const User(
      {required this.id,
      required this.login,
      required this.passwordH,
      required this.salt,
      required this.sha});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['login'] = Variable<String>(login);
    map['password_h'] = Variable<String>(passwordH);
    map['salt'] = Variable<String>(salt);
    map['sha'] = Variable<bool>(sha);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      login: Value(login),
      passwordH: Value(passwordH),
      salt: Value(salt),
      sha: Value(sha),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      login: serializer.fromJson<String>(json['login']),
      passwordH: serializer.fromJson<String>(json['passwordH']),
      salt: serializer.fromJson<String>(json['salt']),
      sha: serializer.fromJson<bool>(json['sha']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'login': serializer.toJson<String>(login),
      'passwordH': serializer.toJson<String>(passwordH),
      'salt': serializer.toJson<String>(salt),
      'sha': serializer.toJson<bool>(sha),
    };
  }

  User copyWith(
          {int? id,
          String? login,
          String? passwordH,
          String? salt,
          bool? sha}) =>
      User(
        id: id ?? this.id,
        login: login ?? this.login,
        passwordH: passwordH ?? this.passwordH,
        salt: salt ?? this.salt,
        sha: sha ?? this.sha,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('login: $login, ')
          ..write('passwordH: $passwordH, ')
          ..write('salt: $salt, ')
          ..write('sha: $sha')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, login, passwordH, salt, sha);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.login == this.login &&
          other.passwordH == this.passwordH &&
          other.salt == this.salt &&
          other.sha == this.sha);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> login;
  final Value<String> passwordH;
  final Value<String> salt;
  final Value<bool> sha;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.login = const Value.absent(),
    this.passwordH = const Value.absent(),
    this.salt = const Value.absent(),
    this.sha = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String login,
    required String passwordH,
    required String salt,
    required bool sha,
  })  : login = Value(login),
        passwordH = Value(passwordH),
        salt = Value(salt),
        sha = Value(sha);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? login,
    Expression<String>? passwordH,
    Expression<String>? salt,
    Expression<bool>? sha,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (login != null) 'login': login,
      if (passwordH != null) 'password_h': passwordH,
      if (salt != null) 'salt': salt,
      if (sha != null) 'sha': sha,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? id,
      Value<String>? login,
      Value<String>? passwordH,
      Value<String>? salt,
      Value<bool>? sha}) {
    return UsersCompanion(
      id: id ?? this.id,
      login: login ?? this.login,
      passwordH: passwordH ?? this.passwordH,
      salt: salt ?? this.salt,
      sha: sha ?? this.sha,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (login.present) {
      map['login'] = Variable<String>(login.value);
    }
    if (passwordH.present) {
      map['password_h'] = Variable<String>(passwordH.value);
    }
    if (salt.present) {
      map['salt'] = Variable<String>(salt.value);
    }
    if (sha.present) {
      map['sha'] = Variable<bool>(sha.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('login: $login, ')
          ..write('passwordH: $passwordH, ')
          ..write('salt: $salt, ')
          ..write('sha: $sha')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _loginMeta = const VerificationMeta('login');
  @override
  late final GeneratedColumn<String> login = GeneratedColumn<String>(
      'login', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _passwordHMeta = const VerificationMeta('passwordH');
  @override
  late final GeneratedColumn<String> passwordH = GeneratedColumn<String>(
      'password_h', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _saltMeta = const VerificationMeta('salt');
  @override
  late final GeneratedColumn<String> salt = GeneratedColumn<String>(
      'salt', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _shaMeta = const VerificationMeta('sha');
  @override
  late final GeneratedColumn<bool> sha = GeneratedColumn<bool>(
      'sha', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK ("sha" IN (0, 1))');
  @override
  List<GeneratedColumn> get $columns => [id, login, passwordH, salt, sha];
  @override
  String get aliasedName => _alias ?? 'users';
  @override
  String get actualTableName => 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('login')) {
      context.handle(
          _loginMeta, login.isAcceptableOrUnknown(data['login']!, _loginMeta));
    } else if (isInserting) {
      context.missing(_loginMeta);
    }
    if (data.containsKey('password_h')) {
      context.handle(_passwordHMeta,
          passwordH.isAcceptableOrUnknown(data['password_h']!, _passwordHMeta));
    } else if (isInserting) {
      context.missing(_passwordHMeta);
    }
    if (data.containsKey('salt')) {
      context.handle(
          _saltMeta, salt.isAcceptableOrUnknown(data['salt']!, _saltMeta));
    } else if (isInserting) {
      context.missing(_saltMeta);
    }
    if (data.containsKey('sha')) {
      context.handle(
          _shaMeta, sha.isAcceptableOrUnknown(data['sha']!, _shaMeta));
    } else if (isInserting) {
      context.missing(_shaMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      login: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}login'])!,
      passwordH: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}password_h'])!,
      salt: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}salt'])!,
      sha: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}sha'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class Password extends DataClass implements Insertable<Password> {
  final int id;
  final int userId;
  final String login;
  final String password;
  final String web;
  final String description;
  const Password(
      {required this.id,
      required this.userId,
      required this.login,
      required this.password,
      required this.web,
      required this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['login'] = Variable<String>(login);
    map['password'] = Variable<String>(password);
    map['web'] = Variable<String>(web);
    map['description'] = Variable<String>(description);
    return map;
  }

  PasswordsCompanion toCompanion(bool nullToAbsent) {
    return PasswordsCompanion(
      id: Value(id),
      userId: Value(userId),
      login: Value(login),
      password: Value(password),
      web: Value(web),
      description: Value(description),
    );
  }

  factory Password.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Password(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      login: serializer.fromJson<String>(json['login']),
      password: serializer.fromJson<String>(json['password']),
      web: serializer.fromJson<String>(json['web']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'login': serializer.toJson<String>(login),
      'password': serializer.toJson<String>(password),
      'web': serializer.toJson<String>(web),
      'description': serializer.toJson<String>(description),
    };
  }

  Password copyWith(
          {int? id,
          int? userId,
          String? login,
          String? password,
          String? web,
          String? description}) =>
      Password(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        login: login ?? this.login,
        password: password ?? this.password,
        web: web ?? this.web,
        description: description ?? this.description,
      );
  @override
  String toString() {
    return (StringBuffer('Password(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('login: $login, ')
          ..write('password: $password, ')
          ..write('web: $web, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, login, password, web, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Password &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.login == this.login &&
          other.password == this.password &&
          other.web == this.web &&
          other.description == this.description);
}

class PasswordsCompanion extends UpdateCompanion<Password> {
  final Value<int> id;
  final Value<int> userId;
  final Value<String> login;
  final Value<String> password;
  final Value<String> web;
  final Value<String> description;
  const PasswordsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.login = const Value.absent(),
    this.password = const Value.absent(),
    this.web = const Value.absent(),
    this.description = const Value.absent(),
  });
  PasswordsCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required String login,
    required String password,
    required String web,
    required String description,
  })  : userId = Value(userId),
        login = Value(login),
        password = Value(password),
        web = Value(web),
        description = Value(description);
  static Insertable<Password> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<String>? login,
    Expression<String>? password,
    Expression<String>? web,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (login != null) 'login': login,
      if (password != null) 'password': password,
      if (web != null) 'web': web,
      if (description != null) 'description': description,
    });
  }

  PasswordsCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<String>? login,
      Value<String>? password,
      Value<String>? web,
      Value<String>? description}) {
    return PasswordsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      login: login ?? this.login,
      password: password ?? this.password,
      web: web ?? this.web,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (login.present) {
      map['login'] = Variable<String>(login.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (web.present) {
      map['web'] = Variable<String>(web.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PasswordsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('login: $login, ')
          ..write('password: $password, ')
          ..write('web: $web, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $PasswordsTable extends Passwords
    with TableInfo<$PasswordsTable, Password> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PasswordsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES "users" ("id")');
  final VerificationMeta _loginMeta = const VerificationMeta('login');
  @override
  late final GeneratedColumn<String> login = GeneratedColumn<String>(
      'login', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _passwordMeta = const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _webMeta = const VerificationMeta('web');
  @override
  late final GeneratedColumn<String> web = GeneratedColumn<String>(
      'web', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, login, password, web, description];
  @override
  String get aliasedName => _alias ?? 'passwords';
  @override
  String get actualTableName => 'passwords';
  @override
  VerificationContext validateIntegrity(Insertable<Password> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('login')) {
      context.handle(
          _loginMeta, login.isAcceptableOrUnknown(data['login']!, _loginMeta));
    } else if (isInserting) {
      context.missing(_loginMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('web')) {
      context.handle(
          _webMeta, web.isAcceptableOrUnknown(data['web']!, _webMeta));
    } else if (isInserting) {
      context.missing(_webMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Password map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Password(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      login: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}login'])!,
      password: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
      web: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}web'])!,
      description: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
    );
  }

  @override
  $PasswordsTable createAlias(String alias) {
    return $PasswordsTable(attachedDatabase, alias);
  }
}

abstract class _$WDatabase extends GeneratedDatabase {
  _$WDatabase(QueryExecutor e) : super(e);
  late final $UsersTable users = $UsersTable(this);
  late final $PasswordsTable passwords = $PasswordsTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [users, passwords];
}
