import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:salle_maps/view_models/poi_list_view_model.dart';
import 'package:salle_maps/view_models/poi_view_model.dart';

import 'package:salle_maps/widgets/home_input_search.dart';

class ListScreen extends StatefulWidget {
  ListScreen({Key key}) : super(key: key);

  @override
  _ListScreen createState() => new _ListScreen();
}

class _ListScreen extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    final poiListViewModel = Provider.of<POIListViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeInputSearch(),
          Divider(color: Colors.grey, thickness: 1),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Points of interest found:',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.grey[800],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView.builder(
                itemCount: 10, //poiListViewModel.pois.length,
                itemBuilder: (BuildContext context, int index) {
                  final poi = poiListViewModel.pois[0];
                  return buildPoiListTile(
                      poi, context, poiListViewModel, index);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildPoiListTile(POIViewModel poi, BuildContext context,
      POIListViewModel poiListViewModel, int index) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(poi.poi.data.image),
      ),
      tileColor: Colors.white,
      title: Text(
        poi.poi.data.nombreEn,
        style: Theme.of(context).textTheme.headline5,
      ),
      subtitle: Text(
        poi.poi.data.informacionEn,
        style: Theme.of(context).textTheme.subtitle1,
      ),
      onTap: () => poiListViewModel.onPoiTap(
        poi,
        context,
      ),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}
