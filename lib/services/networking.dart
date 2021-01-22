import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  String url;
  NetworkHelper(this.url);

  Future<dynamic> getData() async {
    http.Response response = await http.get(url);
    print(response.statusCode.toString() + "Response CODE");
    if (response.statusCode == 200) {
      String data = response.body;

      var whetherData = jsonDecode(data);
      print(whetherData);
      return whetherData;
    } else {
      print(response.statusCode);
    }
  }
}
