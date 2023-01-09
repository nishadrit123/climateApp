import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  const Network({required this.url});
  final String url;

  Future getData() async{
    http.Response response = await http.get(Uri.parse(url));
    //ignore: avoid_print
    if (response.statusCode == 200){
      String data = response.body;
      return jsonDecode(data);
    }
    else{
      //ignore: avoid_print
      print(response.statusCode);
    }
  }
}