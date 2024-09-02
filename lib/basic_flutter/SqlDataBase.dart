import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDataBase{

  static Database? _database;
  Future<Database?>  get database async {
    if(_database == null){
      _database = await initalDataBase();
      return _database;
    }
    else{
      return _database;
    }

  }

  initalDataBase() async{
    var dataBasePath = await getDatabasesPath();
    String path=join(dataBasePath,"ecommerce.db");
    Database ecommerceDataBase = await openDatabase(path,onCreate: _onCreate,version: 8,onUpgrade: _onUpGrade);
    return ecommerceDataBase;
  }
  _onUpGrade(Database dataBase,int oldVersion,int newVersion){

  }
  _onCreate(Database dataBase,int version) async{
    await dataBase.execute('''
    CREATE TABLE 'USERS'(
    "id" INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT, 
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "username" TEXT NOT NULL
    )
    ''');
  }
  Future<List<Map>> readData(String sql) async{
    Database? dataBase = await database;
    List<Map> response = await dataBase!.rawQuery(sql);
    return response;
  }
  Future<bool> insertData(String sql) async {
    Database? dataBase = await database;

     await dataBase!.rawInsert(sql);
     return true;
  }
  deleteData(String sql) async{
    Database? dataBase = await database;
    int response = await dataBase!.rawDelete(sql);
    return response;
  }
  upDateData(String sql) async{
    Database? dataBase = await database;
    await dataBase!.rawUpdate(sql);
  }
  Future<void> deleteDatabase() async {
    var dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, "ecommerce.db");
    databaseFactory.deleteDatabase(path);
  }
}