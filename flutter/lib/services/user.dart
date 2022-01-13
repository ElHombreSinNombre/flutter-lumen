import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:map/models/user.dart';

class UserService {
  Future<UserModel> getAll() async {
    var url = Uri.https('https://jsonplaceholder.typicode.com', 'albums');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error: ${response.statusCode}.');
    }
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
