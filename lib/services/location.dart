import 'package:geolocator/geolocator.dart';

class Location {
  String locationMessage = "";
  var position;
  var lastPosition;

  void getCurrentLocation() async {
    position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    lastPosition = await Geolocator().getLastKnownPosition();

    print(lastPosition);

    locationMessage =
        "Latitude: ${position.latitude}, Longitude: ${position.longitude}";
  }
}
