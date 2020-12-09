import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewModel extends ChangeNotifier {
  BitmapDescriptor pinLocationIcon;
  Set<Marker> markers = {};
  Completer<GoogleMapController> googleMapsController = Completer();

  static final LatLng laSalleCoords =
      LatLng(41.408746627104975, 2.130265356254578);

  final CameraPosition defaultPosition = CameraPosition(
    target: laSalleCoords,
    zoom: 20,
  );

  final CameraPosition laSallePosition = CameraPosition(
    target: laSalleCoords,
    zoom: 18.5,
  );

  void getCustomPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(20.0, 20.0)),
      'assets/custom_pin.png',
    );
  }

  Future<void> goToLaSalle() async {
    final GoogleMapController controller = await googleMapsController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(laSallePosition));
  }
}
