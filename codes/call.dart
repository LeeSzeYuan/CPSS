import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print(' could not launch $command');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                ElevatedButton(
                    onPressed: () {
                      customLaunch('https://google.com');
                    },
                    child: Text('URL')),
                ElevatedButton(
                    onPressed: () {
                      customLaunch(
                          'mailto:your@gmail.com?subject=test%20subject&body=test%20body');
                    },
                    child: Text('EMAIL')),
                ElevatedButton(
                    onPressed: () {
                      customLaunch('tel:+60194919568');
                    },
                    child: Text('PHONE')),
                ElevatedButton(
                    onPressed: () {
                      customLaunch('sms:+60142591909');
                    },
                    child: Text('SMS')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
