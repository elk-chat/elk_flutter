import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

/// 数据库名称
const String DB_NAME = 'k_chat.db';

/// 数据库表
// const String todoTABLE = 'Todo';
const String accountTABLE = 'Account';

class DatabaseProvider {
  static final DatabaseProvider dbProvider = DatabaseProvider();

  Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await createDatabase();
    return _db;
  }

  // 创建数据库
  createDatabase() async {
    var path = await getPath();
    var db = await openDatabase(path,
        version: 1, onCreate: initDB, onUpgrade: onUpgrade);
    return db;
  }

  // 删除数据库
  delDatabase() async {
    var path = await getPath();
    await deleteDatabase(path);
  }

  // 得到数据库路径
  Future<String> getPath() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    //"ReactiveTodo.db is our db instance name
    String path = join(documentsDirectory.path, DB_NAME);
    return path;
  }

  //This is optional, and only used for changing DB schema migrations
  void onUpgrade(Database db, int oldVersion, int newVersion) {
    if (newVersion > oldVersion) {}
  }

  // 创建 db 的时候，创建表
  void initDB(Database db, int version) async {
    // https://pub.dev/packages/sqflite

    // 创建 todo 表
    // await db.execute("CREATE TABLE $todoTABLE ("
    //     "id INTEGER PRIMARY KEY, "
    //     "description TEXT, "
    //     /*SQLITE doesn't have boolean type
    //     so we store isDone as integer where 0 is false
    //     and 1 is true*/
    //     "is_done INTEGER "
    //     ")");

    // 创建账户表
    await db.execute("CREATE TABLE $accountTABLE ("
        "id INTEGER PRIMARY KEY, "
        "userID INTEGER, "
        "userName TEXT, "
        "avatarUrl TEXT, "
        "token TEXT, "
        "sessionID INTEGER, "
        "avatarFileID INTEGER, "
        ")");
  }
}
