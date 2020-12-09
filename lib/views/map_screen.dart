import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../view_models/map_view_model.dart';

class MapScreen extends StatefulWidget {
  MapScreen({Key key}) : super(key: key);

  @override
  _MapScreen createState() => new _MapScreen();
}

class _MapScreen extends State<MapScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<MapViewModel>(context, listen: false).getCustomPin();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<MapViewModel>(context);
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: vm.defaultPosition,
        markers: vm.markers,
        onMapCreated: (GoogleMapController controller) {
          vm.googleMapsController.complete(controller);
          setState(() {
            vm.markers.add(
              Marker(
                markerId: MarkerId('default_marker'),
                position: MapViewModel.laSalleCoords,
                icon: vm.pinLocationIcon,
              ),
            );
          });
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: vm.goToLaSalle,
        label: Text('To LaSalle!'),
        icon: Icon(Icons.school),
      ),
    );
  }
}
