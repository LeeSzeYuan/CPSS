import 'package:cpss/services/location.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  Location location = Location();
  String message = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    location.getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    location.getCurrentLocation();
    message = location.locationMessage;

    return Scaffold(
      appBar: AppBar(
        title: Text("Emergency Button"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.local_police,
              size: 200.0,
              color: Colors.blue[400],
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Ask for Help!",
              style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(message),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  location.getCurrentLocation();
                  setState(() {
                    message = location.locationMessage;
                  });
                  Fluttertoast.showToast(  
                      msg: 'Help is coming!',  
                      toastLength: Toast.LENGTH_SHORT,  
                      gravity: ToastGravity.BOTTOM,  
                      backgroundColor: Colors.red,  
                      textColor: Colors.white  
                  ); 
                },
                child: Text("Send Help", style: TextStyle(fontSize: 20, color: Colors.white),),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red[600])),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
