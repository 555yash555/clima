import 'package:http/http.dart' as http;
import 'dart:convert';

String api_key = '086a1344c03a619bc92f33f900395a9a';

class Networkingg {
  final String url;
  Networkingg(this.url);

  Future getdata() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var api_result = jsonDecode(response.body);
      return api_result;
    } else {
      return response.statusCode;
    }
  }
}
