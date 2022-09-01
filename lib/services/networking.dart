// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unused_local_variable
import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  late String uri;

  Networking(this.uri);

  Future getDatafromApi() async {
    http.Response response = await http.get(
      Uri.parse(uri),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
