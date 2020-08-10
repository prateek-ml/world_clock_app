import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;


    String bgImage = data['isDay'] ? 'imgs/day.jpg' : 'imgs/night.jpg';
    Color bgColor = data['isDay'] ? Colors.blue[600] : Colors.blue[800];
    Color textColor = data['isDay'] ? Colors.grey[900] : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(image: DecorationImage(
              image: AssetImage(bgImage),
              fit: BoxFit.cover
            )),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 100, 0, 0),
              child: Column(
                children: [
                  FlatButton.icon(
                      onPressed: ()async{
                        dynamic result = Navigator.pushNamed(context, '/location');
                        if(result != null) {
                          setState(() {
                            data = {
                              'time': result['time'],
                              'location': result['location'],
                              'isDay': result['isDay'],
                              'flag': result['flag']
                            };
                          });
                        }
                      },
                      icon: Icon(
                        Icons.edit_location,
                        color: Colors.grey[200]
                      ),
                      label: Text(
                        'Change Location',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                  ),
                  SizedBox(height: 80.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['location'],
                        style: TextStyle(
                          color: textColor,
                          fontSize: 28,
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 66.0,
                      color: textColor
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
