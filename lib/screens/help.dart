import 'package:cpss/services/location.dart';
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
        title: Text("Location Services"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on,
              size: 46.0,
              color: Colors.blue,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Get User Location",
              style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(message),
            ElevatedButton(
              onPressed: () {
                location.getCurrentLocation();
                setState(() {
                  message = location.locationMessage;
                });
              },
              child: Text("Get Current Location"),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue[500])),
            ),
          ],
        ),
      ),
    );
  }
}
