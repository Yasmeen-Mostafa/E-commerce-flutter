import 'dart:convert';
import 'dart:ffi';
import 'package:flutter_application_1/domain/api.dart';
import 'package:http/http.dart' as http;

class DataFromApi {
  Future<List<ApiFormat>> fetchData() async {
    var response = await http.get(
        Uri.parse('https://62d4154fcd960e45d452f790.mockapi.io/api/article'));
    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      var data =
          (jsonResponse).map((item) => ApiFormat.createObj(item)).toList();
      print(data);
      return data;
    } else {
      throw Exception('Error');
    }
  }
}
