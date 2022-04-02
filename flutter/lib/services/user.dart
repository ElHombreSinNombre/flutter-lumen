import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:map/models/user.dart';

class UserService {
  //Funciona
  Future<List<UserModel>> getAll() async {
    var url = Uri.parse('http://10.0.2.2:80/users/all');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => UserModel.fromJson(data)).toList();
    } else {
      throw Exception('Error: ${response.statusCode}.');
    }
  }

  //Funciona
  Future<UserModel> edit(id) async {
    var url = Uri.parse('http://10.0.2.2:80/users/edit/' + id);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error: ${response.statusCode}.');
    }
  }

  Future<UserModel> create(form) async {
    var url = Uri.parse('http://10.0.2.2:80/users/create/');
    var response = await http.post(url, body: form);
    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error: ${response.statusCode}.');
    }
  }

  Future<UserModel> update(id, form) async {
    var url = Uri.parse('http://10.0.2.2:80/users/update/' + id);
    var response = await http.post(url, body: form);
    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error: ${response.statusCode}.');
    }
  }

  //FUnciona
  Future delete(id) async {
    var url = Uri.parse('http://10.0.2.2:80/users/delete/' + id);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error: ${response.statusCode}.');
    }
  }
}
