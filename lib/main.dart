import 'package:cpss/UI/buttonstyle.dart';
import 'package:cpss/screens/gmap.dart';
import 'package:cpss/screens/help.dart';
import 'package:cpss/services/alarm.dart';
import 'package:cpss/services/email.dart';
import 'package:cpss/services/scream.dart';
import 'package:cpss/services/url.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CPSS',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(title: 'CPSS Home'),
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
  Alarm alarm = Alarm();
  Mail mail = Mail();
  Scream scream = Scream();

  bool isSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton.icon(
                      style: raisedButtonStyle.copyWith(
                          backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.lightGreenAccent[400])),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => GMap()));
                      },
                      label: Text('Home',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      icon: Icon(
                        Icons.home,
                        size: 35.0,
                      ), //g_map
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton.icon(
                      style: raisedButtonStyle.copyWith(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blueAccent)),
                      onPressed: () {
                        mail.sendMail();
                        Fluttertoast.showToast(  
                            msg: 'Location is sent to your parent',  
                            toastLength: Toast.LENGTH_SHORT,  
                            gravity: ToastGravity.BOTTOM,  
                            backgroundColor: Colors.green,  
                            textColor: Colors.white  
                        );  
                      },
                      label: Text('Email'),
                      icon: Icon(
                        Icons.email,
                        size: 35.0,
                      ), //email
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton.icon(
                      style: raisedButtonStyle.copyWith(
                          backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.redAccent)),
                      onPressed: () {
                        alarm.isPlay ? alarm.stop() : alarm.start();
                      },
                      label: Text('Alarm'),
                      icon: Icon(
                        Icons.alarm,
                        size: 35.0,
                      ), //alarm
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton.icon(
                      style: raisedButtonStyle.copyWith(
                          backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.amberAccent)),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Help()));
                      },
                      label: Text('Help'),
                      icon: Icon(
                        Icons.warning,
                        size: 35.0,
                      ), //geolocation
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Scream Mode",
                      style: TextStyle(
                        fontSize: 30,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Transform.scale(
                    scale: 1.5,
                    child: Switch(
                        value: isSwitch,
                        onChanged: (value) {
                          setState(() {
                            isSwitch = value;
                            print(isSwitch);

                            isSwitch ? scream.start() : scream.stop();
                          });
                        }),
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: FloatingActionButton(
                onPressed: () {
                  customLaunch('tel:+60194919568');
                },
                tooltip: 'Call',
                child: Icon(Icons.phone),
                backgroundColor: Colors.greenAccent[400],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  customLaunch('sms:+60142591909');
                },
                tooltip: 'Call',
                child: Icon(Icons.sms),
                backgroundColor: Colors.cyan,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
