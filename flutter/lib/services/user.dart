import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:map/models/user.dart';

class UserService {
  Future getAllSimple() async {
    var url = Uri.parse('http://10.0.2.2:80/users/all');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error: ${response.statusCode}.');
    }
  }

  Future<UserModel> getAll() async {
    var url = Uri.parse('http://10.0.2.2:80/users/all');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error: ${response.statusCode}.');
    }
  }

  Future<UserModel> find() async {
    //Placeholder
    return UserModel(
        id: 0,
        name: 'Test',
        email: 'Test',
        language: 'es',
        city: 'Test',
        latitude: 2,
        longitude: 1);
  }

  Future<UserModel> create() async {
    //Placeholder
    return UserModel(
        id: 0,
        name: 'Test',
        email: 'Test',
        language: 'es',
        city: 'Test',
        latitude: 2,
        longitude: 1);
  }

  Future<UserModel> update() async {
    //Placeholder
    return UserModel(
        id: 0,
        name: 'Test',
        email: 'Test',
        language: 'es',
        city: 'Test',
        latitude: 2,
        longitude: 1);
  }

  Future<UserModel> delete() async {
    //Placeholder
    return UserModel(
        id: 0,
        name: 'Test',
        email: 'Test',
        language: 'es',
        city: 'Test',
        latitude: 2,
        longitude: 1);
  }
}
