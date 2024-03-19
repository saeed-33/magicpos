import '../database/initialize_database.dart';

//todo insert product
class ProductsFunctions {
  PosData dp = PosData();
  Future<List<Map>> displayData(
      int index, String department, String searchText) async {
    switch (index) {
      case 0:
        {
          return _getGroups(department, searchText);
        }
      case 1:
        {
          return _getDepartments(searchText);
        }
      case 2:
        {
          return _getUnitOneNames(searchText);
        }
      case 3:
        {
          return _getUnitTwoNames(searchText);
        }
      case 4:
        {
          return _getUnitThreeNames(searchText);
        }
      default:
        {
          return [];
        }
    }
  }

  Future<void> insertData(int index, String data, String department) async {
    switch (index) {
      case 0:
        {
          await _insertGroups(data, department);

          break;
        }
      case 1:
        {
          await _insertDepartments(data);
          break;
        }
      case 2:
        {
          await _insertUnitOneName(data);
          break;
        }
      case 3:
        {
          await _insertUnitTwoName(data);
          break;
        }
      case 4:
        {
          await _insertUnitThreeName(data);
          break;
        }
      default:
        {
          break;
        }
    }
  }

  Future<List<Map>> _getDepartments(String searchText) async {
    List<Map> response;
    response = await dp.readData(
        "SELECT * FROM departments WHERE section_name='%$searchText%'");
    if (response.isEmpty)
      return [];
    else
      return response;
  }

  Future<List<Map>> _getGroups(String department, String searchText) async {
    List<Map> response;
    List<Map> helper = await dp
        .readData("SELECT * FROM departments WHERE section_name='$department'");
    response = await dp.readData(
        "SELECT * FROM groups WHERE section_number=${helper[0]['id']} AND group_name='%$searchText%'");
    if (response.isEmpty)
      return [];
    else
      return response;
  }

  Future<List<Map>> _getUnitOneNames(String searchText) async {
    List<Map> response;
    response = await dp.readData(
        "SELECT * FROM unit_one_names where unit_names='%$searchText%'");
    if (response.isEmpty)
      return [];
    else
      return response;
  }

  Future<List<Map>> _getUnitTwoNames(String searchText) async {
    List<Map> response;
    response = await dp.readData(
        "SELECT * FROM unit_two_names where unit_names='%$searchText%'");
    if (response.isEmpty)
      return [];
    else
      return response;
  }

  Future<List<Map>> _getUnitThreeNames(String searchText) async {
    List<Map> response;
    response = await dp.readData(
        "SELECT * FROM unit_three_names where unit_names='%$searchText%'");
    if (response.isEmpty)
      return [];
    else
      return response;
  }

  Future<void> _insertGroups(String data, String department) async {
    List<Map> response = await dp
        .readData("SELECT * FROM departments WHERE section_name='$department'");
    await dp.insertData(
        "INSERT INTO groups (group_name,section_number)VALUES('$data',${response[0]['id']}) ");
  }

  Future<void> _insertDepartments(String data) async {
    await dp
        .insertData("INSERT INTO departments (section_name)VALUES('$data')");
  }

  Future<void> _insertUnitOneName(String data) async {
    await dp
        .insertData("INSERT INTO unit_one_names (unit_names)VALUES('$data')");
  }

  Future<void> _insertUnitTwoName(String data) async {
    await dp
        .insertData("INSERT INTO unit_two_names (unit_names)VALUES('$data')");
  }

  Future<void> _insertUnitThreeName(String data) async {
    await dp
        .insertData("INSERT INTO unit_three_names (unit_names)VALUES('$data')");
  }
}
