import "package:flutter/foundation.dart";
import "package:sqflite/sqflite.dart";
// ignore: depend_on_referenced_packages
import "package:path/path.dart";

class PosData {
  //check that data is not null
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialNew();
      return _db;
    } else {
      return _db;
    }
  }

//create data
  initialNew() async {
    var newDataPath = await getDatabasesPath();
    if (kDebugMode) {
      print(newDataPath);
    }
    String path = join(newDataPath, "magicPOS.db");
    Database myDb = await openDatabase(
      path,
      onCreate: _onCreate,
      version: 1,
      onUpgrade: _onUpgrade,
      readOnly: false,
    );
    return myDb;
  }

//add a new row in a table
  insertData(String sql) async {
    Database? myDB = await db;
    int response = await myDB!.rawInsert(sql);
    return response;
  }

//read data form tables
  readData(String sql) async {
    Database? myDB = await db;
    List<Map> response = await myDB!.rawQuery(sql);
    return response;
  }

//delete a row in table
  deleteData(String sql) async {
    Database? myDB = await db;
    int response = await myDB!.rawDelete(sql);
    return response;
  }

//update data
  changeData(String sql) async {
    Database? myDB = await db;
    int response = await myDB!.rawUpdate(sql);
    return response;
  }

//delete the whole data
  deleteDataBase(String delete) async {
    String newDataPath = await getDatabasesPath();
    String path = join(newDataPath, delete);
    if (kDebugMode) {
      print('delete data complete ');
    }
    await deleteDatabase(path);
  }

//upgrade data
  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (kDebugMode) {
      print("upgraded");
    }
  }

