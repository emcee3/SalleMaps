import 'package:flutter/material.dart';

import 'package:salle_maps/utils/extension_methods.dart';

import 'package:salle_maps/view_models/poi_view_model.dart';
import 'package:salle_maps/widgets/poi_list_tile.dart';

class POISearch extends SearchDelegate<POIViewModel> {
  final List<POIViewModel> pois;

  POISearch(this.pois);

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
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _findResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _findResults();
  }

  Widget _findResults() {
    final results = pois
        .where((poi) => poi.poiData.nombreEn.containsIgnoreCase(query))
        .toList();

    if (results.isEmpty) {
      return Center(child: Text('No data!'));
    }

    return ListView(
      children: results
          .asMap()
          .map((i, poi) => MapEntry(i, POIListTile(poi, i, _onTapResult)))
          .values
          .toList(),
    );
  }

  void _onTapResult() {
    print('onTapResult: tile tap');
  }
}
