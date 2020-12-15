import 'package:flutter/material.dart';

import 'package:salle_maps/view_models/poi_list_view_model.dart';
import 'package:salle_maps/view_models/poi_type_view_model.dart';

class FiltersCard extends StatefulWidget {
  final POIListViewModel vm;

  FiltersCard({Key key, @required this.vm}) : super(key: key);

  @override
  _FiltersCardState createState() => _FiltersCardState();
}

class _FiltersCardState extends State<FiltersCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Filter by point of interest type:',
              style: Theme.of(context).textTheme.headline6,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: widget.vm.poiTypes
                    .map((typeVM) => _buildTypeOption(typeVM.tipoEn))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypeOption(String label) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Material(
            elevation: 2.0,
            shape: CircleBorder(),
            child: Container(
              width: 60.0,
              height: 60.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [BoxShadow(blurRadius: 1.0)],
              ),
              child: Icon(Icons.hotel),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(label, style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
