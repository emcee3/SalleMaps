import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:salle_maps/services/globals.dart';

import 'package:salle_maps/models/poi_result.dart';
import 'package:salle_maps/models/poi_type_result.dart';

import 'package:salle_maps/models/poi.dart';
import 'package:salle_maps/models/poi_type.dart' as poiType;

class WebService {
  Future<List<POI>> fetchAllPOIs() async {
    // final response = await http.get('${Global.BASE_URL}/poi.json');

    // if (response.statusCode == 200) {
    //   POIListResult poiListResult =
    //       POIListResult.fromJson(jsonDecode(response.body));
    //   return poiListResult.pois;
    // } else {
    //   throw Exception('Failed to fetch POIs.');
    // }

    return POIListResult.fromJson(jsonDecode('''{
    "status": "OK",
    "hora": "20201205151103",
    "pois": [
        {
            "poi": {
                "id": "634",
                "nombre_es": "Camp Nou",
                "nombre_en": "Camp Nou",
                "nombre_ca": "Camp Nou",
                "informacion_es": "Campo del FCB",
                "informacion_en": "FCB Stadium",
                "informacion_ca": "Camp del FCB",
                "direccion": "C. d'Arístides Maillol, 12, 08028 Barcelona",
                "longitud": "2.1225603",
                "latitud": "41.3810016",
                "codigo": "FCB2021",
                "direccion_barrio": "Les Corts",
                "direccion_numero": "12",
                "url_info": "http://www.fcb.cat",
                "image": "https://www.fcbarcelona.com/fcbarcelona/photo/2018/06/07/fde8dc92-66b3-48f3-9996-22008151b267/DanHlskWsAADKM0.jpg"
            },
            "status": {
                "estado_es": "Abierto",
                "estado_en": "Open",
                "estado_ca": "Obert"
            },
            "type": {
                "id": "3"
            }
        },
        {
            "poi": {
                "id": "635",
                "nombre_es": "LaSalle",
                "nombre_en": "LaSalle",
                "nombre_ca": "LaSalle",
                "informacion_es": "LaSalle Campus",
                "informacion_en": "LaSalle Campus",
                "informacion_ca": "LaSalle Campus",
                "direccion": "C. dels Quatre Camins, 10, 08022 Barcelona",
                "longitud": "2.130278546570955",
                "latitud": "41.40871405813797",
                "codigo": "LSURL",
                "direccion_barrio": "Bonanova",
                "direccion_numero": "42",
                "url_info": "https://www.salleurl.edu/",
                "image": "https://www.salleurl.edu/sites/all/themes/lasalle2016beta/logos/salle_en.png"
            },
            "status": {
                "estado_es": "Abierto",
                "estado_en": "Open",
                "estado_ca": "Obert"
            },
            "type": {
                "id": "2"
            }
        },
        {
            "poi": {
                "id": "636",
                "nombre_es": "Hotel W",
                "nombre_en": "Hotel W",
                "nombre_ca": "Hotel W",
                "informacion_es": "W Barcelona",
                "informacion_en": "W Barcelona",
                "informacion_ca": "W Barcelona",
                "direccion": "Plaça Rosa Del Vents 1, Final, Passeig de Joan de Borbó, 08039 Barcelona",
                "longitud": "2.190019689588919",
                "latitud": "41.368383394687534",
                "codigo": "HW",
                "direccion_barrio": "La Barceloneta",
                "direccion_numero": "1",
                "url_info": "https://www.marriott.com/hotels/travel/bcnwh-w-barcelona/?scid=bb1a189a-fec3-4d19-a255-54ba596febe2&y_source=1_Mjc4MjIxOC03MTUtbG9jYXRpb24uZ29vZ2xlX3dlYnNpdGVfb3ZlcnJpZGU%3D",
                "image": "https://offloadmedia.feverup.com/barcelonasecreta.com/wp-content/uploads/2020/05/09100819/hotel-vela-w-barcelona-1024x597.jpg"
            },
            "status": {
                "estado_es": "Abierto",
                "estado_en": "Open",
                "estado_ca": "Obert"
            },
            "type": {
                "id": "1"
            }
        }
    ]
}''')).pois;
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
