import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:salle_maps/services/services.dart';

import 'poi_view_model.dart';

class POIListViewModel extends ChangeNotifier {
  BitmapDescriptor pinLocationIcon;
  List<POIViewModel> pois = List<POIViewModel>();
  Set<Marker> markers = {};

  Future<void> fetchAllPOIs() async {
    final result = await WebService().fetchAllPOIs();
    this.pois = result.map((item) => POIViewModel(poi: item)).toList();

    this.pois.forEach((poi) {
      markers.add(
        Marker(
          markerId: MarkerId(poi.poiData.id),
          position: new LatLng(
            double.parse(poi.poiData.latitud),
            double.parse(poi.poiData.longitud),
          ),
          icon: pinLocationIcon,
        ),
      );
    });
    notifyListeners();
  }

  void loadCustomPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(20.0, 20.0)),
      'assets/custom_pin.png',
    );
  }
}
