import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:core';
import '../models/Message.dart';
import '../models/User.dart';

class connectAPI_Request {
  Future<List<Map<String, dynamic>?>> getMessageModels() async {
    var client = http.Client();

    final response = await http.get(Uri.parse(
        "http://10.0.2.2:6060/balance/?userId=cryptouser&action=readBalance&from=2022-05-30&to=2022-05-30T07:34:24.847Z"));
    if (response.statusCode == 200) {
      //List<Message> _model = ModelAPI.fromJson(json);
      var parsed = jsonDecode(response.body);
      Map<String, dynamic> map = jsonDecode(response.body);

      Message messageInfo = Message.fromJson(jsonDecode(response.body));
      print(messageInfo);
      return List<Map<String, dynamic>?>.from(
          jsonDecode(response.body)["message"]);
      //return _model;
    } else if (response.statusCode == 404) {
      throw Exception('Not found');
    } else {
      throw Exception('');
    }
  }

  Future<List<User>?> fetchUser() async {
    var client = http.Client();
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    if (response.statusCode == 200) {
      List<User> _model = UserFromJson(response.body);
      return _model;
    } else if (response.statusCode == 404) {
      throw Exception('Not found');
    } else {
      throw Exception('');
    }
  }
}
