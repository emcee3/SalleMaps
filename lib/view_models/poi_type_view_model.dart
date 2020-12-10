import 'package:flutter/material.dart';

import 'package:salle_maps/models/poi_type.dart';

class POITypeViewModel extends ChangeNotifier {
  final POIType poiType;

  POITypeViewModel({this.poiType});

  String get id => poiType.id;
  String get tipoEs => poiType.tipoEs;
  String get tipoEn => poiType.tipoEn;
  String get tipoCa => poiType.tipoCa;
  String get explicacionEs => poiType.explicacionEs;
  String get explicacionEn => poiType.explicacionEn;
  String get explicacionCa => poiType.explicacionCa;
}
