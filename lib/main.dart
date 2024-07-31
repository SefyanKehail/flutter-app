import 'package:flutter/material.dart';
import 'package:flutter_app/weather-form.dart';
import './quiz.dart';
import './weather.dart';
import './gallery.dart'; // Import the new gallery.dart file

void main() => runApp(MaterialApp(
  home: MyApp(),
));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First App'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Text(
          'Hello',
          style: TextStyle(fontSize: 30),
          textAlign: TextAlign.center,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://media.licdn.com/dms/image/C4E03AQEAHGcl31MSHQ/profile-displayphoto-shrink_200_200/0/1647695750791?e=1727913600&v=beta&t=mAxjavkTWgLTGosCMwTY9Ce5VDdjbisgwO1f0i0G4_A'),
                ),
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.orange, Colors.white]),
              ),
            ),
            ListTile(
              title: Text(
                'Quiz',
                style: TextStyle(fontSize: 18),
              ),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Quiz()));
              },
            ),
            ListTile(
              title: Text(
                'Weather',
                style: TextStyle(fontSize: 18),
              ),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WeatherForm()));
              },
            ),
            ListTile(
              title: Text(
                'Gallery',
                style: TextStyle(fontSize: 18),
              ),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Gallery()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
