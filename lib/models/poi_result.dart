import 'poi.dart';

class POIListResult {
  String status;
  String hora;
  List<POI> pois;

  POIListResult({this.status, this.hora, this.pois});

  POIListResult.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    hora = json['hora'];
    if (json['pois'] != null) {
      pois = new List<POI>();
      json['pois'].forEach((v) {
        pois.add(new POI.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['hora'] = this.hora;
    if (this.pois != null) {
      data['pois'] = this.pois.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
