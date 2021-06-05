import 'dart:convert';

import 'package:webandcrafts_coding_test/model/datamodel.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<DataModelList> fetchDetails() async {
    http.Response response;
    var url = Uri.parse("http://www.mocky.io/v2/5d565297300000680030a986");
    response = await http.get(url);
    var body;

    if (response.statusCode == 200) {
      body = json.decode(response.body);
      // print(body);
      return DataModelList.fromJson(body);
    } else {
      throw Exception("Unable to load data!");
    }
  }
}
