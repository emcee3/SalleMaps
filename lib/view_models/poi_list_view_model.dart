import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'package:salle_maps/services/services.dart';
import 'package:salle_maps/widgets/poi_card.dart';

import 'poi_view_model.dart';
import 'poi_type_view_model.dart';

class POIListViewModel extends ChangeNotifier {
  BitmapDescriptor pinLocationIcon;
  List<POIViewModel> pois = List<POIViewModel>();
  List<POITypeViewModel> poiTypes = List<POITypeViewModel>();
  Set<Marker> markers = {};

  bool _isDisposed = false;

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    // * This is to prevent from using POIListViewModel after being disposed.
    if (!_isDisposed) super.notifyListeners();
  }

  Future<void> fetchAllPOIs(BuildContext context) async {
    final result = await WebService().fetchAllPOIs();
    this.pois = result.map((item) => POIViewModel(poi: item)).toList();

    this.pois.forEach((poi) {
      markers.add(
        Marker(
          markerId: MarkerId(poi.poiData.id),
          icon: pinLocationIcon,
          position: new LatLng(
            double.parse(poi.poiData.latitud),
            double.parse(poi.poiData.longitud),
          ),
          onTap: () => onPoiTap(poi, context),
          infoWindow: InfoWindow(
            title: poi.poiData.nombreEn,
            snippet: poi.poiData.informacionEn,
          ),
        ),
      );
    });
    notifyListeners();
  }

  onPoiTap(POIViewModel poi, BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return POICard(poi: poi);
      },
    );
  }

  Future<void> fetchPOITypes() async {
    final result = await WebService().fetchPOITypes();
    this.poiTypes =
        result.map((item) => POITypeViewModel(poiType: item)).toList();
    notifyListeners();
  }

  void goToCurrentLocation(Completer<GoogleMapController> gmController) async {
    final GoogleMapController controller = await gmController.future;
    LocationData currentLocation;
    var location = new Location();
    try {
      currentLocation = await location.getLocation();
    } on Exception {
      currentLocation = null;
    }

    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(
          currentLocation.latitude,
          currentLocation.longitude,
        ),
        zoom: 17.0,
      ),
    ));
  }

  void loadCustomPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(20.0, 20.0)),
      'assets/custom_pin.png',
    );
  }
}
