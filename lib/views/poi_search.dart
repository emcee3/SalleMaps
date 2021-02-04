import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:salle_maps/utils/extension_methods.dart';
import 'package:salle_maps/view_models/poi_list_view_model.dart';
import 'package:salle_maps/view_models/poi_view_model.dart';
import 'package:salle_maps/widgets/poi_list_tile.dart';

class POISearch extends SearchDelegate<POIListViewModel> {
  POIListViewModel poiListVM;

  POISearch(this.poiListVM);

  @override
  TextInputAction get textInputAction => TextInputAction.search;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        color: query.isEmpty ? Colors.grey : Colors.black,
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, poiListVM),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _findResults(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _findResults(context);
  }

  Widget _findResults(BuildContext context) {
    final results = poiListVM.pois
        .where((poi) => poi.poiData.nombreEn.containsIgnoreCase(query))
        .toList();

    poiListVM.poisToShow = List.from(results);

    if (results.isEmpty) {
      return Center(child: Text('No data!'));
    }

    return ListView(
      children: results
          .asMap()
          .map((i, poi) => MapEntry(
                i,
                POIListTile(poi, i, () => _onTapResult(context, poi)),
              ))
          .values
          .toList(),
    );
  }

  void _onTapResult(BuildContext context, POIViewModel poi) {
    poiListVM.poisToShow = [poi];
    close(context, poiListVM);
  }
}
