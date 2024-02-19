import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Worldtime {
  String location = "";
  String time = "";
  String flag = "";
  String url = "";
  bool isdaytime=true;

  Worldtime({required this.location, required this.flag, required this.url});

  Future<void> getdata() async {
    try {
      http.Response response = await http
          .get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //  print(data);

      String date = data['datetime'];
      String offset = data['utc_offset'].toString().substring(1, 3);

      DateTime now = DateTime.parse(date);
      now = now.add(Duration(hours: int.parse(offset)));
      
      isdaytime = now.hour>6 && now.hour<20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print("Error: $e");
    }
  }
}
