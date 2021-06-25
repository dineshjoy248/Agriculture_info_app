import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Googelmapscreen  extends StatefulWidget {
  static const routeName = '/googelmap';
  @override
  _GoogelmapscreenState createState() => _GoogelmapscreenState();
}

class _GoogelmapscreenState extends State<Googelmapscreen > {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('location'),),
        body: GoogleMap(initialCameraPosition: CameraPosition(target: LatLng(39.309297762347876, 78.4652344101111),
        zoom: 15,
        ),
        ),
    );
  }
}