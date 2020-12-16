import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'package:salle_maps/view_models/poi_list_view_model.dart';
import 'package:salle_maps/widgets/filters_card.dart';
import 'package:salle_maps/widgets/home_input_search.dart';

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
    zoom: 13,
  );

  @override
  void initState() {
    super.initState();
    Provider.of<POIListViewModel>(context, listen: false).loadCustomPin();
    Provider.of<POIListViewModel>(context, listen: false).fetchAllPOIs();
    Provider.of<POIListViewModel>(context, listen: false).fetchPOITypes();
  }

  @override
  Widget build(BuildContext context) {
    final poiListViewModel = Provider.of<POIListViewModel>(context);
    poiListViewModel.loadMapContext(context);

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: defaultPosition,
            markers: poiListViewModel.markers,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            mapToolbarEnabled: false,
            zoomControlsEnabled: false,
            onMapCreated: (GoogleMapController controller) {
              googleMapsController.complete(controller);
            },
          ),
          HomeInputSearch(showOrderOptions: false),
        ],
      ),
      floatingActionButton: _buildFABs(poiListViewModel),
    );
  }

  Column _buildFABs(POIListViewModel poiListViewModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () => openFilters(poiListViewModel),
          child: Icon(
            Icons.layers_outlined,
            color: Colors.grey[900],
          ),
          backgroundColor: Colors.white,
        ),
        SizedBox(
          height: 10,
        ),
        FloatingActionButton(
          onPressed: () =>
              poiListViewModel.goToCurrentLocation(googleMapsController),
          child: Icon(Icons.my_location),
          heroTag: 'fabCurrentLocation',
        ),
      ],
    );
  }

  void openFilters(POIListViewModel poiListViewModel) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return ChangeNotifierProvider<POIListViewModel>.value(
          value: poiListViewModel,
          child: FiltersCard(),
        );
      },
    );
  }
}
