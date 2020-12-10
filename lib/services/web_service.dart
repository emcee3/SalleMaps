import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:salle_maps/services/globals.dart';

import 'package:salle_maps/models/poi_result.dart';
import 'package:salle_maps/models/poi_type_result.dart';

import 'package:salle_maps/models/poi.dart';
import 'package:salle_maps/models/poi_type.dart' as poiType;

class WebService {
  Future<List<POI>> fetchAllPOIs() async {
    final response = await http.get('${Global.BASE_URL}/poi.json');

    if (response.statusCode == 200) {
      POIListResult poiListResult =
          POIListResult.fromJson(jsonDecode(response.body));
      return poiListResult.pois;
    } else {
      throw Exception('Failed to fetch POIs.');
    }
  }

  Future<List<poiType.POIType>> fetchPOITypes() async {
    final response = await http.get('${Global.BASE_URL}/poi_type.json');

    if (response.statusCode == 200) {
      final jsonArray = jsonDecode(response.body);
      List<poiType.POIType> poiTypes = List<poiType.POIType>();
      for (Map element in jsonArray)
        poiTypes.add(POITypeResult.fromJson(element).poiType);

      return poiTypes;
    } else {
      throw Exception('Failed to fetch POI Types.');
    }
  }
}
