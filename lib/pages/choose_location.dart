import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/wordtime.dart';

class Chooselocation extends StatefulWidget {
  const Chooselocation({super.key});

  @override
  State<Chooselocation> createState() => _ChooselocationState();
}

class _ChooselocationState extends State<Chooselocation> {

  List<Worldtime> locations = [
    Worldtime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    Worldtime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    Worldtime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    Worldtime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    Worldtime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    Worldtime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    Worldtime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    Worldtime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updatetime(index) async{

    Worldtime instance=locations[index];
    await instance.getdata();

    
    
    Navigator.pop(context,{
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDayTime':instance.isdaytime,
    });

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey, 
      appBar: AppBar(
        title: Text("Location"),
        backgroundColor: Colors.amberAccent,
      ),
      body:
        ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 2 ),
              child: Card(
                child: ListTile(onTap: (){
                  
                    updatetime(index);
                },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          },
      ),
    );
  }
}