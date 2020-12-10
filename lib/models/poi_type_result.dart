import 'poi_type.dart';

class POITypeResult {
  POIType poiType;

  POITypeResult({this.poiType});

  POITypeResult.fromJson(Map<String, dynamic> json) {
    poiType =
        json['POIType'] != null ? new POIType.fromJson(json['POIType']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.poiType != null) {
      data['POIType'] = this.poiType.toJson();
    }
    return data;
  }
}
