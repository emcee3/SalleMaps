import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:salle_maps/services/globals.dart';

import 'package:salle_maps/models/poi.dart';
import 'package:salle_maps/models/poi_result.dart';

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
}
