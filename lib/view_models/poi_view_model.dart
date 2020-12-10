import 'package:salle_maps/models/poi.dart';

class POIViewModel {
  final POI poi;

  POIViewModel({this.poi});

  POIData get poiData => this.poi.data;
  POIStatus get poiStatus => this.poi.status;
  POIType get poiType => this.poi.type;
}
