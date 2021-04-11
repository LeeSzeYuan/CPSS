import 'package:flutter/material.dart';
// import 'package:cpss/codes/g_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'g_map.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Coding with Curry",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'Coding with Curry'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coding with Curry'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Coding with Curry',
                style: TextStyle(fontSize: 42),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'This is the master branch. As you can see, there is not a lot here. Each branch relates to a specific Flutter topic discussed on the videos. Happy browsing!',
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.map),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => GMap()));
        },
      ),
    );
  }
}
