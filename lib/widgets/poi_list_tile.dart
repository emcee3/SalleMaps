import 'package:flutter/material.dart';

import 'package:salle_maps/view_models/poi_view_model.dart';

class POIListTile extends StatelessWidget {
  final POIViewModel poi;
  final int index;
  final Function onTapPOI;

  POIListTile(this.poi, this.index, this.onTapPOI);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(poi.poi.data.image),
      ),
      tileColor: Colors.white,
      title: Text(poi.poi.data.nombreEn,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headline5),
      subtitle: Text(
        poi.poi.data.informacionEn,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.subtitle1,
      ),
      onTap: () {
        onTapPOI();
      },
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}
