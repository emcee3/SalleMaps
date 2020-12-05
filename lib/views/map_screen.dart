import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  MapScreen({Key key}) : super(key: key);

  @override
  _MapScreen createState() => new _MapScreen();
}

class _MapScreen extends State<MapScreen> {
  BitmapDescriptor _pinLocationIcon;
  Set<Marker> _markers = {};
  Completer<GoogleMapController> _controller = Completer();
  static final LatLng _defaultPosition =
      LatLng(41.408746627104975, 2.130265356254578);

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: _defaultPosition,
    zoom: 20,
  );

  static final CameraPosition _kLake = CameraPosition(
    target: _defaultPosition,
    zoom: 18.5,
  );

  void _getCustomPin() async {
    _pinLocationIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(20.0, 20.0)),
      'assets/custom_pin.png',
    );
  }

  @override
  void initState() {
    super.initState();
    _getCustomPin();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          setState(() {
            _markers.add(
              Marker(
                markerId: MarkerId('default_marker'),
                position: _defaultPosition,
                icon: _pinLocationIcon,
              ),
            );
          });
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To LaSalle!'),
        icon: Icon(Icons.school),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
