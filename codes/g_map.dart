import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GMap extends StatefulWidget {
  GMap({Key key}) : super(key: key);

  @override
  _GMapState createState() => _GMapState();
}

class _GMapState extends State<GMap> {
  Set<Marker> _markers = HashSet<Marker>();
  Set<Polygon> _polygons = HashSet<Polygon>();
  Set<Polyline> _polylines = HashSet<Polyline>();
  Set<Circle> _circles = HashSet<Circle>();

  GoogleMapController _mapController;
  BitmapDescriptor _markerIcon;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setMarkerIcon();
    _setPolygonn();
    _setPolyline();
    _setCircles();
  }

  void _setMarkerIcon() async {
    _markerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(0.5, 0.5)), 'assets/homw.png');
  }

  void _setMapStyle() async {
    String style = await DefaultAssetBundle.of(context)
        .loadString('assets/ map_style.json');
    _mapController.setMapStyle(style);
  }

  void _setPolygonn() async {
    List<LatLng> polygonLatLongs = <LatLng>[];
    polygonLatLongs.add(LatLng(6.090598, 100.311042));
    polygonLatLongs.add(LatLng(6.090798, 100.321042));
    polygonLatLongs.add(LatLng(6.090298, 100.317042));
    polygonLatLongs.add(LatLng(6.090298, 100.320042));

    _polygons.add(Polygon(
      polygonId: PolygonId("0"),
      points: polygonLatLongs,
      fillColor: Colors.black,
      strokeWidth: 1,
    ));
  }

  void _setPolyline() async {
    List<LatLng> polylineLatLongs = <LatLng>[];
    polylineLatLongs.add(LatLng(6.090598, 100.411042));
    polylineLatLongs.add(LatLng(6.090798, 100.421042));
    polylineLatLongs.add(LatLng(6.090298, 100.417042));
    polylineLatLongs.add(LatLng(6.090298, 100.420042));

    _polylines.add(Polyline(
      polylineId: PolylineId("0"),
      points: polylineLatLongs,
      color: Colors.purple,
      width: 1,
    ));
  }

  void _setCircles() async {
    _circles.add(Circle(
        circleId: CircleId("0"),
        center: LatLng(6.090598, 100.311042),
        radius: 1000,
        strokeWidth: 2,
        fillColor: Color.fromRGBO(102, 51, 153, .5)));
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;

    setState(() {
      _markers.add(Marker(
        markerId: MarkerId("0"),
        position: LatLng(6.090598, 100.311042),
        infoWindow: InfoWindow(title: "Kuala Kedah", snippet: "My home town"),
        icon: _markerIcon,
      ));
    });
    _setMapStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(6.090598, 100.311042),
              zoom: 12,
            ),
            // markers: _markers,
            polygons: _polygons,
            polylines: _polylines,
            circles: _circles,
            myLocationEnabled: true,
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.fromLTRB(0, 0, 0, 32),
            child: Text('Coding with Curry'),
          )
        ],
      ),
    );
  }
}
