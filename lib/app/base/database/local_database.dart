import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

mixin LocalDatabase {
  Future<void> createDatabase() async {
    await openDatabase(
      join(await getDatabasesPath(), 'books_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE books(id INTEGER PRIMARY KEY, uuidBook TEXT, title TEXT, level INTEGER, description TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<Database> openLocalDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'books_database.db'),
    );
  }
}
