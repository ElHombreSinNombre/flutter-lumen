import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:map/models/user.dart';

class UserService {
  Future<List> getAllExample() async {
    var url = Uri.parse('http://jsonplaceholder.typicode.com/users');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error: ${response.statusCode}.');
    }
  }

  Future<UserModel> getAll() async {
    return UserModel('Test', 'Test', 'Test', 'Test', 'Test', 2, 1);
  }

  Future<UserModel> find() async {
    //Placeholder
    return UserModel('Test', 'Test', 'Test', 'Test', 'Test', 2, 1);
  }

  Future<UserModel> create() async {
    //Placeholder
    return UserModel('Test', 'Test', 'Test', 'Test', 'Test', 2, 1);
  }

  Future<UserModel> update() async {
    //Placeholder
    return UserModel('Test', 'Test', 'Test', 'Test', 'Test', 2, 1);
  }

  Future<UserModel> delete() async {
    //Placeholder
    return UserModel('Test', 'Test', 'Test', 'Test', 'Test', 2, 1);
  }
}
