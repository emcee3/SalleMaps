import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:salle_maps/view_models/poi_list_view_model.dart';

import 'package:salle_maps/widgets/home_input_search.dart';
import 'package:salle_maps/widgets/poi_list_tile.dart';

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
          HomeInputSearch(showOrderOptions: true),
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
                itemCount: poiListViewModel.pois.length,
                itemBuilder: (BuildContext context, int index) {
                  final poi = poiListViewModel.pois[index];
                  return POIListTile(
                    poi,
                    index,
                    () => poiListViewModel.onMarkerTap(context, poi),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
