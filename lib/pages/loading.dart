import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:worldtimeapp/services/wordtime.dart';

class loading extends StatefulWidget {
  const loading({super.key});

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {
  var time = "Loading...";

  void setworldtime() async {
    Worldtime instance =
        Worldtime(location: 'London', flag: 'uk.png', url: 'Europe/London ');
    await instance.getdata();

    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDayTime':instance.isdaytime,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setworldtime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 48, 121),
      body: Center(
        child: SpinKitSpinningLines(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
