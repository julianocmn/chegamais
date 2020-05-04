import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';

class Mapa extends StatefulWidget {

  static final Mapa _Mapa = Mapa._internal();

  factory Mapa() {
    return _Mapa;
  }

  Mapa._internal();

  @override
  _MapaState createState() => _MapaState();
}

class _MapaState extends State<Mapa> {


  Position _currentPosition;
  String _mapStyle;
  Completer<GoogleMapController> _controller = Completer();

  Map<String, double> currentLocation = new Map();

  String error;

  double lat;
  double long;
  CameraPosition _kGooglePlex;

  @override
  void initState() {
    super.initState();

    _getCurrentLocation();

    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _kGooglePlex == null
        ? Container()
        : GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              controller.setMapStyle(_mapStyle);
            },
          );
  }

  _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
    setState(() {
      geolocator
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
          .then((Position position) {
        setState(() {
          _currentPosition = position;
          _kGooglePlex = CameraPosition(
              target:
                  LatLng(_currentPosition.latitude, _currentPosition.longitude),
              zoom: 15);
        });
      }).catchError((e) {
        print(e);
      });
    });
  }
}