//tables
  _onCreate(Database db, int oldVersion) async {
    //clients table
    await db.execute('''
      CREATE TABLE IF NOT EXISTS "clients"(
        'id' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
        'Barcode' INTEGER(13) NOT NULL,
        'In' REAL NOT NULL,
        'Out' REAL NOT NULL,
        'Balance' REAL NOT NULL,
        'Name_Arabic' TEXT(30) NOT NULL,
        'Name_English' TEXT(30) NOT NULL,
        'Tel' TEXT(10) NOT NULL,
        'Whatsapp' TEXT(10) NOT NULL,
        'Email' TEXT(30) NOT NULL
      )''');
    //suppliers table
    await db.execute('''
    CREATE TABLE IF NOT EXISTS "suppliers"(
      'id' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      'Barcode' INTEGER(13) NOT NULL,
      'In' REAL NOT NULL,
      'Out' REAL NOT NULL,
      'Balance' REAL NOT NULL,
      'Name_Arabic' TEXT(30) NOT NULL,
      'Name_English' TEXT(30) NOT NULL,
      'Tel' TEXT(10) NOT NULL,
      'Whatsapp' TEXT(10) NOT NULL,
      'Email' TEXT(30) NOT NULL
    )
      ''');
//function keys table
    await db.execute('''
    CREATE TABLE IF NOT EXISTS "functions_keys"(
      'key_name' TEXT (11) NOT NULL,
      'clicks_1' INTEGER DEFAULT 0,
      'amount_1' REAL DEFAULT 0.0,
      'clicks_2' INTEGER DEFAULT 0,
      'amount_2' REAL DEFAULT 0.0
      
    )
      ''');
//clients tables
    await db.execute('''
    CREATE TABLE IF NOT EXISTS "client_one"(
      'desc' TEXT,
      'qty' INTEGER,
      'unit-price' REAL,
      'total-price' REAL,
      'bonus' REAL DEFAULT 0.0,
      'discount' REAL DEFAULT 0.0
    )
      ''');

    await db.execute('''
    CREATE TABLE IF NOT EXISTS "client_two"(
      'desc' TEXT,
      'qty' INTEGER,
      'unit-price' REAL,
      'total-price' REAL,
      'bonus' REAL DEFAULT 0.0,
      'discount' REAL DEFAULT 0.0
    )
      ''');

    await db.execute('''
    CREATE TABLE IF NOT EXISTS "client_three"(
      'desc' TEXT,
      'qty' INTEGER,
      'unit-price' REAL,
      'total-price' REAL,
      'bonus' REAL DEFAULT 0.0,
      'discount' REAL DEFAULT 0.0
    )
      ''');
//depts table
    await db.execute('''
    CREATE TABLE IF NOT EXISTS "dept"(
      'desc' TEXT DEFAULT "",
      'name' TEXT,
      'clicks' INTEGER DEFAULT 0,
      'amount' REAL DEFAULT 0.0
    )
      ''');

    // departments table
    await db.execute('''
    CREATE TABLE IF NOT EXISTS "departments"(
      'id' INTEGER  PRIMARY KEY,
      'section_name' TEXT NOT NULL,
      'products_QTY'INTEGER DEFAULT 0,
       'amount' REAL DEFAULT 0,
       'products_sold'INTEGER DEFAULT 0,
    FOREIGN KEY ('id') REFERENCES groups (section_number)
    )
    ''');
//groups table
    await db.execute('''
    CREATE TABLE IF NOT EXISTS "groups"(
      'id' INTEGER  PRIMARY KEY,
      'group_name' TEXT NOT NULL,
      'section_number'INTEGER NOT NULL,
       'products_QTY'INTEGER DEFAULT 0,
       'amount' REAL DEFAULT 0,
       'products_sold'INTEGER DEFAULT 0
    )
    ''');
    await db.execute('''
    CREATE TABLE IF NOT EXISTS "unit_one_names"(
      'id' INTEGER  PRIMARY KEY,
      unit_names TEXT NOT NULL
    )
    ''');
    await db.execute('''
    CREATE TABLE IF NOT EXISTS "unit_two_names"(
      'id' INTEGER  PRIMARY KEY,
      unit_names TEXT NOT NULL
    )
    ''');
    await db.execute('''
    CREATE TABLE IF NOT EXISTS "unit_three_names"(
      'id' INTEGER  PRIMARY KEY,
      unit_names TEXT NOT NULL
    )
    ''');
//products table
    await db.execute('''
    CREATE TABLE IF NOT EXISTS "products"(
      'id' INTEGER  PRIMARY KEY,
      'image_dir' TEXT DEFAULT "",
      'ar_name' TEXT NOT NULL,
      'en_name' TEXT NOT NULL,
      'department' INTEGER NOT NULL,
      'group' INTEGER NOT NULL,
      "min_amount"INTEGER DEFAULT 0,
      "max_amount"INTEGER DEFAULT 0,
      "product_type"INTEGER(1) DEFAULT 0,
        "one_name" TEXT DEFAULT "unit 1",
        "one_price" REAL NOT NULL,
        "one_group_price" REAL NOT NULL,
        "one_piece_price" REAL NOT NULL,
        "one_code" TEXT NOT NULL,
        "one_quantity" INTEGER NOT NULL,
          "two_name" TEXT DEFAULT "unit 2",
          "two_price" REAL NOT NULL,
          "two_group_price" REAL NOT NULL,
          "two_piece_price" REAL NOT NULL,
          "two_code" TEXT NOT NULL,
          "two_quantity" INTEGER NOT NULL,
          "two_pieces_quantity"INTEGER NOT NULL,
            "three_name" TEXT DEFAULT "unit 3",
            "three_price" REAL NOT NULL,
            "three_group_price" REAL NOT NULL,
            "three_piece_price" REAL NOT NULL,
            "three_code" TEXT NOT NULL,
            "three_quantity" INTEGER NOT NULL,
            "three_pieces_quantity"INTEGER NOT NULL,
      FOREIGN KEY ('department') REFERENCES departments (id),
      FOREIGN KEY ('group') REFERENCES groups (id)
    )
      ''');
  }
}
