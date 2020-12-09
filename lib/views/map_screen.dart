import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'package:salle_maps/view_models/poi_list_view_model.dart';

class MapScreen extends StatefulWidget {
  MapScreen({Key key}) : super(key: key);

  @override
  _MapScreen createState() => new _MapScreen();
}

class _MapScreen extends State<MapScreen> {
  Completer<GoogleMapController> googleMapsController = Completer();

  static final LatLng laSalleCoords =
      LatLng(41.408746627104975, 2.130265356254578);

  final CameraPosition defaultPosition = CameraPosition(
    target: laSalleCoords,
    zoom: 20,
  );

  @override
  void initState() {
    super.initState();
    Provider.of<POIListViewModel>(context, listen: false).loadCustomPin();
    Provider.of<POIListViewModel>(context, listen: false).fetchAllPOIs();
  }

  @override
  Widget build(BuildContext context) {
    final poiListViewModel = Provider.of<POIListViewModel>(context);

    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: defaultPosition,
        markers: poiListViewModel.markers,
        onMapCreated: (GoogleMapController controller) {
          googleMapsController.complete(controller);
          setState(() {
            poiListViewModel.markers.addAll(poiListViewModel.markers);
            poiListViewModel.markers.add(
              Marker(
                markerId: MarkerId('default_marker'),
                position: laSalleCoords,
                icon: poiListViewModel.pinLocationIcon,
              ),
            );
          });
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('To LaSalle!'),
        icon: Icon(Icons.school),
      ),
    );
  }
}
