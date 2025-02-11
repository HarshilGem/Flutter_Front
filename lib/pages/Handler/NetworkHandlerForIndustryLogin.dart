import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class NetworkHandlerLogin {
  // String baseurl = " https://f40a-2409-4041-6ebb-6f20-d09f-f36e-c560-5af1.in.ngrok.io";
  String baseurl = "https://pleasant-trunks-bear.cyclic.app";
  var log = Logger();

  Future<dynamic> get(String url) async {
    var response = await http.get(Uri.parse(url));
    log.i(response.body);
    log.i(response.statusCode);
  }

  Future<http.Response> post(String url, body) async {
    var response = await http.post(

        Uri.parse(baseurl+url),
        body: jsonEncode(body),headers: {"Content-Type" :"application/json"});
  return response;
    print(response.body);
    print(response.statusCode);
  }


}
