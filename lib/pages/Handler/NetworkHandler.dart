import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class NetworkHandler {
  // String baseurl = "https://test-app-3362.herokuapp.com";
  // String baseurl = "https://pleasant-trunks-bear.cyclic.app";
  String baseurl = "https://3b8b-103-244-121-12.ngrok-free.app";
  var log = Logger();

  Future<dynamic> get(String url) async {
    var response = await http.get(Uri.parse(url));
    log.i(response.body);
    log.i(response.statusCode);
  }

  Future<dynamic> post(String url, body) async {
    var response = await http.post(

        Uri.parse(baseurl+url),
        body: jsonEncode(body),headers: {"Content-Type" :"application/json"});
    if (response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 403) {
   // var data = jsonDecode(response.body);
   //
   //
   // print("-=-=-=-=${data}");
      return jsonDecode(response.body);
    } else {
      print("222222");
    }
    print(response.body);
    print(response.statusCode);
  }


}
