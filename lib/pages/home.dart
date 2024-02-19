import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  Map? data;

  @override
  Widget build(BuildContext context) {

    if (data!=null) {
      data = data;
    } else {
      data = ModalRoute.of(context)?.settings.arguments as Map?;
    }
    print(data);

    var bgimage=data?['isDayTime'] ? 'day.jpg' : 'night.jpg';
    var bgcolor= data?['isDayTime'] ? Colors.blue[300] : Colors.indigo[300];


    return Scaffold(
      backgroundColor: bgcolor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgimage'),
            fit: BoxFit.fill,
            ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(onPressed: ()async{
              dynamic result= await Navigator.pushNamed(context, '/location');

              setState(() {
                data = {
                  'location' : result['location'],
                  'time' : result['time'],
                  'isDayTime': result['isDayTime'],
                  'flag' : result['flag'],
                };
              });
            },
             icon: Icon(
              Icons.edit_location,
              color:Colors.grey ,
             
             ),
              label: Text(
                "Edit Location",
                style: TextStyle(
                  color: Colors.white,
                ),
                )
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(data?['location'],
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    
                  ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Text(data?['time'],
              style: TextStyle(
                fontSize: 50,  
                color: Colors.white,
              ),
              ),
          ],
        ),
      ),
    );
  }
}

